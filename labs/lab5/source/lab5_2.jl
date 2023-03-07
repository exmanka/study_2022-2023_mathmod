using DifferentialEquations
using Plots

const c = 0.16
const d = 0.045
const a = 0.36
const b = 0.033
const x₀ = a / b
const y₀ = c / d

@show x₀
@show y₀

"Начальные условия: u₀[1] -- x₀, u₀[2] -- y₀"
u₀ = [x₀, y₀]

"Период времени"
T = (0.0, 70.0)

"Правая часть нашей системы, p, t не используются. u[1] -- x, u[2] -- y"
function F!(du, u, p, t)
	du[1] = -c * u[1] + d * u[1] * u[2]
	du[2] = a * u[2] - b * u[1] * u[2]
end


prob = ODEProblem(F!, u₀, T)
sol = solve(prob, dtmax=0.05)

const xx = []
const yy = []
for u in sol.u
    x, y = u
    push!(xx, x)
    push!(yy, y)
end
time = sol.t

fig = Plots.plot(
	layout=(1, 2),
	dpi=150,
	grid=:xy,
	gridcolor=:black,
	gridwidth=1,
	# aspect_ratio=:equal,
	size=(800, 400),
	legend=:outerbottom,
	plot_title="Модель «хищник-жертва»"
)

Plots.plot!(
	fig[1],
	time,
	[xx, yy],
	color=[:red :blue],
	xlabel="t",
	ylabel="x(t), y(t)",
	label=["x(t) — число хищников" "y(t) — число жертв"]
)

Plots.scatter!(
	fig[2],
	yy,
	xx,
	color=[:blue],
	xlabel="y(t)",
	ylabel="x(t)",
	label="Зависимость числа хищников (x) от числа жертв (y)"
)


savefig(fig, "../lab5_2")