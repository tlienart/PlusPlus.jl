module PlusPlus

export (++)

(++)(x::AbstractVector, y::AbstractVector) = vcat(x, y)
# fallback
(++)(x, y) = vcat(x, y)

const ASC = Union{AbstractString, AbstractChar}
(++)(x::ASC, y::ASC) = x * y

end # module
