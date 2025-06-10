using PythonCallTest
using Test

ENV["JULIA_CONDAPKG_BACKEND"] = "MicroMamba"

using PythonCall
using CondaPkg
CondaPkg.add("numpy")

@testset "PythonCallTest.jl" begin
    @pyexec """
    global np

    import numpy as np

    z = np.sqrt(3**2 + 4**2)
    """ => z::Float64

    @test z === 5.0
end
