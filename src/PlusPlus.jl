module PlusPlus

export (++)

(++)(x::AbstractVector, y::AbstractVector) = vcat(x, y)
(++)(x::AbstractString, y::AbstractString) = x * y

(++)(x, ::Nothing) = x
(++)(::Nothing, x) = x

end # module
