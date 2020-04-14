using PlusPlus
using Test

@testset "vectors"  begin
    x = rand(5)
    y = rand(7)
    z = x ++ y
    @test length(z) == 12
    @test z == vcat(x, y)
    @test z isa AbstractVector

    @test x ++ nothing == vcat(x, nothing)
    @test nothing ++ x == vcat(nothing, x)
    @test 2 ++ 2 == vcat(2, 2)
end

@testset "strings" begin
    x = "hello"
    y = "goodbye"
    z = x ++ y
    @test z isa String
    @test z == x * y

    @test x ++ "" == x

    @test 'a' ++ 'b' == "ab"
    @test "hell" ++ 'o' == "hello"
    @test 'h' ++ "ello" == "hello"
end
