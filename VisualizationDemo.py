"""
This Python 3 application uses the pandas library for data manipulation and matplotlib for data visualization.
Details:
- This script first generates a random set of data points for 5 categories. 
- It then creates a pandas DataFrame from this data. 
- Finally, it uses matplotlib to create a pie chart from this data, with the categories as labels. The autopct parameter in the pie function specifies the format of the percentage on the pie chart
"""

# Import the necessary libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import random

# Generate sample data represented by a set of 5 categories in a collection
data = {
    'Category' : ['Meats', 'Fruits', 'Vegetables', 'Dairy', 'Grains'],
    'Values' : [random.randint(1, 100) for i in range(5)]
   
}

# Create a pandas DataFrame from the data
df = pd.DataFrame(data)

# Create a pie chart from the data
plt.pie(df['Values'], labels = df['Category'], autopct='%1.1f%%')
plt.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
plt.title('Sample Data Distribution')
plt.show()