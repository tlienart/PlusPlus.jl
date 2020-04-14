module PlusPlus

export (++)

++(args::Union{AbstractString,AbstractChar}...) = *(args...)

++(args...) = vcat(args...)

end
