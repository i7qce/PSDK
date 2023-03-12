import time
import keras_cv
from tensorflow import keras
import matplotlib.pyplot as plt

import glob
import os

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


# def plot_images(images):
#     plt.figure(figsize=(20, 20))
#     for i in range(len(images)):
#         ax = plt.subplot(1, len(images), i + 1)
#         plt.imshow(images[i])
#         plt.axis("off")


# plot_images(images)


# To add to Dockerfile:
# Add logic for deep learning setup vs general dev setup vs other
# TF install instructions
# Ubunutu 22.04 specific TF instructions