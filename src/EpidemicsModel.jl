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
    traj, timearray = trajectory(ds, T, Δt)
    print("Integrated the dynamical system to time T = $(T)")
    return nothing
end


end
