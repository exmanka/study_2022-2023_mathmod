# Дополнительная информация
# dr(r) = r / √(3)              # Короткая запись функции, sqrt(3) ~ \sqrt + TAB 3
# Φ = range(0, 2π, 1000)        # 100 значений от 0 до 2π
# @show ϕ                       # Макрос, позволяющий выводить не только значение, но и имя переменной.
# rfloat = rand(0.0:0.0001:2π)  # Случайное float64 значение от 0.0 до 2π с шагом 0.0001


# Подключение библиотек
using Plots
using DifferentialEquations


const n = 2.5


"Правая часть ОДУ: u - переменная (скаляр или массив), p - параметры  (кортеж, tuple), t - аргумент (скаляр, время)."
function F(u, p, t)
    # аргументы p, t нужны для работы метода
    return u / √(n * n - 1)
end

"Функция решения задачи, a - начальное расстояние катера от лодки, n - отношение скорости катера к лодке"
function the_chase_curve(a, n, flag)
    "Расстояние, на котором катер начнет описывать спираль"
    r = 0.0
    "Интервал спирали"
    T = (0.0, 0.0)

    if flag == 0
        r = a / (n + 1)
        T = (0, 2π)
    elseif flag == 1
        r = -(a / (n - 1))
        T = (-π, π)
    else
        println("Неправильно выбран флаг")
        return -1
    end

    # Задача
    prob = ODEProblem(F, abs(r), T)

    # Решение задачи
    sol = solve(
        prob,
        dtmax=0.5
    )
    
    # Задание пустого пространства
    plt = plot(       
        proj=:polar,
        ylims=(0.0, round(abs(sol.u[size(sol.u)[1]])) + 10.0),
        aspect_ratio=:equal,    # Размер одного деления по осям всегда одинакова
        dpi=600,
        legend=true            # Отображение легенды
        # bg=:black
    )
    
    @show sol.t
    @show sol.u
    
    r_idx = rand(1:size(sol.t)[1])
    r_angle = sol.t[r_idx]
    # r_angle_list = [sol.t[r_idx] for n in 1:size(sol.t)[1]]
    
    plot!(plt, xlabel="θ", ylabel="r(t)", title="Кривая погони. Частный случай", legend=:outerbottom)
    savefig(plt, "lab2_" * string(flag) * "_0")
    
    plot!(plt, [0.0, 0.0], [a, r], label="Начальное катера движение по прямой", color=:brown, lw=0.4)
    scatter!(plt, [0.0], [a], label= "", mc=:brown, ms=0.4)
    plot!(plt, [r_angle, r_angle], [0.0, sol.u[1]], label="Траектория лодки", color=:blue, lw=0.4)
    scatter!(plt, [r_angle], [sol.u[1]], label="", mc=:blue, ms=0.01)
    plot!(plt, [sol.t[1], sol.t[1]], [sol.u[1], sol.u[1]], label="Тракетория катера", color=:red, lw=0.4)
    savefig(plt, "lab2_" * string(flag) * "_1")
    
    for i in 2:size(sol.t)[1]
        # Добавление параметров в пространство
        plot!(plt, [r_angle, r_angle], [sol.u[i-1], sol.u[i]], label="", color=:blue, lw=0.4)
        scatter!(plt, [r_angle], [sol.u[i]], label="", mc=:blue, ms=0.01)
    
        plot!(plt, [sol.t[i-1], sol.t[i]], [sol.u[i-1], sol.u[i]], label="", color=:red, lw=0.4)
        scatter!(plt, [sol.t[i]], [sol.u[i]], label="", mc=:red, ms=0.01)
    
        savefig(plt, "lab2_" * string(flag) * "_" * string(i))
    end

    return 0
end


the_chase_curve(6.2, n, 1)
