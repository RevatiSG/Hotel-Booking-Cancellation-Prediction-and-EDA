booking <- read.csv("~/Spring 2024/Courses/BA with R/Project/booking.csv")
View(booking)
str(booking)
summary(booking)
HB<-booking
HB$date.of.reservation <- as.Date(HB$date.of.reservation, format = "%m/%d/%Y")
class(HB$date.of.reservation)
HB$year_of_reservation <- format(HB$date.of.reservation, "%Y")
class(HB$booking.status)
HB$booking.status <- ifelse(HB$booking.status == "Not_Canceled", 0, 1)
View(HB)

B = subset(HB, select = -c(Booking_ID) ) 
set.seed(45)
train = sample(1:nrow(HB), nrow(HB)*(2/3))
HB.train = HB[train,]
HB.test = HB[-train,]
View(HB.train)
View(HB.test)

install.packages('rpart')
library(rpart)
attach(HB)

install.packages('rpart.plot')
library(rpart.plot)
rpart.plot(fit, type = 1, extra = 1) 
fit = rpart(booking.status~ number.of.adults+number.of.children+number.of.week.nights+number.of.weekend.nights+type.of.meal+car.parking.space+room.type+lead.time+market.segment.type+repeated+P.C+average.price+special.requests+year_of_reservation,data = HB.train, method = "class", control = rpart.control(xval=0, minsplit=100), parms=list(split="gini"))
fit

rpart.plot(fit, type = 1, extra = 1) 
HB.predict <- predict(fit, HB.train, type="class")
HB.actual<-HB.train$booking.status
confusion.matrix<-table(HB.predict,HB.actual)
confusion.matrix

HB.predictTest <- predict(fit, HB.test, type="class")
HB.actualTest<-HB.test$booking.status
confusion.matrixTest<-table(HB.predictTest,HB.actualTest)
confusion.matrixTest

pTrain <- prop.table(confusion.matrix)
pTest <- prop.table(confusion.matrixTest)
accuracyTrain = pTrain[1,1] + pTrain[2,2]
accuracyTrain
accuracyTest = pTest[1,1] + pTest[2,2]
accuracyTest

error_rate_Train = 1 - accuracyTrain
error_rate_Train

error_rate_Test = 1 - accuracyTest
error_rate_Test

tp_train <- confusion.matrix[2,2]
tn_train <- confusion.matrix[1,1]
fp_train <- confusion.matrix[2,1]
fn_train <- confusion.matrix[1,2]
 
TPR_train <- 100*(tp_train/(fn_train+tp_train))
TNR_train <- 100*(tn_train/(fp_train+tn_train))
FPR_train <- 100*(fp_train/(fp_train+tn_train))
FNR_train <- 100*(fn_train/(fn_train+tp_train))
TPR_train
TNR_train
FPR_train
FNR_train

tp_test <- confusion.matrixTest[2,2]
tn_test <- confusion.matrixTest[1,1]
fp_test <- confusion.matrixTest[2,1]
fn_test <- confusion.matrixTest[1,2]
TPR_test <- 100*(tp_test/(fn_test+tp_test))
TNR_test <- 100*(tn_test/(fp_test+tn_test))
FPR_test <- 100*(fp_test/(fp_test+tn_test))
FNR_test <- 100*(fn_test/(fn_test+tp_test))
TPR_test
TNR_test
FPR_test
FNR_test









