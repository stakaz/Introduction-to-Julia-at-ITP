########################################
### Macro expansion
########################################
@macroexpand @. [1, 2, 3] + sin([4, 5, 6])
@macroexpand @show x = 3

########################################
### Metaprogramming
########################################
struct VarNumber{T<:Number}
	value::T
	name::String
end

Base.show(io::IO, x::VarNumber) = print(io,"$(x.name) = $(round(x.value,6))")

for op in [:*, :/, :+, :-, :^, :÷, :%]
	op_str = String(op)

	@eval (Base.$op)(x::VarNumber, y::Number) = VarNumber(($op)(x.value, y), "($(x.name)$($op_str)$(y))")
	@eval (Base.$op)(x::Number, y::VarNumber) = VarNumber(($op)(x, y.value), "($(x)$($op_str)$(y.name))")
	@eval (Base.$op)(x::VarNumber, y::VarNumber) = VarNumber(($op)(x.value, y.value), "($(x.name)$($op_str)$(y.name))")
end

for op in [:sin, :cos, :exp, :log, :tan]
	op_str = String(op)
	@eval (Base.$op)(x::VarNumber) = VarNumber(($op)(x.value), "$($op_str)($(x.name))")
end

a = VarNumber(2.0, "a")
b = VarNumber(3, "b")
c = VarNumber(3.0 + 1.0im, "c")

a^2.0
d = 2.0 * sin(a)  + 3.0
a + 2.0 * exp(c)
a * (b + c)
a * b + c
b % 2
d^2.0

