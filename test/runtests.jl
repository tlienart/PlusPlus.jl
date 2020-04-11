using PlusPlus
using Test

@testset "vectors"  begin
    x = rand(5)
    y = rand(7)
    z = x ++ y
    @test length(z) == 12
    @test z == vcat(x, y)
    @test z isa AbstractVector

    @test x ++ nothing === x
    @test nothing ++ x === x
end

@testset "strings" begin
    x = "hello"
    y = "goodbye"
    z = x ++ y
    @test z isa String
    @test z == x * y

    @test x ++ "" == x
end
