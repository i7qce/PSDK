import time
import keras_cv
from tensorflow import keras
import matplotlib.pyplot as plt

import glob
import os
"""
Workflow:

Q: Make this a general workflow for any prompt-based input?

class PromptResponse:
    def __init__()

    def prompt()

    def params()

    def model()

    def run()

    def results()

A = PromptResponse('stablediffusion')
A.add_prompt('new prompt')
A.run('')

1. Launch a CLI
2. paste prompt or select from previous
    prompts are retrieved by going through 
3. Data is setup in the following format:

OutputFolder
  PromptKey1
    fullprompt.txt
    ...
    images
    ...
  PromptKey2
    fullprompt.txt
    ...
    images
    ...

to decide which folder to store results in:
1. calculate short summary token based on prompt
2. check if there's already a folder w/ that name
3. if not, create folder, store full prompt inside, and use as current output folder
4. if yes, check prompt inside: if it matches current prompt, then use this folder as the folder. 
   if it doesn't match current prompt, update token w/ an integer appended and repeat check 

"""


save_path = '~/docs/generated_images'


def return_next_index(save_path, prompt_token):
    filenames = glob.glob(os.path.join(save_path, prompt_token + '_*'))
    ids = [int(x.split('_')[-1].split('.')[0]) for x in filenames]

    if ids == []:
        return 1
    else:
        return max(ids) + 1

def run_and_save(model, prompt, res, batch_size):
    
    prompt_token = prompt.replace(" ", "_")

    images = model.text_to_image(prompt, batch_size=batch_size)

    for i in range(len(images)):
        plt.imshow(images[i])
        plt.savefig(os.path.join(save_path, f'{prompt_token}_{return_next_index(save_path, prompt_token)}.png'))

prompt = "a house in the style of an 8 bit nintendo video game, winter, blocky, looks like zelda, pixel art, high quality, snowy, indie"

res        = 512
batch_size = 3
runs       = 20

model = keras_cv.models.StableDiffusion(img_width=res, img_height=res)

for _ in range(runs):
    run_and_save(model, prompt, res, batch_size)


# To add to Dockerfile:
# Add logic for deep learning setup vs general dev setup vs other
# TF install instructions
# Ubunutu 22.04 specific TF instructions