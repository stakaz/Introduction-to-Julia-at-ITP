########################################
## Introspection
########################################

f(x) = x^2

@code_lowered f(1)
@code_typed f(1)
@code_llvm f(1)
@code_native f(1)

## check if the function is type-stable
## or some type are not known at compile time
@code_warntype f(1)

