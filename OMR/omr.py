import cv2

import numpy as np
import matplotlib.pyplot as plt

import glob
import os

import logging

'''
OMR Pipeline:

redo training data w/ lilypond? Can do instance segmentation to learn notehead values, specifically

each note has a label: (color, note value, note rhythm) e.g. ([0,0,1], g6, 2)

https://github.com/BreezeWhite/oemer

1. Run entire image through U-Net to segment
2. Isolate staves
3. Sequentially run through elements, parse into category (note, dynamic, text, articulation, etc.) 
4. For notes, resolve note value
5. For notes and rests, resolve rhythm value

OR 

1. Isolate staves (seam carving?)
2. Extract Patches
3. Run patches through U-Net to segment
4. Sequentially run through elements, parse into category (note, dynamic, text, articulation, etc.) 
5. For notes, resolve note value
6. For notes and rests, resolve rhythm value

OR

1. Segment on full image to find noteheads + barlines (U-Net) (also key sigs, clefs)
2. Patch extraction 
3. Classification on patches to find rhythm + pitch (Classical? Or NN?)

Training Strategy:

For extraction network:
1. Generate scores in lilypond, color all noteheads w/ one color, all important extras w/ another, and barlines with a third, and unimportant w/ a final
2. Train UNet, use aggressive augmentation, etc.

For classification network:
1. Take patches from segmented network 
2. Train w/ multilabel: (clef 1, clef 2, clef 3, clef 4, ... key sig ..., a3, Bb3, C3, C#3, ...  )

'''

class stream_score():
    def __init__(self):
        pass

class score():
    def __init__(self, pagesize=(1024, 512), img_folder='./images'):
        self._page = np.zeros(pagesize)
        self._segmentation_map = np.zeros(pagesize)

        self._image_folder = img_folder
        
        self._load_musical_elements()
    
    def _load_musical_elements(self):
        '''
        Load all music elements from the images folder, then create a mapping assigning each element with an id for creating segmentation maps
        '''

        list_of_files = glob.glob(os.path.join(self._image_folder, '*'))
        self._primitive_mapping = {os.path.split(x)[-1].split('.')[0]: {'id': idx+1, 'img': self._normalize_image(cv2.imread(x, cv2.IMREAD_GRAYSCALE))} for idx, x in enumerate(list_of_files)}
    

    def _insert_element(self, element, label, location, augment_params):
        '''
        augment params: {
            'scale': ,
            'rotation': ,
            'affine': ,
            'erosion': ,
            'dilation': ,
            'noise': ,
            'blur': 
            }
        '''

        element_to_insert = element
        element_to_insert = cv2.resize(element_to_insert, (0, 0), fx = 0.2, fy = 0.2)

        # ... process element

        self._write_to_page(element_to_insert, label, location)

        # get element image, apply augmentations, place at location

        pass
    
    def _write_to_page(self, new_addition, label, location):
        
        if location[0] + new_addition.shape[0] > self._page.shape[0]-1 or location[1] + new_addition.shape[1] > self._page.shape[1]-1:
            logging.warning("skipping shape, doesn't fit on page")
            return
        else:
            
            self._page[location[0]:location[0]+new_addition.shape[0], location[1]:location[1]+new_addition.shape[1]] += new_addition

            self._segmentation_map[location[0]:location[0]+new_addition.shape[0], location[1]:location[1]+new_addition.shape[1]] += new_addition*label
        


    def _generate_augment_params(self):
        pass

    
    def populate_page(self):
        for _ in range(50):
            loc = [np.random.randint(0, self._page.shape[0]), np.random.randint(0, self._page.shape[1])]
            self._insert_element(*self.random_element, location=loc, augment_params=None)

    def _normalize_image(self, img):
        '''
        Assumes image is loaded as 8 bit image. Do the following:
        1. normalize to float from [0,1]
        2. invert so that white = 0 and black = 1
        3. binarize
        '''
        img = img/255
        img = 1-img
        img[img>0.5] = 1
        img[img<=0.5] = 0

        return img

    @property
    def random_element(self):
        random_name = np.random.choice(list(self._primitive_mapping.keys()))
        return [self._primitive_mapping[random_name]['img'], self._primitive_mapping[random_name]['id']]

    @property
    def musical_primitives(self):
        # {'quarter': {'id': 1, 'img': <numpy array>}}
        return self._primitive_mapping

    @property
    def assembled_page(self):
        return np.clip(self._page, 0, 1)
    
    @property
    def segmentation_map(self):
        return self._segmentation_map