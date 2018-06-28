
abstract type Food end

struct Fish <: Food end
struct Milk <: Food end
struct Berries <: Food end

function mix(A::Food, B::Food)
	which(mix, (typeof(B), typeof(A))) === which(mix, (Food, Food)) || return mix(B, A)
	which(mix, (typeof(A), typeof(B))) === which(mix, (Food, Food)) ? "don't know how to mix" : return mix(A, B)
end

mix(A::F, B::F) where F<:Food = "more of $(F)"

mix(A::Berries, B::Milk) = "milk shake"


@show mix(Berries(), Berries())
@show mix(Berries(), Milk())
@show mix(Milk(), Berries())
@show mix(Fish(), Milk())
@show mix(Milk(), Fish())

### add new food type
struct Sugar <: Food end

mix(A::Sugar, B::Milk) = "sweet milk"
mix(A::Sugar, B::Berries) = "jam"

@show mix(Sugar(), Milk())
@show mix(Berries(), Sugar())
@show mix(Sugar(), Fish())

