import os
import time

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

class PrintStream:
    def __init__(self):
        self.stream = []
        self.context = 50
    
    def print(self):
        pass

def bold_first_letters(word, n=2, hilight_color=color.CYAN):
    if len(word)>n:
        return color.BOLD + hilight_color + word[:n] + color.END + word[n:]
    else:
        return color.BOLD + hilight_color +  word + color.END

def bold_bookend_letters(word, n=2, hilight_color=color.CYAN):
    
    if len(word)>n*2:
        return color.BOLD + color.CYAN + word[:n] + color.END + word[n:-n] + color.BOLD + color.YELLOW + word[-n:] + color.END
    else:
        return color.BOLD + color.CYAN +  word + color.END

def print_words_one_at_a_time(file_path):
    # Ensure the file exists
    if not os.path.isfile(file_path):
        print(f"No file found at {file_path}")
        return

    # Open the file
    with open(file_path, 'r') as file:
        # Read the file's contents
        contents = file.read()

        # Split the contents into words, ignoring whitespace and newlines
        words = contents.split()

        # Loop through each word
        for word in words:
            # Clear the terminal
            os.system('cls' if os.name == 'nt' else 'clear')

            # Print the word
            #print(word)
            #print(bold_first_letters(word))
            print(bold_bookend_letters(word))

            # Pause for a moment before moving to the next word
            time.sleep(0.05)

def scroll_words(file_path, line_length=80):
    # Ensure the file exists
    if not os.path.isfile(file_path):
        print(f"No file found at {file_path}")
        return

    # Open the file
    with open(file_path, 'r') as file:
        # Read the file's contents
        contents = file.read()

        # Split the contents into words, ignoring whitespace and newlines
        words = contents.split()

        # Calculate half the line length, rounding down if necessary
        half_line_length = line_length // 2

        # Loop through each word
        for i, word in enumerate(words):
            # Clear the terminal
            os.system('cls' if os.name == 'nt' else 'clear')

            # Determine the surrounding context
            context_before = " ".join(words[max(0, i-half_line_length):i])
            context_after = " ".join(words[i+1:i+half_line_length])

            # Combine the context and focus word
            line = f"{context_before} {color.YELLOW + word + color.END} {context_after}"

            # If the line is too long, truncate it
            if len(line) > line_length:
                overage = len(line) - line_length
                half_overage = overage // 2
                line = line[half_overage:-half_overage]

            # Print the line, ensuring the focus word is centered
            print(f"{line:^{line_length}}")

            # Pause for a moment before moving to the next word
            time.sleep(0.5)

def scroll_words2(file_path, speed=0.1, line_length=80):
    # Ensure the file exists
    if not os.path.isfile(file_path):
        print(f"No file found at {file_path}")
        return

    # Open the file
    with open(file_path, 'r') as file:
        # Read the file's contents
        contents = file.read()

        # Replace newlines with spaces
        contents = contents.replace('\n', ' ')

        # Scroll through the contents
        for i in range(len(contents)):
            # Clear the terminal
            os.system('cls' if os.name == 'nt' else 'clear')

            # Determine the subset of contents to display
            display_contents = contents[i:i+line_length]

            # Determine the index of the center of the line
            center_index = len(display_contents) // 2

            # Find the start and end of the word at the center
            start_of_word = display_contents.rfind(' ', 0, center_index)
            end_of_word = display_contents.find(' ', center_index)

            # If the center is in a word (i.e., not a space), get the center word and the contents before and after it
            if start_of_word != -1 and end_of_word != -1:
                center_word = display_contents[start_of_word+1:end_of_word]
                before_word = display_contents[:start_of_word]
                after_word = display_contents[end_of_word:]
            else:
                center_word = display_contents[center_index]
                before_word = display_contents[:center_index]
                after_word = display_contents[center_index+1:]

            # Print the before word, center word, and after word
            print(before_word + ' ' + color.YELLOW + center_word + color.END + after_word)

            # Pause for a moment before moving to the next character
            time.sleep(speed)


if __name__ == "__main__":
    # Specify the path to your file here
    file_path = '/home/i7qce/docs/scratch/sample_text_3.txt'
    print_words_one_at_a_time(file_path)
    #scroll_words2(file_path, speed=.05)