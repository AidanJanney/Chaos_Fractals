using Plots
# define the Lorenz attractor
@kwdef mutable struct Lorenz
    dt::Float64 = 0.005
    σ::Float64 = 10
    ρ::Float64 = 28
    β::Float64 = 8/3
    x::Float64 = 2
    y::Float64 = 1
    z::Float64 = 1
end



function step!(l::Lorenz)
    dx = l.σ * (l.y - l.x)
    dy = l.x * (l.ρ - l.z) - l.y
    dz = l.x * l.y - l.β * l.z
    l.x += l.dt * dx
    l.y += l.dt * dy
    l.z += l.dt * dz
end

attractor = Lorenz()

# initialize a 3D plot with 1 empty series
plt = plot3d(
    1,
    xlim = (-30, 30),
    ylim = (-30, 30),
    zlim = (0, 60),
    title = "Lorenz Attractor",
    marker = 0,
    legend=false,
)


# build an animated gif by pushing new points to the plot, saving every 10th frame
@gif for i=1:15000
    step!(attractor)
    push!(plt, attractor.x, attractor.y, attractor.z)
end every 50


savefig(plt, "attractor.png")