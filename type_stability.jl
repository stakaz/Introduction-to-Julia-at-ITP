using BenchmarkTools
########################################
### Type Stability
########################################

### concrete types vs Any (like pure Python)

function randlookup(a, N)
	for i in 1:N
		a[1] += 1
	end
end

R = rand(1:10, 10);
any_array = Array{Any}(R);
int_array = Array(R);
N = 100000

@btime randlookup(any_array, N)
@btime randlookup(int_array, N)

### type stability

unsafe_return_type(x) = x > 0 ? x : 0
safe_return_type(x) = x > 0 ? x : zero(x)

print_with_color(:red, "##########")
@code_llvm     unsafe_return_type(2)
print_with_color(:red, "##########")
@code_llvm     safe_return_type(2)

print_with_color(:red, "##########")
@code_warntype unsafe_return_type(2)
print_with_color(:red, "##########")
@code_warntype safe_return_type(2)

print_with_color(:red, "##########")
@code_llvm     unsafe_return_type(2.0)
print_with_color(:red, "##########")
@code_llvm     safe_return_type(2.0)

print_with_color(:red, "##########")
@code_warntype unsafe_return_type(2.0)
print_with_color(:red, "##########")
@code_warntype safe_return_type(2.0)

