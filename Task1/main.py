import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
#
# # 7
# # Создать и вывести последовательность состоящую из 20 чисел.
# s = np.arange(start=0, stop=20)
# print(s)
# # 8
# # Cоздать и вывести матрицу размером 10 x 10 и заполненную последовательностью от 1 до 100.
# mat = np.arange(0, 100)
# mat = mat.reshape((10, 10))
# print(mat)
#
# # 9
# # Создать и вывести массив, заполненный последовательностью от 1 до 30, и разбитую на 3 части по 10 значений
#
# arr = np.arange(1, 31)  # Создаем массив, заполняем его от 1 до 30 с помощью функции arange
# arr = arr.reshape(3, 10)  # Разбиваем массив на 3 равные части
# print(arr)  # Выводим массив на экран

logic_var = True
print("Логическая переменная: ", logic_var)
int_var = 2
print("Целочисленная переменная: ", int_var)
float_var = 0.5
print("Тип флоат: ", float_var)
str_var = "Строка"
print("Stroka: ", str_var)


# Функция
def my_func(var):
    return 1+var


print("Результат: ", my_func(10))


# Вектор
vector = ["one", "two", "three"]
print("Вектор строк: ", vector)

# Последовательность
posled = list(range(1, 21))
print("Последовательность от 1 до 20: ", posled)

# Матрица
import numpy as np
mat = np.reshape(np.arange(0, 100), (10, 10))
print("Матрица 10 на 10: \n", mat)

# Массив
arr = np.reshape(np.arange(1, 31), (1, 10, 3))
print("Массив из 3-х частей по 10 элементов: \n", arr)

# Список
sample_list = [True, 1, 3.14, "Hello, World!"]
print("Список: ", sample_list)

#Фактор
sample_factor = ["cat", "cat", "dog", "dog", "cow", "cow", "pig", "pig"]
print("Фактор: ", sample_factor)

# Уровни фактора
print("Уровни фактора: ", set(sample_factor))

# Внутреннее представление факторы
print("Внутреннее представление факторы: ", pd.Series(sample_factor).astype('category').cat.codes)

# Фрейм данных
# import pandas as pd
transport_df = pd.DataFrame({'Transport': ["Car","Bike","Airplane","Boat"],
                            'Type': ["sedan", "mountain bike", "jet", "canoe"],
                            'Year': [2017, 2018, 2015, 2020],
                            'High_Speed': [True, False, True, False]})

print("Фрейм данных: \n", transport_df)

# Вывод последнего значения из последнего столбца фрейма данных
print("Последнее значение из последнего столбца: ", transport_df.iloc[-1, -1])

# Первая строка фрейма данных
print("Первая строка фрейма данных: \n", transport_df.iloc[0, :])

# Последняя строка фрейма данных
print("Последняя строка фрейма данных: \n", transport_df.iloc[-1, :])

# Печать столбца по имени
print("Обращение по имени столбца: \n", transport_df["Year"])

# Обращение к столбцу через .-оператор
print("Быстрое обращение по имени столбца: \n", transport_df.Year)

# Вывод четных строк фрейма данных
even_rows = transport_df.index % 2 == 0 # Индексы чётных строк
print("Четные строки: \n", transport_df[even_rows])

# Вывести подмножество строк используя оператор равенства
print("Вывести подмножество строк используя оператор равенства: \n", transport_df[transport_df["High_Speed"] == True])

# Вывести подмножество строк, используя оператор соответствия
print("Вывести подмножество строк, используя оператор соответствия: \n", transport_df[transport_df["Type"].isin(["sedan", "jet"])])




