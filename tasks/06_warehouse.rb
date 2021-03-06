#coding: utf-8
# У компании имеется следующий склад (см. рис), 
# три ряда стеллажей, стоящие в ряд по 700 ед. 
# Каждый стеллаж содержит 5 полок. Каждая полка содержит 6 ячеек. 
# Между рядами стеллажей есть проходы. Между стеллажами в одном ряду проходов нет.
# Ширина полок одинакова и равна ширине прохода. 
# Зеленым цветом обозначены проходы.
# Кладовщику выдается случайный перечень ячеек, из которых требуется взять товар.
# Помогите составить маршрут передвижения кладовщика по складу, начиная движение
# от стола, таким образом, чтобы он затратил минимально возможный путь.  
# 1. Достаточно описать шаги алгоритма решения задачи.
# 2. Объясните почему решение оптимальное.

1. описываем склад, как массив хешей 
  y-перемещение вдоль стелажей, равно 10 за шаг  [10,20,30,40,50,60]
  x-перемещение поперёк стелажей
      , равно 5  за шаг [5,10,15],  когда y = 10 | 60
      , равно 10 за шаг [10,20,30], когда y = 20 | 50
      , равно 15 за шаг [15,30,45], когда y = 30 | 40
  z-перемещение снизу-вверх, равно 2 за шаг      [2,4,6,8,10]

2. стол в начале движения, {y: 0, x: 0, z: 0}
  стол перемещается во время поиска, цена поиска = сумме векторов

3. Начальное расположение искомых ячеек, задаётся от расположения стола, например: 
3.1 расположение первой искомой ячейки    {y: 40, x: 30, z: 6},   цена = 76
3.2 расположение второй искомой ячейки    {y: 20, x: 10, z: 4},   цена = 34
3.3 расположение третьей искомой ячейки   {y: 50, x: 30, z: 10},  цена = 90
3.4 расположение четвёртой искомой ячейки {y: 10, x: 5, z: 4},    цена = 19

4. Формируется массив цены. в данном примере = [76, 34, 90, 19]
4.1 массив цен сортируется в нисходящем порядке [90,76,34,19 ]
4.2 осушествляется комплектация по порядку в отсортированном массиве

Сортировка позволяет обрабатывать ячейки последовательно, начиная с самых удалёных,
тележка заполняется по мере возвращения к столу.

Примечание, в алгоритме желательно использовать коофициенты, для более точного вычисления цены прохода.
