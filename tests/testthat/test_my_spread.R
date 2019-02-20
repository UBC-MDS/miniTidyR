context("Testing my_spread")

#' February 2019
#' This script tests my_spread() function in the miniTidyR package
#'my_spread() transforms a dataframe from long to wide
#'


#Test 0: Test that my_spread returns an error for wrong input types

 test_that("An error is returned when the first argument is not a dataframe", {
  
  matrix <- matrix(ncol=3, nrow=2)
  expect_error(my_spread(matrix, 'matrix[,2]', 'matrix[,3]'), "Input data must be a dataframe")
  print("Success")
})

 test_that("An error is returned when input keycol is not a string", {
  
  df0 <- data.frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(45,80,30,70))
  expect_error(my_spread(df0, list('Name','Key') ,"value" ), "Input keycol must be a string")
  print("Success")
})

 test_that("An error is returned when input valcol is not a string", {
   
   df0 <- data.frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(45,80,30,70))
   expect_error(my_spread(df0, 'key' , list(45,80,30) ), "Input valcol must be a string")
   print("Success")
 })

#Test 1: Test that my_spread returns a warning message 
# and the input dataframe if keycol or valcol is not in the dataframe 
 
   test_that("Input df and a warning msg are returned when keycol is not in df", {
   
    df1 <- data.frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(45,80,30,70))
    expect_warning(my_spread(df1, 'ky' , 'Value'), "A wrong column name was specified, returning input data")
    expect_identical(my_spread(df1, 'ky' , 'Value'), df1)
    print("Yay")
 })
   
  test_that("Input df and a warning msg are returned when valcol is not in df ", {
     
   df1 <- data.frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(45,80,30,70))
   expect_warning(my_spread(df1, 'key' , 'Values' ), "A wrong column name was specified, returning input data")
   expect_equal(my_spread(df1, 'key' , 'Values'), df1)
   print("Yay")
   })
 
 
#Test 2: Test that my_spread returns an error when df does not have unique identifiers

  test_that(" An error is returned when df does not have unique identifiers (1)", {
    
    df2 <- data.frame(key = c("Age","Weight", "Age", "Age","Weight"), value = c(45,80,60,30,70))
    expect_error(my_spread(df2,'key','value'), "Dataframe does not have unique identifiers")
    print("Woop woop !")
  })
  
  test_that("An error is returned when df does not have unique identifiers (2)", {
    
    df3 <- data.frame(Name = c("A","A","A", "B","B"),key = c("Age","Weight", "Age", "Age","Weight"), value = c(45,80,60,30,70))
    expect_error(my_spread(df3,'key','value'), "Dataframe does not have unique identifiers")
    print("Woop woop !")
  })
  
#Test 3: Test that my_spread works when all arguments are correctly specified
  
  test_that("my_spread works when all arguments are correctly specified (1)", {
    
    df4 <- data.frame(Name = c("A","A","B","B"),key = c("Age","Weight", "Age","Weight"), value = c(80,60,30,70))
    output <- data.frame(Name = c("A", "B"), Age = c(80,30), Weight = c(60,70))
    expect_equal(my_spread(df4,'key','value'), output)
    print(" Correct!")
  })
  
  test_that("my_spread works when all arguments are correctly specified (2)", {
    
    df5 <- data.frame(Last = c("lo","li", "hihi","hihi"),  First = c("hi","hey", "ho","ho"), Middle = c("A","A", "B","B"),key = c("Age","Weight", "Age","Weight"), value = c(45,80,30,70))
    output <- data.frame(Last = c("hihi","li", "lo"), First = c("ho","hey", "hi"), Middle = c("B","A","A"), Age = c(30,NA,45), Weight = c(70,80,NA))
    expect_equal(my_spread(df5,'key','value'), output)
    print(" Correct!")
  })
    
  test_that("my_spread works when all arguments are correctly specified (3)", {
      
    df6<- data.frame(Last = c("hi","hey", "ho","hihi"), First = c("A","A", "B","B"),key = c("Age","Weight", "Age","Weight"), value = c(45,80,30,70))
    output <- data.frame(Last = c("hey","hi", "hihi","ho"), First = c("A","A","B","B"), Age = c(NA,45,NA,30), Weight = c(80,NA,70,NA))
    expect_equal(my_spread(df6,'key','value'), output)
    print(" Correct!")
  })
  

#Test 4: Test that my_spread works when the value columns has some missing values

  test_that("my_spread works when the value columns has some missing values", {

   df7 <- data.frame(Name = c("A","A","B","B"), key = c("Age","Weight","Age","Weight"), value = c(NA,80,30,NA))
   output <- data.frame(Name = c("A","B"), Age =c(NA,30), Weight=c(80,NA))
   expect_equal(my_spread(df7,'key','value'), output)
   print("Excellent!")
  })


#Test 5: Testing that my_spread drops rows with missing key values before spreading and prints a warning

  test_that("Test 5", {

 df8 <- data.frame(Name = c("A","A","B","B"), key = c(NA,"Weight","Age","Weight"), value = c(45,80,30,70))
 output <- data.frame(Name = c("A","B"), Weight = c(80,70),Age = c(NA,30))
 expect_warning(my_spread(df8,'key','value'), "Rows with missing key values were dropped")
 expect_equal(my_spread(df8,'key','value'), output)
 print("Excellent!")
  })
  

# Test 6: Testing that final output is a dataframe
  
  test_that("final output is a dataframe", {
  
  df10 <- data.frame(Last = c("lo","li", "hihi","hihi"),  First = c("hi","hey", "ho","ho"), Middle = c("A","A", "B","B"),key = c("Age","Weight", "Age","Weight"), value = c(45,80,30,70))
  output <- data.frame(Last = c("hihi","li", "lo"), First = c("ho","hey", "hi"), Middle = c("B","A","A"), Age = c(30,NA,45), Weight = c(70,80,NA))
  expect_equal(class(output), "data.frame")
  print(" Good job!")
  
  })
