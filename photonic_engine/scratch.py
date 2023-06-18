import jax.numpy as jnp
from jax import random
from jax.scipy.linalg import eigh

# Define a 10x10 random symmetric matrix
n = 10

key = random.PRNGKey(0)
x = random.normal(key, (n,n))

matrix = random.normal(key, (n,n))
symmetric_matrix = (matrix + matrix.T) / 2

# Compute eigenvalues and eigenvectors
eigenvalues, eigenvectors = eigh(symmetric_matrix)

print("Eigenvalues:\n", eigenvalues)
print("\nEigenvectors:\n", eigenvectors)

# To install jax, hit the following pain points:
# 1. Needed to increase docker ram from 7.9 GB to 13 GB, otherwise it crashed
# 1. Needed to run the pip install dist/*whl command (the one suggested in the output). Then I ran python setup.py install --user in the jax/ directory, idk if that was necessary
# 2. After successfully building/setting up, importing only worked when inside the jax/ source directory
# 3. Previously had an old version of jax installed from pip- uninstalled w/ pip uninstall, and copied the jax/ directory that was in a version-specific .egg directory inside site-packages inside site-packages itself
# 4. At this point, looked 