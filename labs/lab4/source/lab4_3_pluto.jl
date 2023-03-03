### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ c49b5fc1-7e62-4341-b8a5-682658ea31be
begin
	import Pkg
	Pkg.activate()
	using DifferentialEquations
	using LaTeXStrings
	import Plots
end

# ╔═╡ 81359a0e-696d-415f-beef-9eafd09e7a00
begin
	const ω₀² = 1.0
	const 𝛄⬝2 = 1.0
	
	function f(t)
		return 3 * sin(t)
	end
	
	"Начальные условия: u₀[1] -- x₀, u₀[2] -- y₀"
	u₀ = [-1, 2]

	"Период времени"
	T = (0.0, 65.0)
end

# ╔═╡ d571f41f-d822-4476-83fc-5c07480d4975
"Правая часть нашей системы, p, t не используются. u[1] -- x, u[2] -- y"
function F!(du, u, p, t)
	du[1] = u[2]
	du[2] = - 𝛄⬝2* u[2] - ω₀² * u[1] + f(t)
end

# ╔═╡ 19e11d36-4a74-46bd-a8c9-ccf8d003166d
prob = ODEProblem(F!, u₀, T)

# ╔═╡ 720beefb-0292-445d-bb8c-c52833d67aec
sol = solve(prob, saveat=0.05, abstol=1e-8, reltol=1e-8)

# ╔═╡ e6bdd92f-ff39-49af-8dbd-259db4d2dc69
begin
	const xx = []
	const yy = []
	for u in sol.u
		x, y = u
		push!(xx, x)
		push!(yy, y)
	end
	Time = sol.t
	Time
end

# ╔═╡ 71dda8fb-7995-4eb3-80af-9e7a9776c6d5
begin
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
		ylabel="x(t), y(t)",
		label=["x(t)" "y(t)"]
	)

	Plots.plot!(
		fig[2],
		xx,
		yy,
		color=[:gray],
		xlabel="x(t)",
		ylabel="y(t)",
		label="Фазовый портрет"
	)
end

# ╔═╡ Cell order:
# ╠═c49b5fc1-7e62-4341-b8a5-682658ea31be
# ╠═81359a0e-696d-415f-beef-9eafd09e7a00
# ╠═d571f41f-d822-4476-83fc-5c07480d4975
# ╠═19e11d36-4a74-46bd-a8c9-ccf8d003166d
# ╠═720beefb-0292-445d-bb8c-c52833d67aec
# ╠═e6bdd92f-ff39-49af-8dbd-259db4d2dc69
# ╠═71dda8fb-7995-4eb3-80af-9e7a9776c6d5
