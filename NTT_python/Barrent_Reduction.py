def barrett_reduction(z, p, b, k, mu):
    """
    Implements Algorithm 2.14 Barrett Reduction.
    
    Parameters:
        z (int): The number to reduce.
        p (int): The modulus.
        b (int): The base.
        k (int): log_b(p) + 1.
        mu (int): Precomputed value floor(b^(2k) / p).
        
    Returns:
        int: z mod p.
    """
    # Step 1: Compute q_hat
    q_hat = (z // b**(k-1)) * mu // b**(k+1)
    
    # Step 2: Compute r
    r = (z % b**(k+1)) - (q_hat * p % b**(k+1))
    
    # Step 3: Adjust r if it's negative
    if r < 0:
        r += b**(k+1)
    
    # Step 4: Adjust r if it's greater than or equal to p
    while r >= p:
        r -= p
    
    # Step 5: Return r
    return r

# Example test
p = 8380417
b = 2
k = 23  # log2(12289) + 1
mu = (b**(2*k)) // p
z = 8380419  # Example input

barrett_result = barrett_reduction(z, p, b, k, mu)
print(barrett_result)
