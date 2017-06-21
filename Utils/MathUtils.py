import numpy as np


class MathUtils:

    @staticmethod
    def sigmoid(x):
        z = 1 / (1 + np.exp(-x))
        return z

    @staticmethod
    def sigmoid_gradient(x):
        z = MathUtils.sigmoid(x) * (1 - MathUtils.sigmoid(x))
        return z
