context("Testing my_spread")

#' March 2019
#' This script tests my_spread() function in the miniTidyR package
#'my_spread() transforms a dataframe from long to wide
#'

library(testthat)

#Dataframes

matrix <- matrix(ncol=3, nrow=2)
df1 <- data.frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(45,80,30,70))
df2 <- data.frame(key = c("Age","Weight", "Age", "Age","Weight"), value = c(45,80,60,30,70))
df3 <- data.frame(Name = c("A","A","A", "B","B"),key = c("Age","Weight", "Age", "Age","Weight"), value = c(45,80,60,30,70))
df4 <- data.frame(Last = c("lo","li", "hihi","hihi"),  First = c("hi","hey", "ho","ho"), Middle = c("A","A", "B","B"),key = c("Age","Weight", "Age","Weight"), value = c(45,80,30,70))
df5 <- data.frame(Last = c("hi","hey", "ho","hihi"), First = c("A","A", "B","B"),key = c("Age","Weight", "Age","Weight"), value = c(45,80,30,70))
df6 <- data.frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(NA,80,30,NA))
df7 <- data.frame(Name = c("A","A","B","B"), key = c(NA,"Weight","Age",NA), value = c(45,80,30,70))


#Test 0: Test that my_spread returns an error for wrong input types

test_that("An error is returned when the first argument is not a dataframe", {

  expect_error(my_spread(matrix, 'matrix[,2]', 'matrix[,3]'), "Input data must be a dataframe")

})

test_that("An error is returned when input keycol is not a string", {

  expect_error(my_spread(df1, list('Name','Key') ,"value" ), "Input keycol must be a string")

})

test_that("An error is returned when input valcol is not a string", {

  expect_error(my_spread(df1, 'key' , list(45,80,30) ), "Input valcol must be a string")

 })

#Test 1: Test that my_spread returns a warning message
# and the input dataframe if keycol or valcol is not in the dataframe

test_that("Input df and a warning msg are returned when keycol is not in df", {

  expect_warning(my_spread(df1, 'ky' , 'Value'), "column name does not exist in the data frame, returning input data")
  expect_identical(my_spread(df1, 'ky' , 'Value'), df1)

 })

test_that("Input df and a warning msg are returned when valcol is not in df ", {

  expect_warning(my_spread(df1, 'key' , 'Values' ), "column name does not exist in the data frame, returning input data")
  expect_identical(my_spread(df1, 'key' , 'Values'), df1)

   })


#Test 2: Test that my_spread returns an error when df does not have unique identifiers

test_that(" An error is returned when df does not have unique identifiers (1)", {

  expect_error(my_spread(df2,'key','value'), "Dataframe does not have unique identifiers")

  })

test_that("An error is returned when df does not have unique identifiers (2)", {

  expect_error(my_spread(df3,'key','value'), "Dataframe does not have unique identifiers")

  })

#Test 3: Test that my_spread works when all arguments are correctly specified

test_that("my_spread works when all arguments are correctly specified (1)", {

  output1 <- data.frame(Name = c("A", "B"), Age = c(45,30), Weight = c(80,70))
  expect_identical(my_spread(df1,'key','value'), output1)

  })


test_that("my_spread works when all arguments are correctly specified (2)", {

  output2 <- data.frame(Last = c("hihi","li", "lo"), First = c("ho","hey", "hi"), Middle = c("B","A","A"), Age = c(30,NA,45), Weight = c(70,80,NA))
  expect_identical(my_spread(df4,'key','value'), output2)

  })


test_that("my_spread works when all arguments are correctly specified (3)", {

  output3 <- data.frame(Last = c("hey","hi", "hihi","ho"), First = c("A","A","B","B"), Age = c(NA,45,NA,30), Weight = c(80,NA,70,NA))
  expect_equal(my_spread(df5,'key','value'), output3)

  })


#Test 4: Test that my_spread works when the value columns has some missing values

test_that("my_spread works when the value columns has some missing values", {

  output4 <- data.frame(Name = c("A","B"), Age =c(NA,30), Weight=c(80,NA))
  expect_identical(my_spread(df6,'key','value'), output4)

  })


#Test 5: Testing that my_spread drops rows with missing key values before spreading and prints a warning

test_that("my_spread drops rows with missing key values before spreading and prints a warning", {

 output5 <- data.frame(Name = c("A","B"), Weight = c(80,NA),Age = c(NA,30))
 expect_warning(my_spread(df7,'key','value'), "Rows with missing key values were dropped")
 expect_identical(my_spread(df7,'key','value'), output5)

  })


# Test 6: Testing that final output is a dataframe

test_that("final output is a dataframe", {

  expect_identical(class(my_spread(df1,'key','value')), "data.frame")
  expect_identical(class(my_spread(df4,'key','value')), "data.frame")
  expect_identical(class(my_spread(df5,'key','value')), "data.frame")
  expect_identical(class(my_spread(df6,'key','value')), "data.frame")
  expect_identical(class(my_spread(df7,'key','value')), "data.frame")


  })
