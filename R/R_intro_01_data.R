## ----, include = FALSE---------------------------------------------------
source("chunk_options.R")

## ----, results = 'hide'--------------------------------------------------
getwd()

## ----, results = 'hide'--------------------------------------------------
list.files()

## ----, eval = FALSE------------------------------------------------------
## setwd("~/Desktop")    ## ~/ is a shortcut for the "home" directory

## ----, echo = FALSE------------------------------------------------------
gapminder <- read.csv("data/gapminder.csv")

## ----, eval = FALSE------------------------------------------------------
## gapminder <- read.csv("gapminder.csv")

## ------------------------------------------------------------------------
head(gapminder)

