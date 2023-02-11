---
## Front matter
lang: ru-RU
title: Лабораторная работа №1
subtitle: Работа с Git, GitHub, а также Markdown
author:
  - Ким М. А.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 11 февраля 2023

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

- Важно уметь работать с Git'ом
- Научная презентация --- рабочий инструмент исследователя, создаваемый с помощью Markdown
- Необходимо создавать текстовые работы быстро
- Желательна минимизация усилий для создания презентации

## Объект и предмет исследования

- Git: работа с репозиториями
- GitHub: использование в качестве центрального сервера
- Markdown: написание текстовых работ

## Цели и задачи

- Создать репозиторий курса по шаблону, осуществить коммиты
- Написать отчет, используя язык Markdown

## Материалы и методы

- Распределенная система управления версиями [Git](https://git-scm.com/)
- Процессор `pandoc` для входного формата Markdown
- Результирующие форматы
	- `pdf`
	- `html`
  - `docx`
- Автоматизация процесса создания: `Makefile`

# Процесс выполнения работы

# Работа с Git и GitHub

## Создание директории

![](image/Screenshot_1.png)

## Генерирация пары SSH-ключей

![](image/Screenshot_2.png)

## Добавленние ключей на GitHub

![](image/Screenshot_3.png)

## Устанавливка пакета gh

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

![](image/Screenshot_4.png)

:::
::: {.column width="50%"}

![](image/Screenshot_5.png)

:::
::::::::::::::

## Копирование шаблонного репозитория

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

![](image/Screenshot_6.png)

:::
::: {.column width="50%"}

![](image/Screenshot_7.png)

:::
::::::::::::::

## Просмотр всех доступных целей make и списка доступных курсов

![](image/Screenshot_8.png)

## Удаление package.json, создание необходимых каталогов

![](image/Screenshot_9.png)

## Первый коммит и загрузка на GitHub

:::::::::::::: {.columns align=center}
::: {.column width="33%"}

![](image/Screenshot_10.png)

:::
::: {.column width="33%"}

![](image/Screenshot_11.png)

:::
::: {.column width="33%"}

![](image/Screenshot_12.png)

:::
::::::::::::::

# Настройка конвертации файлов .md в .pdf, .docx, .html

## Установка необходимых пакетов

:::::::::::::: {.columns align=center}
::: {.column width="35%"}

![](image/Screenshot_13.png)

:::
::: {.column width="65%"}

![](image/Screenshot_14.png)

:::
::::::::::::::

## Устранение ошибки конвертации. Способ 1

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

![](image/Screenshot_15.png)
![](image/Screenshot_17.png)

:::
::: {.column width="50%"}

![](image/Screenshot_16.png)

:::
::::::::::::::

## Устранение ошибки конвертации. Способ 2 — лучший

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

![](image/Screenshot_19.png)
![](image/Screenshot_20.png)
![](image/Screenshot_21.png)

:::
::: {.column width="40%"}

![](image/Screenshot_22.png)
![](image/Screenshot_23.png)

:::
::::::::::::::

# Работа с Markdown

## Составление отчета в Markdown

:::::::::::::: {.columns align=center}
::: {.column width="45%"}

![](image/Screenshot_24.png)
![](image/Screenshot_25.png)

:::
::: {.column width="40%"}

![](image/Screenshot_26.png)
![](image/Screenshot_27.png)

:::
::::::::::::::

# Результаты

- Создан и настроен репозиторий курса
- Написан отчет на языке разметки Markdown
- Успешно установлены дополнительные пакеты для дальнейшей работы

## Вывод

Вспомнил основы взаимодействия с Git и GitHub, а также Markdown. Создал репозиторий для выполнения лабораторных работ из шаблона. Добавил первые коммиты. Создал данный отчет.