using PythonCallTest
using Test

ENV["JULIA_CONDAPKG_BACKEND"] = "Pixi"

using CondaPkg
CondaPkg.add("numpy")
using PythonCall

@testset "PythonCallTest.jl" begin
    @pyexec """
    global np

    import numpy as np

    z = np.sqrt(3**2 + 4**2)
    """ => z::Float64

    @test z === 5.0
end
