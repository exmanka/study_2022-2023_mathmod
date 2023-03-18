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
	const N = 610
	const n₀ = 10
	const α₁ = 0.77
	const α₂ = 0.00017

	"max_der[1] - dn/dt, max_der[2] - n, max_der[3] - t"
	max_der = [-1e6, 0, 0]
		
	"Начальные условия: u₀[1] - n"
	u₀ = [n₀]

	"Период времени"
	T = (0.0, 30.0)
end

# ╔═╡ d571f41f-d822-4476-83fc-5c07480d4975
"Правая часть нашей системы, p не используется. u[1] - n"
function F!(du, u, p, t)
	du[1] = (α₁ + α₂ * u[1]) * (N - u[1])
	
	if du[1] > max_der[1]
		max_der[1] = du[1]
		max_der[2] = u[1]
		max_der[3] = t
	end
end

# ╔═╡ 19e11d36-4a74-46bd-a8c9-ccf8d003166d
prob = ODEProblem(F!, u₀, T)

# ╔═╡ 720beefb-0292-445d-bb8c-c52833d67aec
sol = solve(prob, dtmax=0.1)

# ╔═╡ b141696f-66c1-4a4e-97de-90d0e019c200
begin
	const nn = []
	for u in sol.u
		push!(nn, u[1])
	end
end

# ╔═╡ 71dda8fb-7995-4eb3-80af-9e7a9776c6d5
begin
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
end

# ╔═╡ Cell order:
# ╠═c49b5fc1-7e62-4341-b8a5-682658ea31be
# ╠═81359a0e-696d-415f-beef-9eafd09e7a00
# ╠═d571f41f-d822-4476-83fc-5c07480d4975
# ╠═19e11d36-4a74-46bd-a8c9-ccf8d003166d
# ╠═720beefb-0292-445d-bb8c-c52833d67aec
# ╠═b141696f-66c1-4a4e-97de-90d0e019c200
# ╠═71dda8fb-7995-4eb3-80af-9e7a9776c6d5
