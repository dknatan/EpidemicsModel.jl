module EpidemicsModel

using DynamicalSystems

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
    using Plots
    labels = ["Susceptible", "Infected", "Recovered", "Vaccinated"] #[traj[1,:] traj[2,:] traj[3,:] traj[4,:]]
    plot(timearray, traj, title= "Model at β = $(p[1]), γ = $(p[2]), v = $(p[3])", label=labels, linewidth=3)

end


end
