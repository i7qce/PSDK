from music21 import note, stream, converter
import os

# Create a stream to hold the notes
s = stream.Stream()

# Generate some random notes
notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B']
durations = [1, 2, 4, 8]  # whole, half, quarter, eighth notes
octaves = list(range(4, 6))  # octaves 1-6

import random

for _ in range(16):  # create 16 random notes
    random_note = random.choice(notes) + str(random.choice(octaves))
    random_duration = random.choice(durations)
    s.append(note.Note(random_note, quarterLength=random_duration))

def convert_lilypond_to_png(filename):
    png_filename = filename.replace('.ly', '.png')
    os.system(f'lilypond -dbackend=eps -dno-gs-load-fonts -dinclude-eps-fonts --png {filename}')
    return png_filename

def crop_png(filename):
    cropped_filename = filename.replace('.png', '_cropped.png')
    os.system(f'convert {filename} -trim {cropped_filename}')
    return cropped_filename

# Save to a Lilypond file
filename = 'random_music2.ly'
s.write('lilypond', filename)
png_filename = convert_lilypond_to_png(filename)
cropped_filename = crop_png(png_filename)