import cv2

import numpy as np
import matplotlib.pyplot as plt

url = ''
from PIL import Image
import requests


# If getting an image from the internet, can use this 
if url:
    im = Image.open(requests.get(url, stream=True).raw)
else:
    im = cv2.imread('/home/i7qce/docs/data_images/test_images/map.jpg')
    im = im[:,:,::-1]


# Coordinates of 4 keypoints on original image 
pts1 = np.float32([[189, 172], [1147, 167],
                       [162, 1380], [1155, 1410]])

# Coordinates of 4 keypoints on desired image (e.g. post-straightening) 
pts2 = np.float32([[175, 175], [1200, 175],
                       [175, 1400], [1200, 1400]])

plt.figure(dpi=150)
plt.imshow(im)
plt.scatter(pts1[:,0], pts1[:,1])
plt.scatter(pts2[:,0], pts2[:,1],c='r')
plt.savefig('./original.png')

matrix = cv2.getPerspectiveTransform(pts1, pts2)
result = cv2.warpPerspective(np.asarray(im), matrix, (1600, 1800))

plt.figure(dpi=200)
plt.imshow(result)
plt.savefig('./corrected.png')
