"""

This application uses Python 3.10 or great to generate data for the use in the field of Data Science.

"""


# Import libaries
import numpy as np
import pandas as pd

"""
Create a function 'gen_data'.
Arguments:
- n: int (number of data points to generate)
Returns:
- A Pandas DataFrame with 'n' rows and 2 columns (x, y)
Details
- Produces a set of 'n' random data points (x, y) where 'x' is a  number in the range [1,20] and 'y' is a random floating point in the range [1000, 2000].
- The 'y' value should be within 2 decimal places.
"""

def gen_data(n):
    # Generate random data points
    x = np.random.randint(1, 21, n)
    y = np.random.uniform(1000, 2000, n)
    y = np.round(y, 2)
    # Create a DataFrame
    data = {'x': x, 'y': y}
    df = pd.DataFrame(data)
    return df

# Call the function

n = int(input("Enter the number of data points to generate: "))
data = gen_data(n)

print(data)