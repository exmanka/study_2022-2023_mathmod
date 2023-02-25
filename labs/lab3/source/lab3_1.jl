using Plots
using DifferentialEquations


const a = 0.333
const b = 0.777
const c = 0.5
const h = 0.65

"Начальные условия: u₀[1] - x₀, u₀[2] - y₀"
u₀ = [10000, 29000]

"Период времени"
T = (0.0, 1.8)

function F!(du, u, p, t)
	du[1] = -a * u[1] - b * u[2] + 1.6 * sin(t)
	du[2] = -c * u[1] - h * u[2] + 1.7 * cos(t + 2)
end


prob = ODEProblem(F!, u₀, T)
sol = solve(prob, saveat=0.01)

const xx = []
const yy = []
for u in sol.u
    x, y = u
    if x < 0 || y < 0
        break
    end
    push!(xx, x)
    push!(yy, y)
end
time = sol.t[1:size(xx)[1]]

plt = Plots.plot(
		layout=(1, 2),
		dpi=300,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		size=(800, 400),
		plot_title="Модель военных действий"
	)

plot!(plt[1], time, [xx, yy], color=[:red :blue], xlabel="Время", ylabel="Численность войск", label=["Армия X" "Армия Y"])
plot!(plt[2], xx, yy, color=[:gray], xlabel="Армия X", ylabel="Армия Y", label="Численность войск")
savefig(plt, "lab3_1")
