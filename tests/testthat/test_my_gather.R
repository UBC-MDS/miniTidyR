context("Testing my_gather")

#' February 2019
#' This script tests my_gather() function in the miniTidyR package
#'my_gather() transforms a dataframe from wide to long


#Test 0: Test that my_gather returns an error for wrong input types

df0 <- data.frame(Groups = c("A","B","C","D"), Married = c(12,25,30,45), Other = c(100,55,60,90))

test_that("An error is returned when the first argument is not a dataframe", {
  
  matrix <- matrix(ncol=3, nrow=2)
  expect_error(my_gather(matrix, "key", "value", list('matrix[,2]', 'matrix[,3]')),"Input data must be a dataframe")
  
  print("Success")
})

test_that("An error is returned when input keyname is not a string", {
  
  expect_error(my_gather(df0, df0[2] ,"value", list("Married","Other") ), "Input keyname must be a string")
  
  print("Success")
})

test_that("An error is returned when input valname is not a string", {
  
  expect_error(my_gather(df0, "key" , c(3,4,5), list("Married","Other") ), "Input valuename must be a string")
  
  print("Success")
})

test_that("An error is returned when input chosen_cols is not a list", {
  
  expect_error(my_gather(df0, "key" , "value", c("Other","Married")), "Input chosen_cols must be a list")
  
  print("Success")
})

#Test 1: Test that my_gather returns a warning message and the initial dataframe in the following cases:

test_that("Input df and a warning msg are returned when chosen_cols has wrong column names", {
  
  expect_warning(my_gather(df0, "key" , "value", list("Others","Maried")), "A wrong column name was specified, returning input data")
  expect_identical(my_gather(df0, "key" , "value", list("Others","Maried")), df0)
  
  print("Yay")
})

test_that("Input df and a warning msg are returned when chosen_cols is empty ", {
  
  expect_warning(my_gather(df0, "key" , "value", list()), "No columns selected, returning input data")
  expect_identical(my_gather(df0, "key" , "value", list()), df0)
  
  print("Yay")
})

#Test 2: Testing that my_gather works when all columns are selected to be gathered

df1 <- data.frame(Single = c(12,25,30,45), Married = c(12,25,30,45), Other = c(100,55,60,90))

test_that("my_gather works when all columns are selected to be gathered ", {

 output1 <-data.frame(status=c("Single","Single","Single","Single", "Married","Married","Married","Married", "Other","Other","Other","Other"), count = c(12,25,30,45,12,25,30,45,100,55,60,90))
 expect_identical(my_gather(df1, "status","count",list("Single","Married","Other")), output1)
 
 print("Correct!")
})

#Test 3: Testing that my_gather works when one column is selected

test_that("my_gather works when only one column is selected ", {
  
  output2 <-data.frame(test=c("Single","Single","Single","Single"), value = c(12,25,30,45),Married = c(12,25,30,45), Other = c(100,55,60,90) )
  expect_identical(my_gather(df1, "test","value",list("Single")), output2)
  
  print("Correct!")
})

#Test 4: Testing that my_gather works when only one column is left ungathered

test_that("my_gather works when only one column is not selected", {
  
  output3 <-data.frame(Status=c("Married","Married","Married","Married", "Other","Other","Other","Other"), Count = c(12,25,30,45,100,55,60,90),Groups = c("A","B","C","D","A","B","C","D"))
  expect_identical(my_gather(df0, "Status","Count",list("Married","Other")), output3)
  
  print("Correct!")
})

#Test 5: Testing that my_gather works when a dataframe has some missing values

df2 <- data.frame(Groups = c("A",NA,"C","D"), Married = c(12,25,NA,45), Other = c(NA,55,60,90))

test_that("my_gather works when a dataframe has some missing values", {
  
  output4 <-data.frame(Status=c("Married","Married","Married","Married", "Other","Other","Other","Other"), Count = c(12,25,NA,45,NA,55,60,90),Groups = c("A",NA,"C","D","A",NA,"C","D"))
  expect_identical(my_gather(df2, "Status","Count",list("Married","Other")), output4)
  
  print("Correct!")
})


#Test 6: Testing that my_gather works when a dataframe only has missing values

df3 <- data.frame(Groups = c(NA,NA,NA,NA), Married = c(NA,NA,NA,NA), Other = c(NA,NA,NA,NA))

test_that("my_gather works when a dataframe only has missing values", {
  
  output5 <-data.frame(Status=c("Married","Married","Married","Married", "Other","Other","Other","Other"), Count = c(NA,NA,NA,NA,NA,NA,NA,NA),Groups = c(NA,NA,NA,NA,NA,NA,NA,NA))
  expect_identical(my_gather(df3, "Status","Count",list("Married","Other")), output5)
  
  print("Excellent!")
})


# Test 7: Testing that final output is a dataframe

test_that("final output is a dataframe", {
  
  expect_identical(class(my_gather(df2, "Status","Count",list("Married","Other"))), "data.frame")
  expect_identical(class(my_gather(df3, "Status","Count",list("Married","Other"))), "data.frame")
  expect_identical(class(my_gather(df0, "Status","Count",list("Married","Other"))), "data.frame")
  expect_identical(class(my_gather(df1, "test","value",list("Single"))), "data.frame")
  expect_identical(class(my_gather(df1, "status","count",list("Single","Married","Other"))), "data.frame")
  
  print("Good job!")
  
})

