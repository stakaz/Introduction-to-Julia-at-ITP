########################################
### automatic derivative
########################################
using Calculus ## finite differences
using ForwardDiff ## automatic differentiation

f(x) = sin(x) / x
df(x) = cos(x) / x - sin(x) / x^2

x = 1.0e-4
df(x)
ForwardDiff.derivative(f, x)
Calculus.derivative(f, x)

x = 1.0e-40
df(x)
ForwardDiff.derivative(f, x)
Calculus.derivative(f, x)

## correct answer (df(x)/dx) (x = 3.0e-143) = -5.415370496329717*10^126
x = 3.0e-143
df(x)
ForwardDiff.derivative(f, x)
Calculus.derivative(f, x)

setprecision(BigFloat, 500)
x = big"1.0e-50000"
df(x)
ForwardDiff.derivative(f, x)
Calculus.derivative(f, x)


g(x) = log(gamma(x))

x = 3.0^-8
digamma(x)
ForwardDiff.derivative(g, x)
Calculus.derivative(g, x)

x = 3.0^-120
digamma(x)
ForwardDiff.derivative(g, x)
# Calculus.derivative(g, x) #fails
