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
	using DelimitedFiles
	import Plots
end

# ╔═╡ 5ae95716-ad53-4bb6-adb3-4ea87fcb82b1
begin
	const influenza = [3, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 2, 2, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, 3, 1, 3, 0, 0, 1, 4, 2, 4, 3, 11, 13, 3, 4, 4, 14, 7, 16, 9, 12, 14, 3, 4, 10, 1, 1, 3, 0, 1, 0, 1, 0, 1, 3, 1, 0, 0, 5]

	writedlm( "influenza_college_1978_dataset.csv", influenza, ',')
end

# ╔═╡ 2b50039d-d857-4980-a048-c35650bb1765
begin
	df = readdlm("influenza_college_1978_dataset.csv", ',', Float64)
	const days = [i for i in 1:length(df)]
	@show df
end

# ╔═╡ 89c10a38-1e9a-4e82-b4c7-42efbbd56976
begin
	df_sis = zeros(Int64, size(df)[1])
	df_sis[1] = df[1]
	for i = 2:length(df)
		df_sis[i] += df_sis[i-1] + df[i]
	end
	@show df_sis
end

# ╔═╡ 1dac297d-4c3f-4ae0-8a9c-6f83376c5782
begin
	fig1 = Plots.plot(
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		size=(800, 400),
		legend=:topleft,
		plot_title="Случаи заболевания гриппом в кампусе колледжа в 1978"
	)

	Plots.plot!(
		fig1[1],
		days,
		df,
		color=[:blue],
		xlabel="Число дней",
		ylabel="Число заболеваний в день",
		label="Число зафиксированных заболеваний за день"
	)
end

# ╔═╡ 14d56be2-f183-4865-905a-49c7ed772c14
begin
	fig2 = Plots.plot(
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		size=(800, 400),
		legend=:topleft,
		plot_title="Случаи заболевания гриппом в кампусе колледжа в 1978"
	)

	Plots.plot!(
		fig2[1],
		days,
		df_sis,
		color=[:blue],
		xlabel="Число дней",
		ylabel="Число заболеваний",
		label="Суммарное число заболевших"
	)
end

# ╔═╡ 81359a0e-696d-415f-beef-9eafd09e7a00
begin
	const β = 0.30
	const γ = 0.16
	@show R₀ = β / γ
	
	const N = 418
	const I₀ = 1
	const S₀ = N - I₀
	@show S₀
	
	"Начальные условия: u₀[1] - S₀, u₀[1] - I₀"
	u₀ = [S₀, I₀]

	"Период времени"
	T = (1.0, length(df))
end

# ╔═╡ d571f41f-d822-4476-83fc-5c07480d4975
"Правая часть нашей системы, p, t не используются. u[1] - S, u[2] - I"
function F!(du, u, p, t)
	du[1] = - β * u[1] * u[2] / N + γ * u[2]
	du[2] = β * u[1] * u[2] / N - γ * u[2]
end

# ╔═╡ 19e11d36-4a74-46bd-a8c9-ccf8d003166d
prob = ODEProblem(F!, u₀, T)

# ╔═╡ 720beefb-0292-445d-bb8c-c52833d67aec
sol = solve(prob, saveat=1)

# ╔═╡ e6bdd92f-ff39-49af-8dbd-259db4d2dc69
begin
	const ss = []
	const ii = []
	for u in sol.u
		s, i = u
		push!(ss, s)
		push!(ii, i)
	end
	time = sol.t
	time
end

# ╔═╡ 4f95f4de-f6de-42a5-a4fc-a724811ec1d7

begin
	fig4 = Plots.plot(
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		size=(800, 400),
		legend=:topleft,
		plot_title="Модель SIS"
	)

	Plots.plot!(
		fig4[1],
		time,
		ii,
		color=:red,
		xlabel="t",
		ylabel="Число инфицированных",
		label="I(t) — количество инфицированных"
	)
end

# ╔═╡ aa4109d0-aa97-4dbf-985c-981668c4941b
begin
	fig3 = Plots.plot(
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		size=(800, 400),
		legend=:left,
		plot_title="Модель SIS"
	)

	Plots.plot!(
		fig3[1],
		time,
		[ss, ii],
		color=[:blue :red],
		xlabel="t",
		ylabel="Число человек в популяции",
		label=["S(t) — количество здоровых, но восприимчивых к болезни" "I(t) — количество инфицированных"]
	)
end

# ╔═╡ 21773d77-3c34-48a9-9ea8-aa6fdc2689ef
begin
	fig5 = Plots.plot(
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		size=(800, 400),
		legend=:topleft,
		plot_title="Сравнение модели и реальных данных"
	)

	Plots.plot!(
		fig5[1],
		days,
		[ii, df_sis],
		color=[:red :blue],
		xlabel="t",
		ylabel="Число заболевших",
		label=["Количество заболевших согласно модели" "Количество заболевших согласно исследованию"]
	)
end

# ╔═╡ ed4064ee-9cab-4f13-b2bc-7bb309cfc9ab
begin
	Plots.savefig(fig1, "../fig1")
	Plots.savefig(fig2, "../fig2")
	Plots.savefig(fig3, "../fig3")
	Plots.savefig(fig4, "../fig4")
	Plots.savefig(fig5, "../fig5")
end

# ╔═╡ Cell order:
# ╠═c49b5fc1-7e62-4341-b8a5-682658ea31be
# ╠═5ae95716-ad53-4bb6-adb3-4ea87fcb82b1
# ╠═2b50039d-d857-4980-a048-c35650bb1765
# ╠═89c10a38-1e9a-4e82-b4c7-42efbbd56976
# ╠═1dac297d-4c3f-4ae0-8a9c-6f83376c5782
# ╠═14d56be2-f183-4865-905a-49c7ed772c14
# ╠═4f95f4de-f6de-42a5-a4fc-a724811ec1d7
# ╠═81359a0e-696d-415f-beef-9eafd09e7a00
# ╠═d571f41f-d822-4476-83fc-5c07480d4975
# ╠═19e11d36-4a74-46bd-a8c9-ccf8d003166d
# ╠═720beefb-0292-445d-bb8c-c52833d67aec
# ╠═e6bdd92f-ff39-49af-8dbd-259db4d2dc69
# ╠═aa4109d0-aa97-4dbf-985c-981668c4941b
# ╠═21773d77-3c34-48a9-9ea8-aa6fdc2689ef
# ╠═ed4064ee-9cab-4f13-b2bc-7bb309cfc9ab
