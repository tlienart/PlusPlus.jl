# This file was generated, do not modify it. # hide
using DataFrames
using PlusPlus
df = DataFrame(A = 1:4, B = ["M", "F", "F", "M"])
df2 = DataFrame(A = 1:4, B = ["M", "F", "F", "M"])
df ++ df2