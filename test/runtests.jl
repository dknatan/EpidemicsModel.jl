using EpidemicsModel
using Test

@testset "EpidemicsModel.jl" begin
    # Write your tests here.
    @test EpidemicsModel.SIRV([10.0, 10.0, 10.0, 10.0], [0.0, 0.0, 0.0], "k") == SVector{4}(0.0, 0.0, 0.0, 0.0)
    @test EpidemicsModel.SIRV([0.0, 0.0, 0.0, 0.0], [10.0, 10.0, 10.0], "k") == SVector{4}(0.0, 0.0, 0.0, 0.0)
end
