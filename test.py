# %%
import matplotlib.pyplot as plt
import numpy as np

# %%

N = np.arange(1, 10, 2)
x = np.arange(0, 6 * np.pi, 0.1)


def fun(x):
    sum_ = 0
    for i in N:
        sum_ += np.sin(i * x) / i

    return 1 / 2 + 2 / np.pi * sum_


plt.plot(x, fun(x), "-b")
plt.show()