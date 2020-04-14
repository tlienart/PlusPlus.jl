# Readme

Small fun project stemming from [this discussion on discourse](https://discourse.julialang.org/t/introduce-as-the-concatenation-operator/37418)

```julia
julia> using PlusPlus
julia> length(rand(5) ++ rand(7)) == 12
true

julia> "abc" ++ "def" == "abcdef"
true
```

Generally `++` is the same as `vcat` for anything numeric and the same as `*` for anything string or char.

## Related

(unregistered) [PlusPlus.jl](https://github.com/pkofod/PlusPlus.jl) by [Patrick Kofod Mogensen](https://github.com/pkofod).
