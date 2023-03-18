using DifferentialEquations
using Plots


const N = 610
const n₀ = 10
const α₁ = 0.000055
const α₂ = 0.29

"max_der[1] - dn/dt, max_der[2] - n, max_der[3] - t"
max_der = [-1e6, 0, 0]
	
"Начальные условия: u₀[1] - n"
u₀ = [n₀]

"Период времени"
T = (.0, .1)

"Правая часть нашей системы, p не используется. u[1] - n"
function F!(du, u, p, t)
	du[1] = (α₁ + α₂ * u[1]) * (N - u[1])
	
	if du[1] > max_der[1]
		max_der[1] = du[1]
		max_der[2] = u[1]
		max_der[3] = t
	end
end


prob = ODEProblem(F!, u₀, T)
sol = solve(prob, dtmax=.001)


const nn = []
for u in sol.u
	push!(nn, u[1])
end

fig = Plots.plot(
	dpi=150,
	grid=:xy,
	gridcolor=:black,
	gridwidth=1,
	size=(800, 400),
	legend=:outerbottom,
	xlabel="t",
	ylabel="n(t)",
	plot_title="Эффективность рекламы")

Plots.plot!(fig[1], sol.t, nn, color=:blue, label="n(t) — число потребителей, узнавших о товаре и готовых его купить")
Plots.vline!(fig[1], [max_der[3]], color=:grey, label="")
Plots.scatter!(fig[1], [max_der[3]], [max_der[2]], color=:grey, markerstrokewidth=0.2, markersize=4, label="t=" * string(max_der[3]) * " — время, в момент которого скорость распространения рекламы максимальна")

savefig(fig, "../lab7_2")