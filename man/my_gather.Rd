% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_gather.R
\name{my_gather}
\alias{my_gather}
\title{Tranform a dataframe from wide to long}
\usage{
my_gather(data, keyname = "key", valuename = "value", chosen_cols)
}
\arguments{
\item{data}{A data frame}

\item{keyname}{Name of new key column, a string}

\item{valuename}{Name of new value column , a string}

\item{chosen_cols}{Name of columns to be gathered, a list}
}
\value{
A data frame
}
\description{
Tranform a dataframe from wide to long
}
\examples{
df <- data.frame(Groups = c("A","B"), Married = c(12,25), Other = c(100,55))
my_gather(df,"status","count", list("Married","Other"))



}
