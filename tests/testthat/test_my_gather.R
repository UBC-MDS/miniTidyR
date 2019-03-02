context("Testing my_gather")

#' February 2019
#' This script tests my_gather() function in the miniTidyR package
#'my_gather() transforms a dataframe from wide to long



#Test 1: Testing that my_gather works when all arguments are specified
#and data does not have any missing values

test_that("Test 1 ", {

df1 <- dplyr::data_frame(Groups = c("A","B","C","D"), Married = c(12,25,30,45), Other = c(100,55,60,90))
df2 <- dplyr::data_frame(Groups = c("A","B","C","D", "A","B","C","D"), status=c("Married","Married","Married","Married", "Other","Other","Other","Other"), count = c(12,25,30,45,100,55,60,90))

expect_identical(my_gather(df1,status,count,Married,Other), df2)
})

#Test 2: Testing that my_gather works when columns to be gathered are not specified as argument

test_that("Test 2", {

df1 <- dplyr::data_frame(Single = c(12,25,30,45), Married = c(12,25,30,45), Other = c(100,55,60,90))
df2 <-dplyr::data_frame(status=c("Single","Single","Single","Single", "Married","Married","Married","Married", "Other","Other","Other","Other"), count = c(12,25,30,45,12,25,30,45,100,55,60,90))

expect_identical(my_gather(df1,status,count), df2)
})


#Test 3 : Testing that my gather works when only the dataframe is specified as argument

test_that("Test3", {

df1 <- dplyr::data_frame(Single = c(12,25,30,45), Married = c(12,25,30,45), Other = c(100,55,60,90))
df2 <-dplyr::data_frame(key=c("Single","Single","Single","Single", "Married","Married","Married","Married", "Other","Other","Other","Other"), value = c(12,25,30,45,12,25,30,45,100,55,60,90))

expect_identical(my_gather(df1), df2)
})


#Test 4 : Testing that my_gather works when a dataframe has missing values

test_that("Test 4 ", {

df1 <- dplyr::data_frame(Groups = c("A","B","","D"), Married = c(12,"",30,45), Other = c(100,55,"",90))
df2 <- dplyr::data_frame(Groups = c("A","B","","D", "A","B","","D"), status=c("Married","Married","Married","Married", "Other","Other","Other","Other"), count = c(12,"",30,45,100,55,"",90))

expect_identical(my_gather(df1,status,count,Married,Other), df2)

})


#Test 5 : Testing that my_gather prints an error when the first argument is not a dataframe

test_that("Test 5", {

matrix <- matrix(ncol=3, nrow=2)
expect_error(my_gather(matrix), "The first argument must be a dataframe")

})

