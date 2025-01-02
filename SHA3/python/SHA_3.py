
def theta(A):
    # print('A =',A)
    w = len(A[0][0])  # Determine the lane size based on the third dimension of A
    C = [[0] * w for _ in range(5)]
    D = [[0] * w for _ in range(5)]

    # Step 1: Calculate C[x, z]
    for x in range(5):
        for z in range(w):
            C[x][z] = int(A[x][0][z]) ^ int(A[x][1][z]) ^ int(A[x][2][z]) ^ int(A[x][3][z]) ^ int(A[x][4][z])
    # Step 2: Calculate D[x, z]
    for x in range(5):
        for z in range(w):
            D[x][z] = C[(x-1) % 5][z] ^ C[(x+1) % 5][(z-1) % w]

    # Step 3: Update A' with D[x, z]
    A_prime = [[[0] * w for _ in range(5)] for _ in range(5)]
    for x in range(5):
        for y in range(5):
            for z in range(w):
                A_prime[x][y][z] = int(A[x][y][z]) ^ D[x][z]
    return A_prime

def rho(A):
    w = len(A[0][0])  # Determine the lane size based on the third dimension of A
    # Initialize A' with the same dimensions as A
    A_prime = [[[0] * w for _ in range(5)] for _ in range(5)]

    # Step 1: Copy the lane at (0, 0) without rotation
    for z in range(w):
        A_prime[0][0][z] = A[0][0][z]

    # Step 2: Define the initial position for (x, y)
    x = 1
    y = 0

    # Step 3: Perform the rotations for each lane
    for t in range(24):
        for z in range(w):
            new_z = (z - (t + 1) * (t + 2) // 2) % w
            A_prime[x][y][z] = A[x][y][new_z]

            # Update (x, y) for the next iteration
        x, y = y, (2 * x + 3 * y) % 5
            
            
    return A_prime

def pi(A):
    w = len(A[0][0])  # Determine the lane size based on the third dimension of A

    # Initialize A' with the same dimensions as A
    A_prime = [[[0] * w for _ in range(5)] for _ in range(5)]

    # Step 1: Rearrange the lanes
    for x in range(5):
        for y in range(5):
            for z in range(w):
                A_prime[x][y][z] = A[(x + 3 * y) % 5][x][z]

    return A_prime


def chi(A):
    w = len(A[0][0])  # Determine the lane size based on the third dimension of A

    # Initialize A' with the same dimensions as A
    A_prime = [[[0] * w for _ in range(5)] for _ in range(5)]

    # Step 1: Apply the χ transformation
    for x in range(5):
        for y in range(5):
            for z in range(w):
                A_prime[x][y][z] = A[x][y][z] ^ ((A[(x + 1) % 5][y][z] ^ 1) & A[(x + 2) % 5][y][z])

    return A_prime

def rc(t):
    if t % 255 == 0:
        return 1

    R = [1, 0, 0, 0, 0, 0, 0, 0, 0]  # Initialize R with eight bits, starting as 10000000
    
    for i in range(1, (t % 255) + 1):
        # Shift R to the left and perform feedback from R[0]
        R = [0,R[0],R[1],R[2],R[3],R[4],R[5],R[6],R[7]]
        R[0] = R[0] ^ R[8]
        R[4] = R[4] ^ R[8]
        R[5] = R[5] ^ R[8]
        R[6] = R[6] ^ R[8]
    return R[0]


def iota(A, ir):
    w = len(A[0][0])  # Determine the lane size based on the third dimension of A
    l = w.bit_length() - 1  # Calculate log2(w)
    # Initialize A' with the same dimensions and values as A
    A_prime = [[A[x][y][:] for y in range(5)] for x in range(5)]

    # Compute the round constant RC for the given round index ir
    RC = [0] * w
    for j in range(l + 1):
        RC[(2 ** j) - 1] = rc(j + 7 * ir)  # rc is the function defined in Algorithm 5
    # print(RC)
    # Apply the round constant to the (0, 0) lane
    for z in range(w):
        A_prime[0][0][z] ^= RC[z]

    return A_prime

def round_function(A, ir):
    # Apply step mappings
    A = theta(A)
    A = rho(A)
    A = pi(A)
    test = [0]*1600
    # for y in range(5):
    #     for x in range(5):
    #         for z in range(64):
    #             test[z+x*64+y*320] = A[x][y][z]
    # print(test)
    # print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    A = chi(A)
    A = iota(A, ir)
    
    return A

def KECCAK_p(S, b, nr):
    # Convert the input string S into the state array A
    w = b // 25
    l = w.bit_length() - 1
    
    # print(S)
    # print("------------------------------------------------------------------------------------")
    A = [[[0 for z in range(w)] for y in range(5)] for x in range(5)]
    for x in range(5):
        for y in range(5):
            for z in range(w):
                A[x][y][z] = S[w*(5*y+x)+z]
                
    # print(A)
    # Perform nr rounds of the permutation
    test = [0]*1600
    for ir in range(12 + 2*l - nr, 12 + 2 * l):
        # print('round',ir)
        A = round_function(A, ir)
        for y in range(5):
            for x in range(5):
                for z in range(64):
                    test[z+x*64+y*320] = A[x][y][z]
        # print(A)
        # print("------------------------------------------------------------------------------------")

    # Convert the state array A back into the output string S'
    S_prime = [0]*1600
    for y in range(5):
        for x in range(5):
            for z in range(64):
                S_prime[z+x*64+y*320] = A[x][y][z]

    return S_prime

def sponge(r, b, N, d):
    P = N + pad10_star_1(r, len(N))
    n = len(P) // r
    # print(P)
    c = b - r
    P_blocks = [0 for x in range(n)]
    for i in range(n):
            P_blocks[i] = P[i*r:i*r+r]
    S = ['0'] * b
    # print(P_blocks)
    for i in range(n):
        m = P_blocks[i] + '0' * c       
        for j in range(b):
            S[j] = str(int(S[j]) ^ int(m[j]))
        print(S)
        S = KECCAK_p(S, 1600, 24)

    Z = S[:r]
    while len(Z) < d:
        print(len(Z))
        S = KECCAK_p(S, 1600, 24)
        Z += S[:r]

    return Z[:d]

def pad10_star_1(r, m):
    j = (-m - 2) % r
    return '1' + '0' * j + '1'

def KECCAK(c,N,d):
    return sponge(1600-c,1600,N,d)

def SHA3(M,B,d,SHA_SHAKE):
    in_KECCAK = ''
    # print(M)
    for i in M:
        # print(type(i))
        sb = bin(i)
        # print(sb)
        sb = sb[2:]
        # print(sb)
        while len(sb) < 8:
            sb = '0' + sb
        S_rev = ''
        for j in range(8):
            S_rev += sb[7-j]
        # print(S_rev)
        # in_KECCAK += 
        in_KECCAK += S_rev
    # print(in_KECCAK)
    if(SHA_SHAKE == 0):
        in_KECCAK += '01'

    else:
        in_KECCAK += '1111'
    # print(in_KECCAK)
    result = KECCAK(B, in_KECCAK, d)  # 輸出4096位的結果
    return result

def SHAKE_128(M,d):
    result = SHA3(M, 256, d,1) 
    result = BitsToBytes(result) 
    return result

def SHAKE_256(M,d):
    result = SHA3(M, 512, d,1)  
    result = BitsToBytes(result) 
    return result

# 算法 6: BitsToBytes(y) 
def BitsToBytes(y: list) -> bytearray:
    """
    將位元串 y 轉換為位元組串
    :param y: 位元串
    :return: 位元組串 z
    """
    c = len(y)
    z = bytearray((c + 7) // 8)  # 初始化位元組串
    for i in range(c):
        z[i // 8] += y[i] * (2 ** (i % 8))
    return z

# 算法 7: BytesToBits(y)
def BytesToBits(z):
    z = bytearray(z)
    d = len(z)  # Length of the byte string
    y = [0] * (d * 8)  # Initialize the bit string to hold 8 bits for each byte
    for i in range(d):
        for j in range(8):
            y[8 * i + j] = z[i] % 2  # Get the least significant bit
            z[i] = z[i] // 2  # Shift the byte right
    return y

def string_to_bits(input_string):
    # 將字符串轉換為二進位制
    return ''.join(format(ord(c), '08b') for c in input_string)


# bit_string = ''.join(bit_list)
# print(bit_string)
# decimal_value = int(bit_string, 2)
# hex_value = hex(decimal_value)[2:]
# print(f"十六進制: {hex_value}")
# print(len(bit_list))
# print(bit_string)
# print(len(bit_string))

# xi = b'\xa5\xec\xbce2\xa2\xf4\xd7`J\xc1\x81mj\xdc4\xfd^\xa9\xf6\xb5P\x1dhq\x85\x8e\x84\x0b\xac\x02\xd3  \xf8\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01'

# H_xi = SHAKE_128(xi,1344)

# print(BytesToBits(xi))
# print(BytesToBits(H_xi))
# print(H_xi)

# out = KECCAK_p(bit_list, 1600, 24)
# print(out)
# KECCAK_p(S, b, nr)


### TEST "F_Permutation_Dilithium" ###
# mode = 0 # G => 0, H => 1
# verilog_in_1344 = "000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111100000100000001000001101001100000010101011000000101110000100100011101000010101110001011010000001110101010000101101011111011010101001010111101111110100110100110111000110101001101101100000011100000101001010011000001101011111110100101000100011001001100101101111001110110010100101"
# python_in_1600  = list(verilog_in_1344)
# python_in_1600.reverse()
# python_in_1600.extend(['0'] * 256)
# python_out_1600 = KECCAK_p(python_in_1600, 1600, 24)
# python_in_1600_string = ''.join(map(str, python_in_1600))
# python_in_1600_hex_string = ''.join(hex(int(python_in_1600_string[i:i+4], 2))[2:].upper() for i in range(0, len(python_in_1600_string), 4))
# print("python_in_1600_hex_string = ",python_in_1600_hex_string)
# python_out_1600.reverse()
# python_out_1600_string = ''.join(map(str, python_out_1600))
# python_out_1600_hex_string = ''.join(hex(int(python_out_1600_string[i:i+4], 2))[2:].upper() for i in range(0, len(python_out_1600_string), 4))
# print("python_out_1600_hex_string = ",python_out_1600_hex_string)



### TEST "Padder_Dilithium" ###
# #setting str----------------------------
# mode = 0 # G(r = 1344) => 0, H(r = 1088) => 1
# byte_num = 1    # 0(2'b00) => out = 64'h000000000000001f     
#                 # 1(2'b01) out = {24'h00001f,in[39:0]};   
#                 # 2(2'b10) out = {16'h001f,in[47:0]};         
# verilog_in_64 =  ['1101011111110100101000100011001001100101101111001110110010100101'
#                                                                                  #^
#                                                                                  #|
#                                                                                  #LSB(verilog)
#                  ,'0011010011011100011010100110110110000001110000010100101001100000'
#                  ,'0110100000011101010100001011010111110110101010010101111011111101'
#                  ,'1101001100000010101011000000101110000100100011101000010101110001'
#                  ,'11110000000000000000111110000010000000100000']
#                   #^   ^
#                   #|   |
#                   #|   40bit 
#                   #|
#                   #shake add 1111(verilog)            
# #setting end----------------------------
# cont = 0
# python_in_64x5 = ''
# for i in verilog_in_64:
#     print("verilog_in",cont," = ",i)
#     python_in_64x5 = python_in_64x5 + i[::-1]
#     cont+=1

# python_out_1344 = python_in_64x5 + pad10_star_1(1344, len(python_in_64x5))
# python_out_1344 = python_out_1344[::-1]
# python_out_1344_hex_string = ''.join(hex(int(python_out_1344[i:i+4], 2))[2:].upper() for i in range(0, len(python_out_1344), 4))
# print("python_out_1344_hex_string = ",python_out_1344_hex_string)




### TEST "Keccak_Dilithium" ###
# #setting str----------------------------
# mode = 0 # G(r = 1344) => 0, H(r = 1088) => 1
# byte_num = 1    # 0(2'b00) => out = 64'h000000000000001f     
#                 # 1(2'b01) out = {24'h00001f,in[39:0]};   
#                 # 2(2'b10) out = {16'h001f,in[47:0]};         
# verilog_in_64 =  ['1101011111110100101000100011001001100101101111001110110010100101'
#                                                                                  #^
#                                                                                  #|
#                                                                                  #LSB(verilog)
#                  ,'0011010011011100011010100110110110000001110000010100101001100000'
#                  ,'0110100000011101010100001011010111110110101010010101111011111101'
#                  ,'1101001100000010101011000000101110000100100011101000010101110001'
#                  ,'11110000000000000000111110000010000000100000']
#                   #^   ^
#                   #|   |
#                   #|   40bit 
#                   #|
#                   #shake add 1111(verilog)            
# #setting end----------------------------
# cont = 0
# python_in_64x5 = ''
# for i in verilog_in_64:
#     print("verilog_in",cont,"     = ",i)
#     python_in_64x5 = python_in_64x5 + i[::-1]
#     cont+=1

# print(python_in_64x5)
# python_KECCAK_out_1344 = KECCAK(256, python_in_64x5, 1344)
# python_KECCAK_out_1344.reverse()
# python_KECCAK_out_1344_string = ''.join(map(str, python_KECCAK_out_1344))
# python_KECCAK_out_1344_string = ''.join(hex(int(python_KECCAK_out_1344_string[i:i+4], 2))[2:].upper() for i in range(0, len(python_KECCAK_out_1344_string), 4))
# print("python_KECCAK_out_1344_string = ",python_KECCAK_out_1344_string) # Verilog available output is 1344 bit (out[1343:0])


### TEST "ExpandS" ###