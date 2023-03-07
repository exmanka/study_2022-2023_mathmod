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
	const c = 0.16
	const d = 0.045
	const a = 0.36
	const b = 0.033
	const x₀ = 10
	const y₀ = 15
	
	"Начальные условия: u₀[1] -- x₀, u₀[2] -- y₀"
	u₀ = [x₀, y₀]

	"Период времени"
	T = (0.0, 70.0)
end

# ╔═╡ d571f41f-d822-4476-83fc-5c07480d4975
"Правая часть нашей системы, p, t не используются. u[1] -- x, u[2] -- y"
function F!(du, u, p, t)
	du[1] = -c * u[1] + d * u[1] * u[2]
	du[2] = a * u[2] - b * u[1] * u[2]
end

# ╔═╡ 19e11d36-4a74-46bd-a8c9-ccf8d003166d
prob = ODEProblem(F!, u₀, T)

# ╔═╡ 720beefb-0292-445d-bb8c-c52833d67aec
sol = solve(prob, dtmax=0.05)

# ╔═╡ e6bdd92f-ff39-49af-8dbd-259db4d2dc69
begin
	const xx = []
	const yy = []
	for u in sol.u
		x, y = u
		push!(xx, x)
		push!(yy, y)
	end
	time = sol.t
	time
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

	Plots.plot!(
		fig[2],
		yy,
		xx,
		color=[:grey],
		xlabel="y(t)",
		ylabel="x(t)",
		label="Зависимость числа хищников (x) от числа жертв (y)"
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
