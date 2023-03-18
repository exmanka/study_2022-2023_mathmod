using DifferentialEquations
using Plots


const M¹₀ = 2.2 * 1e6
const M²₀ = 1.5 * 1e6
const τ₁ = 13
const τ₂ = 16
const p₁ = 10 * 1e3
const p₂ = 8 * 1e3
const p_cr = 17 * 1e3
const N = 20 * 1e3
const q = 1

const a₁ = p_cr / (τ₁^2 * p₁^2 * N * q)
const a₂ = p_cr / (τ₂^2 * p₂^2 * N * q)
const b = p_cr / (τ₁^2 * p₁^2 * τ₂^2 * p₂^2 * N * q)
const c₁ = (p_cr - p₁) / (τ₁ * p₁)
const c₂ = (p_cr - p₂) / (τ₂ * p₂)
	
"Начальные условия: u₀[1] - M¹₀, u₀[2] - M²₀"
u₀ = [M¹₀, M²₀]

"Период времени"
T = (0.0, c₁*300)

"Правая часть нашей системы, p не используется. u[1] - M₁, u[2] - M₂"
function F!(du, u, p, t)
	# t = t / c₁
	du[1] = u[1] - ((b/c₁) + 0.0014) * u[1] * u[2] - (a₁/c₁) * u[1]^2
	du[2] = (c₂/c₁) * u[2] - (b/c₁) * u[1] * u[2] - (a₂/c₁) * u[2]^2
end


prob = ODEProblem(F!, u₀, T)
sol = solve(prob, dtmax=c₁)


const M₁ = []
const M₂ = []
for u in sol.u
	m₁, m₂ = u
	push!(M₁, m₁)
	push!(M₂, m₂)
end

time = sol.t
for i in 1:length(time)
	time[i] /= c₁
end

@show c₁

fig = Plots.plot(
	layout=(2, 1),
	dpi=150,
	grid=:xy,
	gridcolor=:black,
	gridwidth=1,
	size=(800, 800),
	legend=:bottomright,
	xlabel="θ = t/c₁",
	ylabel="M₁(t), M₂(t)",
	plot_title="Модель конкуренции двух фирм. Случай 2")

Plots.plot!(fig[1], time, [M₁, M₂], color=[:blue :green], label=["M₁ — оборотные средства предприятия №1" "M₂ — оборотные средства предприятия №2"])
Plots.plot!(fig[2], [time[1:25]], [M₁[1:25]], color=:blue, label="M₁ — оборотные средства предприятия №1")

savefig(fig, "../lab8_2")