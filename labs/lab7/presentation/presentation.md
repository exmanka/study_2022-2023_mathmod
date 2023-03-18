---
## Front matter
lang: ru-RU
title: Лабораторная работа №7
subtitle: Модель рекламной кампании
author:
  - Ким М. А.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 16 марта 2023

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Ким Михаил Алексеевич
  * студент уч. группы НФИбд-01-20
  * Российский университет дружбы народов
  * [1032201664@pfur.ru](mailto:1032201664@pfur.ru)
  * <https://github.com/exmanka>

:::
::: {.column width="30%"}

![](./image/0_me.png)

:::
::::::::::::::

# Вводная часть

## Актуальность

- Необходимость навыков моделирования реальных математических задач, построение графиков.

## Объект и предмет исследования

- Язык программирования Julia
- Язык моделирования Modelica
- Модель рекламной кампании

## Цели и задачи

- Продолжить знакомство с функционалом языков Julia и Modelica.
- Описать математическую модель рекламной кампании с помощью данных языков.
- Построить графики состояния систем в соответствии с поставленными задачами.

## Материалы и методы

- Языки:
  - язык программирования Julia
  - язык моделирования Modelica
- Дополнительный комплекс программ:
  - Программное обеспечение OpenModelica
  - Интерактивный блокнот Pluto.jl

# Процесс выполнения работы

# Формулировка задания

Постройте график распространения рекламы, математическая модель которой описывается следующим уравнением:

1. $\frac{dn}{dt} = (0.77+0.00017n(t))(N-n(t))$

1. $\frac{dn}{dt} = (0.000055+0.29n(t))(N-n(t))$

1. $\frac{dn}{dt} = (0.5 \cdot t + 0.3 \cdot t \cdot n(t))(N-n(t))$

При этом объем аудитории $N=610$, в начальный момент о товаре знает $10$ человек. Для случая 2 определите в какой момент времени скорость распространения рекламы будет иметь максимальное значение.

# Теоретическое введение

Математическая модель рекламной кампании описывается следующим ОДУ:

$$\frac{dn}{dt} = (\alpha_1(t) + \alpha_2(t)n(t))(N-n(t)), $$

где $N$ — число потенциальных клиентов; $n(t)$ — число клиентов, информированных о товаре и готовых его купить; $\frac{dn}{dt}$ — изменение числа клиентов, информированных о товаре и готовых его купить, со временем; $\alpha_1(t)$ — величина, характеризующая интенсивность рекламной компании; $\alpha_2(t)$ — величина, характеризующая интенсивность т.н. «сарафанного радио».

# Pluto.jl
## Код задания №1 (часть 1)

:::::::::::::: {.columns align=center}
::: {.column width="45%"}

![](image/Screenshot_1.png)
![](image/Screenshot_2.png)


:::
::: {.column width="55%"}

![](image/Screenshot_3.png)

:::
::::::::::::::

## Код задания №1 (часть 2)

:::::::::::::: {.columns align=center}
::: {.column width="45%"}

![](image/Screenshot_4.png)


:::
::: {.column width="55%"}

![](image/Screenshot_5.png)

:::
::::::::::::::

## Код задания №1. Получившийся график

:::::::::::::: {.columns align=top}
::: {.column}

![](image/Screenshot_6.png)

:::
::::::::::::::


## Измененный блок кода для задания №2. Получившийся график

:::::::::::::: {.columns align=center}
::: {.column width="40%"}


![](image/Screenshot_7.png)

:::
::: {.column width="60%"}

![](image/Screenshot_8.png)

:::
::::::::::::::


## Измененный блок кода для задания №3. Получившийся график

:::::::::::::: {.columns align=center}
::: {.column width="40%"}


![](image/Screenshot_9.png)

:::
::: {.column width="60%"}

![](image/Screenshot_10.png)

:::
::::::::::::::


# Julia
## Код задания №1. Получившийся график

:::::::::::::: {.columns align=top}
::: {.column width="50%"}

![](image/Screenshot_11.png)

:::
::: {.column width="50%"}

![](image/lab7_1.png)

:::
::::::::::::::

## Измененный блок кода для задания №2. Получившийся график

:::::::::::::: {.columns align=center}
::: {.column width="30%"}


![](image/Screenshot_12.png)

:::
::: {.column width="70%"}

![](image/lab7_2.png)

:::
::::::::::::::

## Измененный блок кода для задания №3. Получившийся график

:::::::::::::: {.columns align=center}
::: {.column width="30%"}


![](image/Screenshot_13.png)

:::
::: {.column width="70%"}

![](image/lab7_3.png)

:::
::::::::::::::


# OpenModelica
## Код задания №1. Получившиейся график

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

![](image/Screenshot_14.png)

:::
::: {.column width="50%"}

![](image/Screenshot_15.png)

:::
::::::::::::::

## Код задания №2. Получившиеся графики. 1

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

![](image/Screenshot_16.png)

:::
::: {.column width="50%"}

![](image/Screenshot_17.png)

:::
::::::::::::::

## Код задания №2. Получившиеся графики. 2

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

![](image/Screenshot_18.png)

:::
::::::::::::::


## Код задания №3. Получившийся график

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

![](image/Screenshot_19.png)

:::
::: {.column width="50%"}

![](image/Screenshot_20.png)

:::
::::::::::::::

# Результаты

- Описана математическая модель рекламной кампании с помощью языков Julia и Modelica.
- Построены графики состояния систем в соответствии с поставленными задачами.

## Вывод

Продолжил знакомство с функционалом языка программирования Julia и языка моделирования Modelica, а также с функционалом программного обеспечения OpenModelica и интерактивного блокнота Pluto. Используя эти средства, построил математическую модель рекламной кампании.
