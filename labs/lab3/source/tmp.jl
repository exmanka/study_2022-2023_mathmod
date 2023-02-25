### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ b178fc08-b1cb-11ed-37b3-6b5d245806ac
begin
"""Некоторая функция"""
function func(x, y)
	println("I am a function")
	return x + y
end

func(10, 20)
end

# ╔═╡ 028b5e20-0805-4db3-8f45-51d2b89d3612
func(10, 20)

# ╔═╡ 1bba02f0-933c-4f4a-a58d-706511a5262c
2//3 + 3//4

# ╔═╡ 4089806c-644e-4474-b751-efb4c88f9bd0
2/3 + 3/4

# ╔═╡ ecd6956e-4d79-49b2-bf99-50d5a88ccfe4
rand()

# ╔═╡ e99d179b-c9df-4b24-be05-3db0bd38ee69
x = [1, 2, 3, 4, 5]

# ╔═╡ 841f0644-1f7f-4248-aad5-782344879403
typeof(x)

# ╔═╡ d58ec44c-af17-4fea-8bb8-dfea073d52f3
factorial(BigInt(90)) # Очень большое число

# ╔═╡ e756c933-c627-4f57-b321-944d037ca3b9
md"""
# Заголовок 1
### Заголовок 3
Андрей, как там послание?
Можно использовать все стандартные средства форматирования: __жирно__, _курсивно_, `моношириннно`.

```cpp
int main()
{

	return 0
}
```

$\frac{\dot y}{x_1 \cdot x_2 \cdot \ldots \cdot x_3}$
"""

# ╔═╡ edbc225b-bdc9-4a96-8878-fc8b4d154bad
T = (0, π)

# ╔═╡ 63ca3e30-b15f-4aee-a4c3-934787e18cbb


# ╔═╡ Cell order:
# ╠═b178fc08-b1cb-11ed-37b3-6b5d245806ac
# ╠═028b5e20-0805-4db3-8f45-51d2b89d3612
# ╠═1bba02f0-933c-4f4a-a58d-706511a5262c
# ╠═4089806c-644e-4474-b751-efb4c88f9bd0
# ╠═ecd6956e-4d79-49b2-bf99-50d5a88ccfe4
# ╠═e99d179b-c9df-4b24-be05-3db0bd38ee69
# ╠═841f0644-1f7f-4248-aad5-782344879403
# ╠═d58ec44c-af17-4fea-8bb8-dfea073d52f3
# ╠═e756c933-c627-4f57-b321-944d037ca3b9
# ╠═edbc225b-bdc9-4a96-8878-fc8b4d154bad
# ╠═63ca3e30-b15f-4aee-a4c3-934787e18cbb
