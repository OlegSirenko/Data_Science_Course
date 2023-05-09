#Загрузить файл с данными Customers.csv;
customer <- read.csv("/home/tehnokrat/PycharmProjects/BSU/Statistical_Radiophysics/Lab3/Customers.csv",sep=";")

#Просмотреть структуру данных с помощью функций head();
head(customer)

#Загрузить бибилиотеку dplyr
library(dplyr)

#Преобразовать категориальный признак в фактор;
customer$gender <- factor(customer$gender)

#Удалить столбец customer_id из исходного дата фрейма и преобразовать столбец
#Gender в числовые значения. 
customer <- customer %>% mutate(gender = as.numeric(gender)) %>% select(-customer_id)

#Просмотреть структуру данных после преобразования.
head(customer)

#Методом локтя определить оптимальное количество кластеров;
tot.withinss <- vector(mode="character", length=10)
for (i in 1:10){
  customerCluster <- kmeans(customer[,2:3], center=i, nstart=20)
  tot.withinss[i] <- customerCluster$tot.withinss
}
plot(1:10, tot.withinss, type="b", pch=19)

#Для функции set.seed() установить аргумент, равный 42
set.seed(42)

#Провести кластеризацию методом k-средних;
customerCluster <- kmeans(customer[,2:3], center=4, nstart=20)
customerCluster
table(customerCluster$cluster, customer$gender)

#Построить диаграмму рассеяния spending_score от age. В качестве параметров col и
#pch передать dfCluster$cluster;
library(RColorBrewer)
palette <- brewer.pal(3, "Set2")
#symbols <- c(15, 16, 17, 18) # вектор с символами для каждого кластера
colors_pl <- c("red", "green", "blue", "yellow") # вектор с цветами для каждого кластера
plot(
  x = customer$age,
  y = customer$spending_score,
  col = colors_pl[customerCluster$cluster], # использовать цвета из вектора colors
  pch = 16
)
legend(
  x = "bottomright",
  legend = levels(factor(customerCluster$cluster)),
  col = colors_pl, # использовать цвета из вектора colors
  pch = 16
)

#Отобразить центры полученных кластеров;
points(x = customerCluster$centers[, "age"],
       y = customerCluster$centers[, "spending_score"],
       pch = 4,
       lwd = 4,
       col = "blue")

#Вычислить матрицу расстояний и провести иерархическую кластеризацию;
D <- dist(customer[ ,2:3])
hclusters <- hclust(D, method = "average")

#Визуализировать дендрограмму и отобразить найденные кластеры.
palette <- brewer.pal(3, "Set2")
plot(x = hclusters, labels = as.numeric(customer$gender))
palette <- brewer.pal(3, "Set2")
#rect.hclust(hclusters, h =16,border = 1:10)
rect.hclust(hclusters, k=4, border = 1:4) 
#кластеров

#Представить кластеры как вектор;
cuts <- cutree(tree = hclusters, k = 4)

#Создать диаграмму рассеивание spending_score от age, окрашенную в цвет
#кластеров из пункта 12. В качестве параметров col и pch передать величину,
#реализованную в пункте 14.
palette <- brewer.pal(3, "Set2")
#symbols <- c(15, 16, 17, 18) # вектор с символами для каждого кластера
#colors <- c("red", "green", "blue", "yellow") # вектор с цветами для каждого кластера
plot(x = customer$age,
     y = customer$spending_score,
     col = colors_pl[customerCluster$cluster],
     pch = 16)






