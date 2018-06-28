using BenchmarkTools
########################################
### Recursion
########################################

function factorial_rec(x)
	if x > 0
		x * factorial_rec(x - 1)
	else
		one(x)
	end
end

function factorial_loop(x)
	r = one(x)
	while x > 0
		r *= x
		x = x - 1
	end
	r
end

const number = big"500"
@btime factorial_rec(number)
@btime factorial_loop(number)
