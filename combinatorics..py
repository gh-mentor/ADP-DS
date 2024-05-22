"""
This module contains a few functions for combinatorial mathematics, which is the branch of mathematics that deals with counting, arranging, and ordering objects in a set. Combinatorics is used in various fields, such as computer science, statistics, and physics, to solve problems related to counting, probability, and optimization. This module provides functions for calculating permutations, combinations, and other combinatorial quantities.
"""

"""
TODO refactor the functions into a class 'Combinatorics'. The methods should be static.
"""

"""
Create a recursive factorial function 'fact' that calculates the factorial of a given integer n. The factorial of a non-negative integer n is the product of all positive integers less than or equal to n. 
Details:
- The factorial of 0 is defined to be 1.
- The function uses memoization to store previously calculated results and avoid redundant calculations.
- if n = 0 or n = 1 return 1
- return n * fact(n - 1)
"""
def fact(n, memo={}):
    if n in memo:
        return memo[n]
    if n == 0 or n == 1:
        result = 1
    else:
        result = n * fact(n - 1, memo)
    memo[n] = result
    return result

"""
Create a function 'perm' that calculates the number of permutations of n objects taken r at a time. A permutation is an arrangement of objects in a specific order. The number of permutations of n objects taken r at a time is given by the formula n! / (n - r)!.
"""
def perm(n, r):
    return fact(n) // fact(n - r)

