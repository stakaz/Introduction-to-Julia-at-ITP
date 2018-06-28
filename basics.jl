########################################
### Numbers and Strings
########################################
1 # integer
2.0 # float
3//2 # rational
b = big"123456789012345678901234567890" + 1
typeof(b)
s = "String"

s = 'c' #char

3 ≠ 4 # or !=
3 ≥ 4 # or >=
3//3 == 1 == 1.0

### Generators
typeof(1:10)
typeof(linspace(1,2,10))

########################################
### Arrays as Matricies
########################################
## , 			- separator
## space	- horizontal concatination
## ;			- vertical concatination
a = [1 2] # 1x2 2-dimensional Array
b = [5 6]' # 2x1 2-dimensional Array (1x2 Array transposed)
c = [1, 2] # 1-dimensioal Array but [1; 2] is the same, not 2x1 Array
A = [1 2; 3 4] # 2x2 2-dimensional Array
[1 ; 2]
A' # conjugate transposed A
A.' # transposed A
A^-1 # inversed A or inv(A)
A * b # matrix multiplication = column vector
typeof(A * b)
A * c # also works = 1-dim Array
typeof(A * c)
x = A \ b # solution to Ax = b
A * x

### map and filter
B = map(x -> x^2, A)
C = filter(x -> x ≤ 2, A)

### comprehension
B = A.^2
C = A[A .≤ 2]

########################################
## Functions
########################################
## short form on one line
f(x) = 2x

## long form with doc string
"""
	f(x)

This is very handy and useful to write doc strings
# Example
```
f(2) = 4
```
"""
function f(x)
	2x # with optional return keyword
end

## annonymous functions / lambdas
x -> 2x
## or long form
function (x)
	2x
end

########################################
### C and Python calls
########################################
t = ccall((:clock, "libc"), Int32, ())


using PyCall
@pyimport math
math.sin(math.pi / 4) - sin(pi / 4)

