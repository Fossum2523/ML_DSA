test1 = IntegerToBits(50,6)
# print(test1)

# test2 = BitsToInteger(test1)
# print(test2)

# test3 = IntegerToByte(50,1)
# print(test3)

# test4 = BitsToBytes([0,0,1,1,1,1,1,0,0,1])
# print(test4)

# test5 = BytesToBits(test4)
# print(test5)

# b0 = 2
# b1 = 2
# b2 = 2

# test6 = CoeffFromThreeBytes(b0,b1,b2)
# print(test6)

# test7 = 14
# test7 = CoeffFromHalfByte(test7)
# print(test7)

# test8 = [636, 887, 785, 837, 203, 998, 891, 229, 404, 93, 647, 284, 987, 799, 478, 938, 849, 395, 982, 780, 979, 608, 323, 629, 1020, 291, 907, 50, 913, 845, 670, 638, 252, 923, 359, 587, 749, 971, 991, 774, 288, 63, 222, 127, 363, 657, 604, 314, 616, 113, 445, 530, 490, 372, 111, 319, 811, 933, 101, 45, 873, 255, 624, 271, 853, 444, 664, 950, 884, 328, 779, 786, 357, 38, 565, 970, 169, 75, 208, 78, 142, 448, 547, 133, 133, 834, 250, 422, 664, 94, 656, 954, 332, 669, 184, 136, 554, 722, 428, 301, 927, 354, 161, 916, 426, 479, 456, 892, 108, 262, 823, 608, 902, 872, 335, 860, 670, 52, 545, 192, 53, 299, 677, 77, 771, 97, 61, 149, 395, 67, 900, 327, 95, 646, 12, 676, 460, 34, 145, 644, 13, 339, 566, 500, 661, 746, 938, 717, 329, 240, 252, 345, 84, 784, 610, 184, 792, 868, 687, 117, 3, 167, 190, 972, 904, 624, 735, 164, 593, 736, 803, 27, 245, 14, 599, 528, 625, 1010, 565, 325, 592, 488, 931, 856, 725, 668, 897, 135, 168, 239, 905, 1008, 926, 70, 862, 139, 24, 774, 552, 29, 766, 765, 398, 619, 403, 264, 290, 978, 572, 844, 11, 692, 627, 860, 559, 517, 153, 63, 114, 536, 919, 110, 26, 594, 43, 579, 289, 158, 411, 854, 361, 390, 842, 501, 813, 261, 538, 344, 355, 876, 112, 1011, 358, 982, 534, 122, 416, 387, 526, 627, 283, 162, 437, 54, 534, 608]
# test8 = SimpleBitPack(test8,1023)
# print(test8)

# test9 = test8
# test9 = SimpleBitUnpack(test9,1023)
# print(test9)

# test10 = [-2, 2, -1, -1, 0, -2, -1, -1, 1, 2, -1, 0, 0, -1, -1, 2, 1, 1, 0, 1, -2, 0, 2, -2, 1, 0, 0, 1, 2, 2, 0, -1, 0, 2, 1, 2, 0, -2, 0, 2, 2, -1, -2, -1, -2, 2, 2, 2, 0, 2, 0, -2, -2, 0, -1, 0, 1, 0, 1, -2, 0, -2, 2, 2, 0, 0, 1, 2, -1, -2, -2, -2, -2, -2, 1, 2, 0, 1, -1, 0, -1, 1, -2, 2, -1, 2, -1, 0, 1, -2, -1, -1, 0, 0, 0, 0, -2, -1, 1, 0, 2, 1, -2, 2, 1, 0, 0, -1, 0, -1, 2, 2, 0, 0, 2, -2, 1, -1, 2, 0, -1, 2, -1, 1, -2, 1, 0, -1, 1, -2, 0, 2, 0, 1, -2, 1, 0, 0, 1, -1, 1, 2, 1, -1, -1, -2, -2, -2, -2, 2, 2, 2, 2, 1, -2, -2, 0, -2, 2, 0, -2, 0, -2, 0, 2, 1, -1, 2, 1, 1, 2, 1, 0, 0, -2, 1, -1, -1, -2, 1, 2, 1, -2, 2, -1, 1, -2, 0, 0, -2, 0, -2, -2, 0, 0, 0, 1, -2, 2, -1, -1, -2, -1, 2, 2, 2, 0, 0, 0, 1, 1, 2, 2, -2, 1, 2, 0, -1, 2, 2, 2, -2, -1, -2, 2, 1, -1, 1, -2, -2, -2, 2, -2, -2, -1, 1, 1, 0, -2, -2, 1, -1, -2, 2, -2, -2, 0, 2, -2, 0, 0, -1, 1, -1, 2, -1]
# test10 = BitPack(test10,2,2)
# print(test10)

# test11 = test10
# test11 = BitUnpack(test11,2,2)
# print(test11)