import json
import time

import matplotlib.pyplot as plt

import keras_cv
from tensorflow import keras

from PSDK.c_common.results_handling import prep_results_dir
from PSDK.c_common.BaseClass import GenerativeModelRunner


class StableDiffusionKerasCV(GenerativeModelRunner):
    """
    Class for running the built-in StableDiffusion that comes w/ KerasCV
    """

    def construct_model(self, params):
        res = params['resolution']
        return keras_cv.models.StableDiffusion(img_width=res, img_height=res)

    def run(self, params):

        batch_size = int(params['batch_size'])
        runs = params['runs']
        for _ in range(runs):
            images = self.model.text_to_image(params['prompt'], batch_size=batch_size)
            for i in range(len(images)):
                plt.imshow(images[i])
                
                file_header = prep_results_dir(params['results_directory'])

                plt.savefig(file_header + '_' + params['prompt'].replace(" ", "_")[:50] + '.png')
                
                with open(file_header + '_params.json', 'w') as f:
                    json.dump(params, f, indent=4)
                time.sleep(3)




