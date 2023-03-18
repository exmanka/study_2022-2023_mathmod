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
end

# ╔═╡ d571f41f-d822-4476-83fc-5c07480d4975
"Правая часть нашей системы, p не используется. u[1] - M₁, u[2] - M₂"
function F!(du, u, p, t)
	# t = t / c₁
	du[1] = u[1] - (b/c₁) * u[1] * u[2] - (a₁/c₁) * u[1]^2
	du[2] = (c₂/c₁) * u[2] - (b/c₁) * u[1] * u[2] - (a₂/c₁) * u[2]^2
end

# ╔═╡ 19e11d36-4a74-46bd-a8c9-ccf8d003166d
prob = ODEProblem(F!, u₀, T)

# ╔═╡ 720beefb-0292-445d-bb8c-c52833d67aec
sol = solve(prob, dtmax=c₁*5)

# ╔═╡ b141696f-66c1-4a4e-97de-90d0e019c200
begin
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
		xlabel="θ = t/c₁",
		ylabel="M₁(t), M₂(t)",
		plot_title="Модель конкуренции двух фирм. Случай 1")

	Plots.plot!(fig[1], time, [M₁, M₂], color=[:blue :green], label=["M₁ — оборотные средства предприятия №1" "M₂ — оборотные средства предприятия №2"])
end

# ╔═╡ Cell order:
# ╠═c49b5fc1-7e62-4341-b8a5-682658ea31be
# ╠═81359a0e-696d-415f-beef-9eafd09e7a00
# ╠═d571f41f-d822-4476-83fc-5c07480d4975
# ╠═19e11d36-4a74-46bd-a8c9-ccf8d003166d
# ╠═720beefb-0292-445d-bb8c-c52833d67aec
# ╠═b141696f-66c1-4a4e-97de-90d0e019c200
# ╠═71dda8fb-7995-4eb3-80af-9e7a9776c6d5
