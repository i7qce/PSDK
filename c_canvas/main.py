from PSDK.c_canvas.models import StableDiffusionKerasCV


def TextToImageFactory(model):
    models = {
        'stablediffusionkeras': StableDiffusionKerasCV
    }

if __name__ == "__main__":
    
    params = {
        "resolution": 512,
        "batch_size": 3,
        "runs": 3,
        "results_directory": "~/docs/generated_images2",
        "model": 'stablediffusionkeras',
        "prompt": "This is a test prompt!",
    }

    Generator = TextToImageFactory[params['model']](params)
    Generator.run(params['prompt'])