import numpy as np


class MatrixUtils:

    @staticmethod
    def add_ones_column(array):
        return np.insert(array, 0, 1, axis=1)

    @staticmethod
    def zero_ind(col_vector):
        """Method to zero index input column"""
        for i in range(0, col_vector.shape[0]):
            if col_vector[i] == 10:
                col_vector[i] = 0

        return col_vector

    @staticmethod
    def unroll(matrix_list):
        matrix = np.empty([0, 0])
        for m in matrix_list:
            matrix = np.concatenate((matrix.flat, m.flat))

        return matrix
