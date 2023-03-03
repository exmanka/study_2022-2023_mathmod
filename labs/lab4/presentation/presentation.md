---
## Front matter
lang: ru-RU
title: Лабораторная работа №4
subtitle: Математическая модель гармонических колебаний
author:
  - Ким М. А.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 03 марта 2023

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

![](./image/me.png)

:::
::::::::::::::

# Вводная часть

## Актуальность

- Необходимость навыков моделирования реальных математических задач, построение графиков.

## Объект и предмет исследования

- Язык программирования Julia
- Язык моделирования Modelica
- Математическая модель гармонических колебаний

## Цели и задачи

- Продолжить знакомство с функционалом языков Julia и OpenModelica.
- Смоделировать математические модели гармонических колебаний с помощью данных языков.
- Построить графики состояния систем в соответствии с поставленными задачами.

## Материалы и методы

- Языки программирования:
  - Julia
  - OpenModelica

# Процесс выполнения работы

# Формулировка задания

Постройте фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для следующих случаев:

1. Колебания гармонического осциллятора без затуханий и без действий внешней силы $\ddot x + 2.5x = 0$.
1. Колебания гармонического осциллятора c затуханием и без действий внешней силы $\ddot x + 10\dot x + 11x = 0$.
1. Колебания гармонического осциллятора c затуханием и под действием внешней силы $\ddot x + \dot x + x = 3 \sin(t)$.

На интервале $t \in [0; \ 65]$ (шаг $0.05$) с начальными условиями $x_0=-1, \ y_0=2$.

# Pluto.jl

## Код задания №1

:::::::::::::: {.columns align=top}
::: {.column}

![](image/Screenshot_1.png)
![](image/Screenshot_2.png)

:::
::: {.column}

![](image/Screenshot_3.png)
![](image/Screenshot_4.png)

:::
::::::::::::::

## Графики задания №1

:::::::::::::: {.columns align=top}
::: {.column}

![](image/Screenshot_5.png)

:::
::::::::::::::

## Измененные блоки кода для задания №2. Получившиеся графики

:::::::::::::: {.columns align=center}
::: {.column}


![](image/Screenshot_6.png)

:::
::: {.column}

![](image/Screenshot_7.png)

:::
::::::::::::::

## Измененные блоки кода для задания №3. Получившиеся графики

:::::::::::::: {.columns align=center}
::: {.column width="50%"}


![](image/Screenshot_8.png)

:::
::: {.column width="50%"}

![](image/Screenshot_9.png)

:::
::::::::::::::

# Julia

## Код задания №1. Получившиеся графики

:::::::::::::: {.columns align=top}
::: {.column width="30%"}

![](image/Screenshot_10.png)

:::
::: {.column width="70%"}

![](image/lab4_1.png)

:::
::::::::::::::

## Измененные блоки кода для задания №2. Получившиеся графики

:::::::::::::: {.columns align=center}
::: {.column width="50%"}


![](image/Screenshot_11.png)

:::
::: {.column width="50%"}

![](image/lab4_2.png)

:::
::::::::::::::

## Измененные блоки кода для задания №3. Получившиеся графики

:::::::::::::: {.columns align=center}
::: {.column width="50%"}


![](image/Screenshot_12.png)

:::
::: {.column width="50%"}

![](image/lab4_3.png)

:::
::::::::::::::

# OpenModelica

## Код задания №1. Получившиеся графики

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

![](image/Screenshot_13.png)

:::
::: {.column width="30%"}

![](image/Screenshot_14.png)
![](image/Screenshot_15.png)

:::
::::::::::::::

## Код задания №2. Получившиеся графики

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

![](image/Screenshot_16.png)

:::
::: {.column width="30%"}

![](image/Screenshot_17.png)
![](image/Screenshot_18.png)

:::
::::::::::::::

## Код задания №3. Получившиеся графики

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

![](image/Screenshot_19.png)

:::
::: {.column width="30%"}

![](image/Screenshot_20.png)
![](image/Screenshot_21.png)

:::
::::::::::::::

# Результаты

- Смоделированы математические модели гармонических колебаний с помощью данных языков.
- Построены графики состояния систем в соответствии с поставленными задачами.

## Вывод

Продолжил знакомство с функционалом языка программирования Julia и языка моделирования Modelica, а также с функционалом программного обеспечениея OpenModelica. Используя эти средства, построил математические модели гармонических колебаний.
