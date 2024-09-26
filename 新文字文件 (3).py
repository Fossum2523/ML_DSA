import random
import numpy as np
import hashlib
from hashlib import sha3_256, sha3_512, shake_256 , shake_128


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
    # Apply the round constant to the (0, 0) lane
    for z in range(w):
        A_prime[0][0][z] ^= RC[z]

    return A_prime

def round_function(A, ir):
    # Apply step mappings
    A = theta(A)
    # print('After Theta')
    #check_A(A)
    # print('-----------------------------')
    # print('After Rho')
    A = rho(A)
    #check_A(A)
    # print('-----------------------------')
    # print('After Pi')
    A = pi(A)
    #check_A(A)
    # print('-----------------------------')
    # print('After Chi')
    A = chi(A)
    #check_A(A)
    # print('-----------------------------')
    # print('After Iota')
    A = iota(A, ir)
    # check_A(A)
    # print('-----------------------------')
    
    

    return A

def KECCAK_p(S, b, nr):
    # Convert the input string S into the state array A
    w = b // 25
    l = w.bit_length() - 1
    
    A = [[[0 for z in range(w)] for y in range(5)] for x in range(5)]
    for x in range(5):
        for y in range(5):
            for z in range(w):
                A[x][y][z] = S[w*(5*y+x)+z]
    # check_A(A)
    # Perform nr rounds of the permutation
    for ir in range(12 + 2*l - nr, 12 + 2 * l):
        # print('round',ir)
        A = round_function(A, ir)

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
    # print(r)
    c = b - r
    P_blocks = [0 for x in range(n)]
    for i in range(n):
            P_blocks[i] = P[i*r:i*r+r]
    S = ['0'] * b
    # print(P_blocks)
    for i in range(n):
        m = P_blocks[i] + '0' * c       

        A = [[[0 for z in range(64)] for y in range(5)] for x in range(5)]
        for x in range(5):
            for y in range(5):
                for z in range(64):
                    A[x][y][z] = m[64*(5*y+x)+z]
        # check_A(A)

        for j in range(b):
            S[j] = str(int(S[j]) ^ int(m[j]))
        S = KECCAK_p(S, 1600, 24)

    Z = S[:r]
    while len(Z) < d:
        S = KECCAK_p(S, 1600, 24)
        Z += S[:r]

    return Z[:d]

def pad10_star_1(r, m):
    j = (-m - 2) % r
    return '1' + '0' * j + '1'

def KECCAK(c,N,d):
    return sponge(1600-c,1600,N,d)



#################### for string format ####################
def check_A(A):
    arr = [0]*200
    cnt = 0
    for y in range(5):
        for x in range(5):
            for z in range(64):
                if(z%8==7):
                    s = A[x][y][z-7:z+1]
                    cacu = 0
                    for k in range(8):
                        if(s[k]=="1" or s[k]==1):
                            cacu += 2**k
                    arr[cnt] = hex(cacu)
                    cnt += 1
    for i in range(200):
        if(int(arr[i],16)<=15):
            print('0' + arr[i][2:],end='  ')
        else:
            print(arr[i][2:],end='  ')
        if(i%16 == 15):
            print('')
    print('')

def ToHex(S):
    l = len(S)
    cnt = 0
    arr = [0]*(l//8)
    for z in range(l):
        if(z%8==7):
            cacu = 0
            str_div = S[z-7:z+1]
            for k in range(8):
                if(str_div[k]=="1" or str_div[k]==1):
                    cacu += 2**k
            arr[cnt] = hex(cacu)
            cnt += 1
    for i in range(l//8):
        if(int(arr[i],16)<=15):
            print('0' + arr[i][2:],end='  ')
        else:
            print(arr[i][2:],end='  ')
        if(i%16 == 15):
            print('')
    print('')


def InputToHex(S):
    l = len(S)
    cnt = 0
    arr = [0]*(l//8)
    rstring = ''
    for z in range(l):
        if(z%8==7):
            cacu = 0
            str_div = S[z-7:z+1]
            for k in range(8):
                if(str_div[k]=="1" or str_div[k]==1):
                    cacu += 2**k
            arr[cnt] = hex(cacu)
            cnt += 1
    for i in range(l//8):
        if(int(arr[i],16)<=15):
            rstring += '0' + str(arr[i][2:])
        else:
            rstring += arr[i][2:]

    return str(rstring)
#################### for string format ####################

def SHA3(B,M,d,SHA_SHAKE):
    in_KECCAK = ''
    # print(B)
    for i in B:
        sb = bin(i)
        sb = sb[2:]
        while len(sb) < 8:
            sb = '0' + sb
        S_rev = ''
        for j in range(8):
            S_rev += sb[7-j]
        # in_KECCAK += 
        in_KECCAK += S_rev
    # print(in_KECCAK)
    if(SHA_SHAKE == 0):
        in_KECCAK += '01'

    else:
        in_KECCAK += '1111'
    result = KECCAK(M, in_KECCAK, d)  # 輸出4096位的結果
    return result


binary_string_shake_256 = (
    "11000101"*50*4
)
bini = InputToHex(binary_string_shake_256)
print(bini)
m = bytes.fromhex(bini)
print(m)
custom_hash_binary_shake_256 = SHA3(m, 512, 4096,1)  
ans = InputToHex(custom_hash_binary_shake_256)

# hashlib_hash_hex = hashlib.sha3_256(m).hexdigest()


hashlib_hash_hex = shake_256()
hashlib_hash_hex.update(m)
hashlib_hash_hex = hashlib_hash_hex.digest(512)
print(hashlib_hash_hex)
hashlib_hash_hex = hashlib_hash_hex.hex()
# if(hashlib_hash_hex == ans):
#     print(f'correct , {hashlib_hash_hex}')
# else:  
#     print(f'error , my = {ans} , anser = {hashlib_hash_hex}')


# hash_obj = sha3_256()
# hash_obj.update(m)
# # print(hash_obj.digest())

# print(bytes.fromhex(ans))


