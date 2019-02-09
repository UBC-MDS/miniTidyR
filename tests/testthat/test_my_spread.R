context("Testing my_spread")

#Test 1: Testing that my_spread works when all arguments are speciifed
#and data does not have any missing values

test_that("Test 1 ", {

df1 <- dplyr::data_frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(45,80,30,70))
df2 <- dplyr::data_frame(Name = c("A","B"), Age = c(45,30), Weight = c(80,70))

expect_identical(my_spread(df1,key,value), df2)
})

#Test 2: Testing that my_spread returns an error when only the dataframe is passed as an argument

test_that("Test 2", {

df1 <- dplyr::data_frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(45,80,30,70))
expect_error(my_spread(df1), "key and value columns must be selected")
})

#Test 3: Testing that my_spread returns an error when the dataframe does not have unique identifiers

test_that("Test 3", {

df1 <- dplyr::data_frame(Name = c("A","A","A", "B","B"), key = c("Age","Weight", "Age", "Age","Weight"), value = c(45,80,60,30,70))
expect_error(my_spread(df1,key,value), "The dataframe does not have unique identifiers")
})

#Test 4: Testing that my_spread works when the value columns has some missing values

test_that("Test 4 ", {

df1 <- dplyr::data_frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c("",80,30,""))
df2 <- dplyr::data_frame(Name = c("A","B"), Age =c("",30), Weight=c(80,""))

expect_identical(my_spread(df1,key,value), df2)
})


#Test 5: Testing that my_spread drops rows with missing key values before spreading and prints a warning.

test_that("Test 5", {

df1 <- dplyr::data_frame(Name = c("A","A","B","B"), key = c("","Weight","Age","Weight"), value = c(45,80,30,70))
df2 <- dplyr::data_frame(Name = c("A","B"), Age = c(NA,30), Weight = c(80,70))

expect_identical(my_spread(df1,key,value), df2)
expect_warning(my_spread(df1,key,value), "Columns with missing key value was dropped")
})
