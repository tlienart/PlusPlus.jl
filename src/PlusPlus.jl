module PlusPlus

export (++)

++(args::Union{AbstractString,AbstractChar}...) = *(args...)

++(args...) = vcat(args...)

++(x) = x
++(x::Tuple, y::Tuple) = (x..., y...)
++(x::Tuple, y::Tuple, z...) = (x..., ++(y, z...)...)

++(args::Dict...) = merge(args...)
++(args::NamedTuple...) = merge(args...)

end
