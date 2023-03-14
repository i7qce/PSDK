import torch
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

data = torch.tensor(encode(a))

train_frac = 0.9
n_train = int(train_frac*data.shape[0])

train = data[:n_train]
val = data[n_train:]

block_size = 8
batch_size = 4