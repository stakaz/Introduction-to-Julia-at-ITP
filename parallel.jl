using BenchmarkTools
########################################
### Parallel Processing
########################################
# pi example from https://www.juliabloggers.com/monthofjulia-day-12-parallel-processing/

addprocs(4 - length(procs())) ## add not more than 4 proccesses

function single_findpi(N)
	inside = 0
	for i in 1:N
		x, y = rand(2)
		inside += x^2 + y^2 ≤ 1 ? 1 : 0
	end
	4 * inside / N
end

function parallel_findpi(N)
	inside = @parallel (+) for i in 1:N
		x, y = rand(2)
		x^2 + y^2 ≤ 1 ? 1 : 0
	end
	4 * inside / N
end

@show N1 = 1_000
@btime single_findpi(N1)
@btime parallel_findpi(N1)

@show N2 = 100_000
@btime single_findpi(N2)
@btime parallel_findpi(N2)

@show N3 = 1_000_000
@btime single_findpi(N3)
@btime parallel_findpi(N3)