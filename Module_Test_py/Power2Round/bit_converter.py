a = 0
b = 0
round = 0

a = a + 13
while(a!=0):
    a = a + 13
    if(a >= 64):
        a = a % 64
        print(f"round = {round}, a = {a}")
        round = round + 1
