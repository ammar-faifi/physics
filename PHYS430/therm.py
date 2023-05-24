import numpy as np
import matplotlib.pyplot as plt

# Parameters
mass = 1.0  # mass of the particle
k = 1.0  # spring constant for the harmonic oscillator
T = 300.0  # temperature of the thermal bath in Kelvin
kb = 1.38e-23  # Boltzmann constant

# Time step and number of steps
dt = 0.01
num_steps = 100000

# Arrays to store time, position, and velocity
time = np.zeros(num_steps)
position = np.zeros(num_steps)
velocity = np.zeros(num_steps)

# Array to store the temperature of the harmonic oscillator
temperature = np.zeros(num_steps)

# Initial conditions for the harmonic oscillator
position[0] = 0.0
velocity[0] = 0.0

# Initial conditions for the thermal bath particle
v_bath = np.sqrt(
    2 * kb * T / mass
)  # Initial velocity from Maxwell-Boltzmann distribution

# Main loop
for i in range(num_steps - 1):
    # Update position and velocity of the harmonic oscillator using Euler's method
    acceleration = -k / mass * position[i]
    velocity[i + 1] = velocity[i] + acceleration * dt
    position[i + 1] = position[i] + velocity[i] * dt

    # Update the temperature of the harmonic oscillator
    temperature[i + 1] = mass * velocity[i + 1] ** 2 / (2 * kb)

    # Check for collision
    if np.abs(position[i + 1]) < dt * v_bath:
        # Elastic collision: update velocities of both particles
        velocity[i + 1], v_bath = v_bath, velocity[i + 1]
        # Randomize velocity of thermal bath particle
        v_bath += np.sqrt(2 * kb * T / mass) * np.random.normal()

    # Update time
    time[i + 1] = time[i] + dt

# Plot the results
plt.figure(figsize=(10, 6))
plt.plot(time, temperature)
plt.xlabel("Time")
plt.ylabel("Temperature (K)")
plt.title("Thermalization of an oscillating particle")
plt.grid(True)
plt.show()
