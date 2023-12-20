module EpidemicsModel

using DynamicalSystems, CairoMakie

function initiated_status()
    print("properly imported EpidemicsModel YES")
    return nothing
end

"""@docs
SIRV is the RHS of a continuous ODE and returns derivatives.
"""
function SIRV(u, p, t)
    S, I, R, V = u
    β, γ, v = p

    dS = -β * I * S / (S + I + R + V) - v * S
    dI = β * I * S / (S + I + R + V) - γ * I
    dR = γ * I 
    dV = v * S

    return SVector{4}(dS, dI, dR, dV)
end 

"""@docs
get_evolution_SIRV builds a dynamical systems object and solves it until time T
"""
function get_evolution_SIRV(u0, p; Δt=0.1, T=100.0)
    ds = ContinuousDynamicalSystem(SIRV, u0, p)
    traj, timearray = trajectory(ds, T; Δt)
    print("Integrated the dynamical system to time T = $(T)")
    return (traj, timearray)
end

"""@docs
plot_evolution_SIRV plots a SIRV dynamical system solution
"""
function plot_evolution_SIRV(u0, p, traj, timearray; Δt=0.1, T=100.0)
    fig = Figure(resolution = (1200, 600))
    ax = Axis(fig[1, 1], xlabel = "days", title = "Model at β = $(p[1]), γ = $(p[2]), v = $(p[3])")
    labels=["S", "I", "R", "V"]
    for i=1:4
        lines!(ax, timearray, traj[:,i], linewidth = 3, label=labels[i])
    end
    axislegend()
    fig
end


end
