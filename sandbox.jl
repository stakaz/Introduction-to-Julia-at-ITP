using BenchmarkTools

A = [1, 2, 3]
B = -1000:3
f1(x) = A ∋ x ∈ B
f2(x) = x ∈ A && x ∈ B
@btime f1(2)
@btime f2(2)

