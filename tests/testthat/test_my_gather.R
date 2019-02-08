context("Testing my_gather")


#Test 1

test_that("my_gather works when new column names are specified and specific columns are selected from the dataframe ", {

df1 <- dplyr::data_frame(Groups = c("A","B","C","D"), Married = c(12,25,30,45), Other = c(100,55,60,90))
df2 <- dplyr::data_frame(Groups = c("A","B","C","D", "A","B","C","D"), status=c("Married","Married","Married","Married", "Other","Other","Other","Other"), count = c(12,25,30,45,100,55,60,90))

expect_identical(my_gather(df1,status,count,Married,Other), df2)
})

#Test 2

test_that("my_gather works when new column names are specified but no columns are selected from the dataframe", {

df1 <- dplyr::data_frame(Single = c(12,25,30,45), Married = c(12,25,30,45), Other = c(100,55,60,90))
df2 <-dplyr::data_frame(status=c("Single","Single","Single","Single", "Married","Married","Married","Married", "Other","Other","Other","Other"), count = c(12,25,30,45,12,25,30,45,100,55,60,90))

  expect_identical(my_gather(df1,status,count), df2)
})


#Test 3

test_that("my_gather works with default column names (key,value) when only a dataframe is passed into the function", {

df1 <- dplyr::data_frame(Single = c(12,25,30,45), Married = c(12,25,30,45), Other = c(100,55,60,90))
df2 <-dplyr::data_frame(key=c("Single","Single","Single","Single", "Married","Married","Married","Married", "Other","Other","Other","Other"), value = c(12,25,30,45,12,25,30,45,100,55,60,90))

  expect_identical(my_gather(df1), df2)
})


#Test 4

test_that("my_gather works when a dataframe has missing values ", {

df1 <- dplyr::data_frame(Groups = c("A","B","","D"), Married = c(12,"",30,45), Other = c(100,55,"",90))
df2 <- dplyr::data_frame(Groups = c("A","B","","D", "A","B","","D"), status=c("Married","Married","Married","Married", "Other","Other","Other","Other"), count = c(12,"",30,45,100,55,"",90))

expect_identical(my_gather(df1,status,count,Married,Other), df2)

})


#Test 5
test_that("my_gather prints an error when the first argument is not a dataframe ", {

matrix <- matrix(ncol=3, nrow=2)
expect_error(my_gather(matrixt), "The first argument must be a dataframe or a tibble")

})

