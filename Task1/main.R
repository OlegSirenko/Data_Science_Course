logic_var <- TRUE
paste("Логическая переменная: ", logic_var)
int_var <- 2L
paste("Целочисленная переменная: ", int_var)
float_var <- 0.5
paste("Тип флоат", float_var)
str_var <- "Строка";
paste("Stroka: ", str_var)

# Тест функции
my_func <- function(var){
    return(1+var)
}
paste("Результат: ", my_func(10))

# Создание вектора
vector <- c("one", "two", "three")
print("Вектор строк:")
print(vector)
# Создание последовательности от 1 до 20
posled <- 1:20
print("последовательность от 1 до 20")
print(posled)

# Создать вектор случайных значений
print("Случайный вектор: ")
rand_vec <- runif(n= 10, min= -5 , max= 15 )
print(rand_vec)

# Вывести больше 1 но меньше 10
print("В диапозоне от 1 до 10")
print(rand_vec[rand_vec >1 & rand_vec<10])
paste("Максимум: ",max(rand_vec))
paste("Минимум:", min(rand_vec))

# Создание графиика синус x2
sin_func <- function(x){
    return (5*sin(x^2))
}
x <- seq(-10, 10, 0.1)
paste(sin_func(x))
plot(x, sin_func(x), "l", col = "dark red")


# Построить трехмерный график поверхности
xs <- seq(-1, 1, length= 20)
ys <- seq(-1, 1, length= 20)
cone <- function(x, y)
{
sqrt(x^2+y^2)
}
z <- outer(xs, ys, cone)
persp(xs, ys, z, main="Perspective Plot of a Cone", zlab = "Height", theta = 60, phi = 15, col = "springgreen", shade = 0.5, ticktype='detailed', nticks=3)



# Создание матрицы
mat <- matrix(1:100, 10, 10)
print("матрица 10 на 10")
print(mat)
paste("Число столбцов:", ncol(mat))
paste("Число строк:", nrow(mat))
# Создание массива от 1 до 30, разбитых на 3 части
arr <- array(1:30, dim=c(1, 10, 3))  # 1-й аргумент -- кол-во строк, 2-й кол-во столбцов, 3-й кол-во частей
print("Массив из 3-х частей по 10 элементов")
print(arr)

# Списки
sample_list <- list(TRUE, 1, 3.14, "Hello, World!")
print("Список: ")
print(sample_list)

#Фактор
sample_factor <- factor(c("cat", "cat", "dog", "dog", "cow", "cow", "pig", "pig"))
print("Фактор")
print(sample_factor)

# Функция factor() в R используется для преобразования вектора (или столбца в dataframe) символьных переменных в фактор.
# Факторы в R представляют собой вектора, состоящие из уникальных значений, которые могут быть упорядочены или неупорядоченными, необходимые для представления категориальных переменных.
# При преобразовании в фактор, каждое значение вектора заменяется на соответствующий уровень фактора.
# Эти уровни представляют собой уникальные значения вектора, отсортированные в алфавитном порядке по умолчанию или порядке появления в зависимости от того, как установлен аргумент 'ordered'.
# Преобразование символьных переменных в фактор является важным промежуточным этапом в большинстве статистических анализов, особенно при использовании линейных моделей в R.


# Уровни фактора (У меня сразу выводятся)
print(levels(sample_factor))
# Внутрение факторы
print(unclass(sample_factor))

print(table(sample_factor))
print("#######################")


# Фрейм данных
transport_df <- data.frame(Transport = c("Car","Bike","Airplane","Boat", "Rail", "Специальный", "Корабль"),
                           Type = c("sedan", "mountain bike", "jet", "canoe", "Грузовой", "Пожарная машина", "Линкор"),
                           Year = c(2017, 2018, 2015, 2020, 1917, 1990, 1980),
                           High_Speed = c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)

                           )
print(transport_df) # Печать фрейма данных


# Вывод последнего значения из последнего столбца фрейма данных
print("Последнее значение из последнего столбца")
print(transport_df[length(transport_df), length(transport_df)])

# Вывод первой строки фрейма данных
print("Вывод первой строки фрейма данных")
print(transport_df[1, ])
# Вывод последней строки фрейма данных
print("Вывод последней строки фрейма данных")
print(transport_df[nrow(transport_df), ])

print("Обращение по имени столбца")
print(transport_df["Year"])

print("Быстрое обращение по имени столбца")
print(transport_df$Year)


# Вывести подмножество чётных строк фрейма, используя вектор индексов.
print("Четные строки")
even_rows <- seq(2, nrow(transport_df), by = 2)  # Индексы чётных строк
print(transport_df[even_rows, ]) # Вывод подмножества чётных строк фрейма данных
print("Четные столбцы")
even_cols <- seq(2, ncol(transport_df), by = 2)
print(transport_df[,even_cols])

# Вывести подмножество первых 5 строк фрейма, используя последовательность индексов
# df <- data.frame(col1 = c(1, 2, 3, 4, 5, 6),
#                  col2 = c("a", "b", "c", "d", "e", "f"),
#                  col3 = c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE))
# print("Новый датафрейм")
# print(df)
print("Вывод подмножества из первых 4-и строк")
print(transport_df[1:4, ])


# Вывести подмножество строк используя оператор равенства
print("Вывести подмножество строк используя оператор равенства.")
print(transport_df[transport_df$High_Speed == TRUE, ])

# Вывести подмножество строк, используя оператор соответсвия
print("Вывести подмножество строк, используя оператор соответсвия ")
print(transport_df[transport_df$Year %in% c(1990, 1980), ])


