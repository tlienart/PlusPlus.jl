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

    @test x ++ x ++ x == vcat(x, x, x)
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

    @test "a" ++ 'b' ++ "he" == "abhe"
end

@testset "tuples" begin
    @test ++(1) == 1
    @test (1, 2, 3) ++ (4, 5) == (1, 2, 3, 4, 5)
    @test (1,2,3) ++ (4,5) ++ ("hi", "bye") == (1, 2, 3, 4, 5, "hi", "bye")
    @test (1, 2, 3) ++ [4, 5] == [1, 2, 3, 4, 5]
end
