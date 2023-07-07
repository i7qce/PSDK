"""
Code to write 
"""

import sys

class color:
   PURPLE = '\033[95m'
   CYAN = '\033[96m'
   DARKCYAN = '\033[36m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   BOLD = '\033[1m'
   UNDERLINE = '\033[4m'
   END = '\033[0m'

def render_bionic(input):
    return

if __name__ == "__main__":
    
    input_text_file = sys.argv[1]

    with open(input_text_file, 'r') as f:
        content = f.read()
    
    for word in content.split(' '):
        if len(word) > 0:

            print(color.BOLD + word )


