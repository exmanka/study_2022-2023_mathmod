### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ a2ef83c2-b1d1-11ed-0c2d-479d0aeec237
begin
	import Pkg
	Pkg.activate()
	using DifferentialEquations
	using LaTeXStrings
	import Plots
end

# ╔═╡ 448fbfb3-6906-492d-ada1-c67857d72e09
md"""
Решаем систему ОДУ следующего вида:

$$\begin{aligned}
	\frac{\mathrm{d} x}{\mathrm{d} t} = +y \\
	\frac{\mathrm{d} x}{\mathrm{d} t} = -x
\end{aligned}
\quad
\Leftrightarrow
\quad
\frac{\mathrm{d} \mathbf{u}}{\mathrm{d} t} = \mathbf{F}(\mathbf{u}),
\mathbf{u}(t) = 
\begin{pmatrix}u_1(t)\\u_2(t)\end{pmatrix} = 
\begin{pmatrix}x(t)\\y(t)\end{pmatrix},
\quad
\mathbf{F}(\mathbf{u}) =
\begin{pmatrix}+y\\-x\end{pmatrix}$$

С начальными условиями $t_0 = 0, \ x(0)=x_0, \ y(0) = y_0$
"""

# ╔═╡ e411f730-47e1-4159-ba91-3dc99d4b134e
"Правая часть нашей системы, p, t не используются. u[1] -- x, u[2] -- y"
function F!(du, u, p, t)
	du[1] = +u[2] + cos(t)
	du[2] = -u[1] + sin(t)
end

# ╔═╡ 6a13147a-5898-40f1-8407-74091aa31bb1
begin
	u₀ = [1.0, 0.0]
	T = (0.0, 20.0)
	prob = ODEProblem(F!, u₀, T)
end

# ╔═╡ 3f8647f5-b3f7-4453-85e9-3dac1f3ad2eb
sol = solve(prob, saveat=0.1)

# ╔═╡ ecfd54f5-1bb9-4aac-b9a3-31293c72c3cb
begin
	Time = sol.t
	const X = []
	const Y = []
	for u in sol.u
		x, y = u
		push!(X, x)
		push!(Y, y)
	end
	X, Y
end

# ╔═╡ 23a36b44-0f34-4332-b487-4a45ff6d86fd
begin
	fig = Plots.plot(
		layout=(1, 2),
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		background_color=:antiquewhite,
		# aspect_ratio=:equal,
		size=(800, 400),
		plot_title="Пример нескольких графиков"
	)

	Plots.plot!(
		fig[1],
		Time,
		[X, Y],
		color=[:red :blue],
		xlabel="t",
		ylabel="x(t), y(t)",
		label="123"
	)

	# Plots.scatter!(
	# 	fig[1],
	# 	Time,
	# 	[X, Y],
	# 	colot=[:red :blue],
	# 	label=false
	# )

	Plots.plot!(
		fig[2],
		X,
		Y,
		color=:green,
		xlabel="x(t)",
		ylabel="y",
		label="Фазовый портер"
	)
end

# ╔═╡ Cell order:
# ╠═a2ef83c2-b1d1-11ed-0c2d-479d0aeec237
# ╟─448fbfb3-6906-492d-ada1-c67857d72e09
# ╠═e411f730-47e1-4159-ba91-3dc99d4b134e
# ╠═6a13147a-5898-40f1-8407-74091aa31bb1
# ╠═3f8647f5-b3f7-4453-85e9-3dac1f3ad2eb
# ╠═ecfd54f5-1bb9-4aac-b9a3-31293c72c3cb
# ╠═23a36b44-0f34-4332-b487-4a45ff6d86fd
