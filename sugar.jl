using BenchmarkTools
########################################
## Syntactic Sugar
########################################
f(x) = 2x
g(x) = x^2
h(x) = x + 1

(f ∘ g)(3) # f(g(x)) = 2 * (3^2) = 18
(f ∘ g).([3, 4, 5])

((x -> √x) ∘ g)(2)

(sort ∘ unique)([7, 5, 1, 4, 5, 1])

### function addition and multiplication

⊕(f::Function, g::Function) = (x...) -> f(x...) + g(x...)
f::Function ⊗ g::Function = (x...) -> f(x...) * g(x...)

(f ⊕ g)(3)
(f ⊗ g)(3)
(h ⊕ f ⊗ g)(3) ## precedence works automatically ;)
(h ⊕ f ⊕ g)(3)


[i^2 for i ∈ [1, 2, 3] if i ≥ 2] ## Array construction with for

(i^2 for i ∈ [1, 2, 3] if i ≥ 2) ## Iterator construction with for

Dict(1 => 2, 3 => 4)
Dict("$i^2" => i^2 for i ∈ [1, 2, 3]) ## Dict construction with for

[1, 2, 3] ∋ 7 # check if in Array, alternative to 7 ∈ S or 7 in S
7 ∉ [1, 2, 3] # alternative to !(7 in S)

A = [1, 2, 3]
B = -1000:3
f1(x) = A ∋ x ∈ B
f2(x) = x ∈ A && x ∈ B
@btime f1(2)
@btime f2(2)

## abbreviate functions with greek letters
σ² = var
μ = mean
x = [1, 2, 3]
A = [1 2; 3 4]
σ²(x) # variace
μ(x) # mean
μ(A) # mean of all elems
μ(A, 1) # mean along dimension 1
μ(A, 2) # mean along dimension 2
## dimensions are column based !


S = [1, 2, 3, 3, 1, 3]
T = [4, 5, 5, 3]
# union
S ∪ T
### BUT !!!
T ∪ S
# Construct the union of two or more sets.
# Maintains order with arrays.

# intersect
S ∩ T
### BUT !!!
T ∩ S
# Construct the intersection of two or more sets.
# Maintains order and multiplicity of the first
# argument for arrays and ranges.
### Sets
S = Set(S)
T = Set(T)
V = Set([1:9;])

S ∪ T
T ∪ S
S ∩ T
T ∩ S

∅ = Set()

A::Set ⊂ B::Set = all(B ∋ i for i ∈ A)
A::Set ⊃ B::Set = B ⊂ A

∅ ⊂ T
S ⊂ T
S ⊂ V
V ⊃ T

