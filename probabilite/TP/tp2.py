from scipy.special import factorial,binom  
import numpy as np
import matplotlib.pyplot as plt


# print(factorial(5))
# print(binom(5, 2)) 

def simul_planche(x, p):
    position = 0
    for n in range(x):
        k = np.random.choice([0, 1], p=[1 - p, p]) #vu sur https://numpy.org/doc/stable/reference/random/generated/numpy.random.choice.html#numpy.random.choice
        position += k
    return position


def galton(billes, etage):
    p = 0.5
    positions = [simul_planche(etage, p) for _ in range(billes)]
    plt.hist(positions, bins=etage + 1, density=True, color='b')
    plt.xlabel("Pos finale")
    plt.ylabel("Freq")
    plt.grid(True)
    plt.show()

galton(1000000, 10)
