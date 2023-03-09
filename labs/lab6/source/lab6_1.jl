using DifferentialEquations
using Plots


const α = 0.75
const β = 0.25
@show α / β

const N = 11000
const I₀ = 111
const R₀ = 11
const S₀ = N - I₀ - R₀
const I⁺ = 200
@show S₀


"Начальные условия: u₀[1] - S₀, u₀[1] - I₀, u₀[1] - R₀"
u₀ = [S₀, I₀, R₀]

"Период времени"
T = (0.0, 30.0)

"Правая часть нашей системы, p, t не используются. u[1] - S, u[2] - I, u[3] - R"
function F!(du, u, p, t)
	if u[2] > I⁺
		println("I(t) > I⁺, I(t) = ", u[2])
		du[1] = - α * u[1]
		du[2] = α * u[1] - β * u[2]
	else
		println("I(t) ≤ I⁺, I(t) = ", u[2])
		du[1] = 0
		du[2] = - β * u[2]
	end
	du[3] = β * u[2]
end

prob = ODEProblem(F!, u₀, T)
sol = solve(prob, saveat=0.2)


const ss = []
const ii = []
const rr = []
for u in sol.u
	s, i, r = u
	push!(ss, s)
	push!(ii, i)
	push!(rr, r)
end
time = sol.t

fig = Plots.plot(
	dpi=150,
	grid=:xy,
	gridcolor=:black,
	gridwidth=1,
	size=(800, 400),
	legend=:outerbottom,
	plot_title="Измененная модель SIR"
)

Plots.plot!(
	fig[1],
	time,
	[ss, ii, rr],
	color=[:blue :red :green],
	xlabel="t",
	ylabel="S(t), I(t), R(t)",
	label=["S(t) — количество здоровых, но восприимчивых к болезни" "I(t) — количество инфицированных" "R(t) — количество вылечившихся, получивших иммунитет"]
)
savefig(fig, "../lab6_1")