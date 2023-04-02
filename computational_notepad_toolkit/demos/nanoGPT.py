import torch
import torch.nn as nn
from torch.nn import functional as F
import os

HOME_DIR = os.getenv("HOME")

def load_data(path_to_txt_file):
    with open(path_to_txt_file, 'r', encoding='utf-8') as f:
        contents = f.read()
    
    return contents

a = load_data(os.path.join(HOME_DIR, 'docs/data_text/tiny_shakepeare.txt'))

chars = sorted(list(set(a)))
vocab_size = len(chars)
print(''.join(chars))

ctoi = {c:i for i,c in enumerate(chars)}
itoc = {i:c for i,c in enumerate(chars)}

def encode(input_str):  return [ctoi[c] for c in list(input_str)]
def decode(input_list): return ''.join([itoc[i] for i in input_list])

data = torch.tensor(encode(a), dtype=torch.long)

train_frac = 0.9
n_train = int(train_frac*data.shape[0])

train_data = data[:n_train]
val_data   = data[n_train:]

torch.manual_seed(1337)
block_size = 8
batch_size = 4

def get_batch(split):
    data = train_data if split=='train' else val_data
    idxs = torch.randint(len(data) - block_size, (batch_size,))
    x = torch.stack([data[idx:idx+block_size] for idx in idxs])
    y = torch.stack([data[idx+1:idx+block_size+1] for idx in idxs])
    return x,y

x,y = get_batch('train')

"""
x has shape batch_size x block_size, e.g. B x T
e.g. x =
tensor([[53, 59,  6,  1, 58, 56, 47, 40],
        [49, 43, 43, 54,  1, 47, 58,  1],
        [13, 52, 45, 43, 50, 53,  8,  0],
        [ 1, 39,  1, 46, 53, 59, 57, 43]])

From this point on, C will refer to the vocab_size

"""
class BigramModel(nn.Module):

    def __init__(self, vocab_size):
        super().__init__()
        self.token_embedding_table = nn.Embedding(vocab_size, vocab_size)
    
    def forward(self, idxs, targets=None):

        # idxs and targets are both (B,T) tensors
        logits = self.token_embedding_table(idxs) # (B,T,C), e.g. batch_size x block_size x vocab size

        if targets is not None:
            B, T, C = logits.shape
            logits = logits.view(B*T, C)
            targets = targets.view(B*T)

            loss = F.cross_entropy(logits, targets)
        else:
            loss = None

        return logits, loss
    
    def generate(self, idxs, max_new_tokens):
        # idxs is a (B,T) array of indices in current context
        for _ in range(max_new_tokens):
            logits, loss = self(idxs) #logits is (B,T,C)
            logits = logits[:,-1,:] # get last value, now (B,C)
            probs = F.softmax(logits, dim=-1) # same
            idx_next = torch.multinomial(probs, num_samples=1) # get (B,1) next vals
            idxs = torch.cat((idxs, idx_next), dim=1) # now add so shape is (B,T+1)
        return idxs

a = BigramModel(vocab_size)


logits, loss = a(x,y)
print(logits.shape)
print(loss)

print(decode(a.generate(torch.zeros((1,1), dtype=torch.long), 100)[0].tolist()))


optimizer = torch.optim.AdamW(a.parameters(), lr=1e-3)

batch_size = 32

print('Beginning Training Loop...')

for steps in range(10000):
    xb, yb = get_batch('train')

    logits, loss = a(xb, yb)
    optimizer.zero_grad(set_to_none=True)
    loss.backward()
    optimizer.step()

    print(loss.item())

