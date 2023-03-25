risk <- read.csv("/home/tehnokrat/PycharmProjects/BSU/Statistical_Radiophysics/Lab2/data/Risk.csv")
head(risk)

library(RColorBrewer)

palette <- brewer.pal(3, "Set2")

risk$Risk <- factor(risk$Risk)
risk$State <- factor(risk$State)
risk$Gender <- factor(risk$Gender)

plot(
  x = risk[1:7],
  col = palette[as.numeric(risk$Risk)],
  pch = 19)

plot(
  x = risk$Age,
  y = risk$BMI,
  col = palette[as.numeric(risk$Risk)],
  pch = 19)
legend(
  x = "bottomright",
  legend = levels(risk$Risk),
  col = palette,
  pch = 16
)

set.seed(42)
library(caret)
indexes <- createDataPartition(y = risk$Risk, p = 0.8, list = FALSE)
train <- risk[indexes, ]
test <- risk[-indexes, ]



knnModel <- knn3(formula = Risk~Age+BMI+Gender+State.Rate, data = train, k = 5)
knnPredictions <- predict(
  object = knnModel,
  newdata = test,
  type = "class")
table(
  x = knnPredictions,
  y = test$Risk)

knnMatrix <- confusionMatrix(
  data = knnPredictions,
  reference = test$Risk)
print(knnMatrix)

# дерево решений

library(tree)
treeModel <- tree(
  formula = Risk ~ Age + BMI + Gender +
    State.Rate,
  data = train)
summary(treeModel)

plot(treeModel)
text(treeModel)

treePredictions <- predict(
  object = treeModel,
  newdata = test,
  type = "class")
treeMatrix <- confusionMatrix(
  data = treePredictions,
  reference = test$Risk)
print(treeMatrix)

# нейронки
library(nnet)
neuralModel <- nnet(
  formula = Risk ~ Age + BMI + Gender + State.Rate,
  data = train,
  size = 10,
  decay = 0.00001,
  maxit = 500)

library(NeuralNetTools)
plotnet(neuralModel, alpha=0.5)

neuralPredictions <- predict(
  object = neuralModel,
  newdata = test[, 1:7],
  type = "class")
neuralMatrix <- confusionMatrix(
  data = as.factor(neuralPredictions),
  reference = test$Risk)
print(neuralMatrix)

# compare
print(knnMatrix$overall[1])

print(treeMatrix$overall[1])

print(neuralMatrix$overall[1])


