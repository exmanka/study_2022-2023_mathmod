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
end

# ╔═╡ d571f41f-d822-4476-83fc-5c07480d4975
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

# ╔═╡ 19e11d36-4a74-46bd-a8c9-ccf8d003166d
prob = ODEProblem(F!, u₀, T)

# ╔═╡ 720beefb-0292-445d-bb8c-c52833d67aec
sol = solve(prob, saveat=0.2)

# ╔═╡ e6bdd92f-ff39-49af-8dbd-259db4d2dc69
begin
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
	time
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
		plot_title="Измененная модель SIR"
	)

	Plots.plot!(
		fig[1],
		time,
		[ss, ii, rr],
		color=[:blue :red :green],
		xlabel="t",
		ylabel="S(t), I(t), R(t)",
		label=["S(t) — количество здоровых, но восприимчивых к болезни" "I(t) — количество инфицированных" "R(t) — количество вылечившихся с иммунитетом"]
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
