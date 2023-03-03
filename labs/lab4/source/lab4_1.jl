using DifferentialEquations
using Plots

const ω₀² = 2.5
	
"Начальные условия: u₀[1] -- x₀, u₀[2] -- y₀"
u₀ = [-1, 2]

"Период времени"
T = (0.0, 65.0)

"Правая часть нашей системы, p, t не используются. u[1] -- x, u[2] -- y"
function F!(du, u, p, t)
	du[1] = u[2]
	du[2] = - ω₀² * u[1]
end


prob = ODEProblem(F!, u₀, T)
sol = solve(prob, saveat=0.05, abstol=1e-8, reltol=1e-8)

const xx = []
const yy = []
for u in sol.u
    x, y = u
    push!(xx, x)
    push!(yy, y)
end
Time = sol.t

fig = Plots.plot(
		layout=(1, 2),
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		# aspect_ratio=:equal,
		size=(800, 400),
		plot_title="Модель гармонических колебаний"
	)

Plots.plot!(
	fig[1],
	Time,
	[xx, yy],
	color=[:red :blue],
	xlabel="t",
	ylabel="x(t), y(t)=x'(t)",
	label=["x(t)" "y(t)=x'(t)"]
)

Plots.plot!(
	fig[2],
	xx,
	yy,
	color=[:gray],
	xlabel="x(t)",
	ylabel="y(t)=x'(t)",
	label="Фазовый портрет"
)


savefig(fig, "../lab4_1")