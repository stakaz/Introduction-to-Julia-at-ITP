########################################
### Scoping
########################################

x,y = 1, 1
function f()
	x = 2
	println("x inside f = ", x)
	println("y inside f = ", y)
end
f()
@show x, y

x = 1
function g()
	global x = 2
	println("x inside g = ", x)
end
g()
@show x

x, y = 1, 1
function h()
	x = 2
	function h_in_h()
		x = 3
		y = 3
	end
	h_in_h()
	println("x inside h = ", x)
	println("y inside f = ", y)
end
h()
@show x, y