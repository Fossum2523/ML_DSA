import numpy as np


def AddNTT(a_hat, b_hat):
    # AddNTT: Computes element-wise addition of two vectors
    c_hat = [(a_hat[i] + b_hat[i]) for i in range(256)]
    return c_hat


def MultiplyNTT(a_hat, b_hat):
    # MultiplyNTT: Computes element-wise multiplication of two vectors
    c_hat = [(a_hat[i] * b_hat[i]) for i in range(256)]
    return c_hat


def AddVectorNTT(v_hat, w_hat):
    # AddVectorNTT: Computes the sum of two vectors (length 4)
    u_hat = [AddNTT(v_hat[i], w_hat[i]) for i in range(4)]
    return u_hat


def ScalarVectorNTT(c_hat, v_hat):
    # ScalarVectorNTT: Computes the product of a scalar and a vector (length 4)
    w_hat = [MultiplyNTT(c_hat, v_hat[i]) for i in range(4)]
    return w_hat


# Example input data
np.random.seed(0)  # For reproducibility

A = [[np.random.randint(0, 256, size=256).tolist() for _ in range(4)] for _ in range(4)]
s1 = [np.random.randint(0, 256, size=256).tolist() for _ in range(4)]

# Example: Applying ScalarVectorNTT with s1
result = ScalarVectorNTT(s1[0], s1)

print("Result of ScalarVectorNTT:")
for i, row in enumerate(result):
    print(f"Row {i}: {row[:5]}... (total 256 elements)")  # Displaying only the first 5 elements of each row
