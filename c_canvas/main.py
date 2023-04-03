import sys
sys.path.append('..')
sys.path.append('../..')
sys.path.append('../../..')

from models.StableDiffusion import StableDiffusionKerasCV


def TextToImageFactory(model):
    models = {
        'stablediffusionkeras': StableDiffusionKerasCV
    }

    return models[model]

if __name__ == "__main__":
    
    params = {
        "resolution": 512,
        "batch_size": 3,
        "runs": 1,
        "results_directory": "/home/i7qce/docs/generated_images2",
        "model": 'stablediffusionkeras',
        "prompt": "High resolution photo of a Pineapple",
    }

    Generator = TextToImageFactory(params['model'])(params)
    Generator.run(params)
