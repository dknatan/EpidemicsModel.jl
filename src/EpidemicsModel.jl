module EpidemicsModel

using DynamicalSystems, CairoMakie

function SIRV(u, p, t)
    S, I, R, V = u
    β, γ, v = p

    dS = -β * I * S - v * S
    dI = β * I * S - γ * I
    dR = γ * I 
    dV = v * S

    return SVector{4}(dS, dI, dR, dV)
end 

function get_evolution_SIRV(u0, p; Δt=0.1, T=100.0)
    ds = ContinuousDynamicalSystem(SIRV, u0, p)
    traj, timearray = trajectory(ds, T; Δt)
    print("Integrated the dynamical system to time T = $(T)")
    return (traj, timearray)
end

function plot_evolution_SIRV(u0, p, traj, timearray; Δt=0.1, T=100.0)
    fig = Figure(resolution = (1200, 600))
    ax = Axis(fig[1, 1], xlabel = "days", title = "Model at β = $(p[1]), γ = $(p[2]), v = $(p[3])")
    labels=["S", "I", "R", "V"]
    for i=1:4
        lines!(ax, timearray, traj[:,i], linewidth = 3, label=labels[i])
    end
    axislegend()
    fig
    return nothing    
end


end
