DEFAULT_PARAMETERS = {
    "ML_DSA_44": {
        "q": 8380417,  # number of modulus
        "d": 13,  # number of bits dropped from t
        "tau": 39,  # number of ±1 in c
        "lamda": 128, # collision strength of c
        "gamma_1": 131072,  # coefficient range of y: 2^17
        "gamma_2": 95232,  # low order rounding range: (q-1)/88
        "k": 4,  # Dimensions of A = (k, l)
        "l": 4,  # Dimensions of A = (k, l)
        "eta": 2,  # Private key range
        "beta": 78,
        "omega": 80,  # Max number of ones in hint
        "c_tilde_bytes": 32,
    },
    "ML_DSA_65": {
        "q": 8380417,  # number of modulus
        "d": 13,  # number of bits dropped from t
        "tau": 49,  # number of ±1 in c
        "lamda": 192, # collision strength of c
        "gamma_1": 524288,  # coefficient range of y: 2^19
        "gamma_2": 261888,  # low order rounding range: (q-1)/32
        "k": 6,  # Dimensions of A = (k, l)
        "l": 5,  # Dimensions of A = (k, l)
        "eta": 4,  # Private key range
        "beta": 196,
        "omega": 55,  # Max number of ones in hint
        "c_tilde_bytes": 48,
    },
    "ML_DSA_87": {
        "q": 8380417,  # number of modulus
        "d": 13,  # number of bits dropped from t
        "tau": 60,  # number of ±1 in c
        "lamda": 256, # collision strength of c
        "gamma_1": 524288,  # coefficient range of y: 2^19
        "gamma_2": 261888,  # low order rounding range: (q-1)/32
        "k": 8,  # Dimensions of A = (k, l)
        "l": 7,  # Dimensions of A = (k, l)
        "eta": 2,  # Private key range
        "beta": 120,
        "omega": 75,  # Max number of ones in hint
        "c_tilde_bytes": 64,
    },
}


ML_DSA_44 = DEFAULT_PARAMETERS["ML_DSA_44"]
ML_DSA_65 = DEFAULT_PARAMETERS["ML_DSA_65"]
ML_DSA_87 = DEFAULT_PARAMETERS["ML_DSA_87"]