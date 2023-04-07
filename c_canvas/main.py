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
   
    if len(sys.argv) > 1:
        prompt = sys.argv[1]
    else:
        prompt = "prompt here"

    print(f'Prompt being generated is {prompt}')

    params = {
        "resolution": 512,
        "batch_size": 3,
        "runs": 2,
        "results_directory": "/home/i7qce/docs/generated_images2",
        "model": 'stablediffusionkeras',
        "prompt": prompt,
        "negative_prompt": None,
        "CFG": 7.5,
    }

    Generator = TextToImageFactory(params['model'])(params)
    Generator.run(params)
