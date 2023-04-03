import os

from datetime import datetime
import pytz

def prep_results_dir(results_directory):
    """
    Prepare the results directory by creating the appropriate date folder if required,
    and return a filepath_head that should be safe to write to in that directory
    """

    eastern = pytz.timezone("US/Eastern")
    current_date = datetime.now(eastern).strftime("%Y-%m-%d")
    current_time = datetime.now(eastern).strftime("%H:%M:%S")

    path_to_write_to = os.path.join(results_directory, current_date)
    
    if not os.path.isdir(path_to_write_to):
        os.makedirs(path_to_write_to)
    
    filepath_head = os.path.join(path_to_write_to, current_time)

    return filepath_head