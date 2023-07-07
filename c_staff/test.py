import os
import random

def generate_lilypond_file(filename):
    notes = ['c', 'd', 'e', 'f', 'g', 'a', 'b']
    octaves = ["", "'", ","]
    lengths = ['2', '4', '8', '16']

    with open(filename, 'w') as file:
        file.write('\\version "2.20.0"\n')  # you may need to adjust this for your LilyPond version
        file.write('\\relative c'' {\n')

        for _ in range(16):  # generate 16 random notes
            note = random.choice(notes)
            octave = ""#random.choice(octaves)
            length = random.choice(lengths)
            file.write(note + str(octave) + length + ' ')

        file.write('}\n')

def convert_lilypond_to_png(filename):
    png_filename = filename.replace('.ly', '.png')
    os.system(f'lilypond -dbackend=eps -dno-gs-load-fonts -dinclude-eps-fonts --png {filename}')
    return png_filename

def crop_png(filename):
    cropped_filename = filename.replace('.png', '_cropped.png')
    os.system(f'convert {filename} -trim {cropped_filename}')
    return cropped_filename


filename = 'random_music.ly'
generate_lilypond_file(filename)
png_filename = convert_lilypond_to_png(filename)
cropped_filename = crop_png(png_filename)