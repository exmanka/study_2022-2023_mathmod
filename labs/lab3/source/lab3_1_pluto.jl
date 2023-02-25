### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ d28547fa-b1e7-11ed-1d02-09c91b20c48f
begin
	import Pkg
	Pkg.activate()
	using DifferentialEquations
	using LaTeXStrings
	import Plots
end

# ╔═╡ e01da6b9-3ced-4221-9d4e-137bcdc9bb7b
begin
	const a = 0.333
	const b = 0.777
	const c = 0.5
	const h = 0.65
	
	"Начальные условия: u₀[1] -- x₀, u₀[2] -- y₀"
	u₀ = [10000, 29000]

	"Период времени"
	T = (0.0, 1.8)
end

# ╔═╡ 48119946-a2a3-4379-9944-1574b2d6e77f
"Правая часть нашей системы, p, t не используются. u[1] -- x, u[2] -- y"
function F!(du, u, p, t)
	du[1] = -a * u[1] - b * u[2] + 1.6 * sin(t)
	du[2] = -c * u[1] - h * u[2] + 1.7 * cos(t + 2)
end

# ╔═╡ 7bfe80e1-a9b9-4de4-b21d-32f1afd94185
prob = ODEProblem(F!, u₀, T)

# ╔═╡ 76ec680f-adca-4146-a662-362cb32100b2
sol = solve(prob, saveat=0.01)

# ╔═╡ bc8c1f2d-af0f-42f8-85ae-01f5b3e994cd
begin
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
	Time = sol.t[1:size(xx)[1]]
	Time
end

# ╔═╡ 466ed9f9-b2c7-4949-9570-84f81db92d4f
begin
	fig = Plots.plot(
		layout=(1, 2),
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		# background_color=:antiquewhite,
		# aspect_ratio=:equal,
		size=(800, 400),
		plot_title="Пример нескольких графиков"
	)

	Plots.plot!(
		fig[1],
		Time,
		[xx, yy],
		color=[:red :blue],
		xlabel="Время",
		ylabel="Численность войск",
		label=["Армия X" "Армия Y"]
	)

	Plots.plot!(
		fig[2],
		xx,
		yy,
		color=[:gray],
		xlabel="Армия X",
		ylabel="Армия Y",
		label="Численность войск"
	)
end

# ╔═╡ 65c6d893-ea72-40fe-9860-865548a0c295
Plots.savefig(fig, "lab3_1")

# ╔═╡ Cell order:
# ╠═d28547fa-b1e7-11ed-1d02-09c91b20c48f
# ╠═e01da6b9-3ced-4221-9d4e-137bcdc9bb7b
# ╠═48119946-a2a3-4379-9944-1574b2d6e77f
# ╠═7bfe80e1-a9b9-4de4-b21d-32f1afd94185
# ╠═76ec680f-adca-4146-a662-362cb32100b2
# ╠═bc8c1f2d-af0f-42f8-85ae-01f5b3e994cd
# ╠═466ed9f9-b2c7-4949-9570-84f81db92d4f
# ╠═65c6d893-ea72-40fe-9860-865548a0c295
