context("Testing my_spread")

#Test 1

test_that("my_spread works when all arguments are speciifed ", {

df1 <- dplyr::data_frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(45,80,30,70))
df2 <- dplyr::data_frame(Name = c("A","B"), Age = c(45,30), Weight = c(80,70))

expect_identical(my_spread(df1,key,value), df2)
})

#Test 2

test_that("my_spread returns an error when only the dataframe is passed ", {

df1 <- dplyr::data_frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(45,80,30,70))
expect_error(my_spread(df1), "key and value columns must be selected")
})

#Test 3

test_that("my_spread returns an error when the dataframe does not have unique identifiers ", {

df1 <- dplyr::data_frame(Name = c("A","A","A", "B","B"), key = c("Age","Weight", "Age", "Age","Weight"), value = c(45,80,60,30,70))
expect_error(my_spread(df1,key,value), "The dataframe does not have unique identifiers")
})

#Test 4

test_that("my_spread works when there are missing values ", {

df1 <- dplyr::data_frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c("",80,30,""))
df2 <- dplyr::data_frame(Name = c("A","B"), Age =c("",30), Weight=c(80,""))

expect_identical(my_spread(df1,key,value), df2)
})


#Test 5

test_that("my_spread works when there are missing keys ", {

df1 <- dplyr::data_frame(Name = c("A","A","B","B"), key = c("","Weight","Age","Weight"), value = c(45,80,30,70))
df2 <- dplyr::data_frame(Name = c("A","B"), new_col= c(45,NA),Age = c(NA,30), Weight = c(80,70))

expect_identical(my_spread(df1,key,value), df2)
})
