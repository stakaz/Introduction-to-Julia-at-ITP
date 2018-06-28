########################################
### data frames and plotting
########################################
using PyPlot
using DataFrames

D = DataFrame(
	label = ["apple", "apple", "orange", "kiwi", "kiwi"],
	radius = [3.5, 3.7, 4.5, 2.3, 3.1],
	weight = [1.2, 1.3, 2.0, 0.9, 1.0],
	taste = [3, 4, 2, 5, 4],
)

fruit_colors = Dict("apple" => :red, "orange" => :orange, "kiwi" => :green)

D[:label] ## access columns
D[D[:label] .== "kiwi", :] ## filter by condition
sort!(D, cols=[:radius, :weight]) ## sorting
D[[:label, :weight]] ## select multiple columns

### Plotting with matplotlib

plt[:style][:use]("/home/gluon/.config/matplotlib/stas_poster.mplstyle")

for i in unique(D[:label])
	tmp = D[D[:label] .== i, :]
	scatter(tmp[:weight], tmp[:radius], color=fruit_colors[i], label = i)
	legend()
	xlabel("weight")
	ylabel("radius")
end


x = [1, 2, 3, 4, 5, 6]
y = x.^2
plot(x, y)