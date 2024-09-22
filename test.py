# Manual calculation of element-wise dot product without using libraries
a = [[[1, 0, 0], [0, 1, 0], [0, 0, 1]],
     [[1, 0, 0], [0, 1, 0], [0, 0, 1]],
     [[1, 0, 0], [0, 1, 0], [0, 0, 1]]]

b = [[[1, 0, 0], [0, 1, 0], [0, 0, 1]],
     [[1, 0, 0], [0, 1, 0], [0, 0, 1]],
     [[1, 0, 0], [0, 1, 0], [0, 0, 1]]]

# Initialize the result
result = 0

# Loop through each element and calculate element-wise multiplication and summation
for i in range(3):
    for j in range(3):
        for k in range(3):
            result += a[i][j][k] * b[i][j][k]

print(result)