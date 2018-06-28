using BenchmarkTools
########################################
### Slicing is a View by Default
########################################

expansive_slice_operation(x) = maximum(x[:, 5:2:9, 3:5])
expansive_slice_operation_view(x) = maximum(@view x[:, 5:2:9, 3:5])

for N in [300, 100, 10]
	@show N
	R = rand(N,N,N)

	@btime copied = expansive_slice_operation(R)
	@btime viewed = expansive_slice_operation_view(R)
end

expansive_slice_operation(x) = maximum(x[:, 1])
expansive_slice_operation_view(x) = maximum(@view x[:, 1])

for N in [20000, 10000, 100]
	@show N
	R = rand(N,N)

	@btime copied = expansive_slice_operation(R)
	@btime viewed = expansive_slice_operation_view(R)
end