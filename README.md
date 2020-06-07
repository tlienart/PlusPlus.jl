# PlusPlus

Small fun project stemming from [this discussion on discourse](https://discourse.julialang.org/t/introduce-as-the-concatenation-operator/37418)

```julia
julia> using PlusPlus
julia> length(rand(5) ++ rand(7)) == 12
true

julia> "abc" ++ "def" == "abcdef"
true

julia> [1 2; 3 4] ++ [2 1]
3×2 Array{Int64,2}:
 1  2
 3  4
 2  1
 
 julia> (1, 2, 3) ++ (4, 5)
(1, 2, 3, 4, 5)

julia> (1, 2, 3) ++ [4, 5]
5-element Array{Int64,1}:
 1
 2
 3
 4
 5
```

Generally `++` is the same as `vcat` for anything arraylike, efficiently splats tuples into a bigger tuple and is the same as `*` for anything string or char.

## Contributors

This package is effectively 3 LOC with 100% refactoring of said LOC by [Cameron Bieganek](https://github.com/CameronBieganek).

## Related

(unregistered) [PlusPlus.jl](https://github.com/pkofod/PlusPlus.jl) by [Patrick Kofod Mogensen](https://github.com/pkofod).
