import os
import abc

class GenerativeModelRunner(abc.ABC):
    """
    Abstract class for generative flow of prompt-based deep learning models

    Defines the organizational structure for repeated training with prompts
    """

    def __init__(self, params):
        self.params = params
        self.model = self.construct_model(params)
    
    @abc.abstractmethod
    def construct_model(self, params):
        raise NotImplementedError

    @abc.abstractmethod
    def run(self, params):
        raise NotImplementedError
    
