using BenchmarkTools
########################################
## Vectorized Operations
########################################

vectorized(x) 					= sin.(x) .+ 2.0 .* cos.(x).^2
vectorized_macro(x) 		= @. sin(x) + 2.0 * cos(x)^2
not_fully_vectorized(x) = sin.(x) + 2.0 * cos.(x).^2

function looped(x)
	z = similar(x)
	for i in eachindex(x)
		z[i] = sin(x[i]) + 2.0 * cos(x[i])^2
	end
	return z
end

N = 50000
R = rand(N);

@btime vectorized(R)
@btime vectorized_macro(R)
@btime not_fully_vectorized(R)
@btime looped(R)

