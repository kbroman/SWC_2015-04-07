## ----, include = FALSE---------------------------------------------------
source("chunk_options.R")
gapminder <- read.csv("data/gapminder.csv")

## ------------------------------------------------------------------------
gapminder[1, 1] ## First row, first column.
gapminder[1, 3] ## First row, third column
gapminder[500, 5:6] ## 500th row, 5th and 6th columns

## ------------------------------------------------------------------------
### Countries and years when populations were less than or equal to 100000
gapminder[gapminder$pop <= 100000, c("country", "year")]

### All data for Finland
gapminder[gapminder$country == "Finland", ]

## ----, eval = FALSE------------------------------------------------------
## install.packages("dplyr") ## install

## ----, message = FALSE---------------------------------------------------
library("dplyr")          ## load

## ----, results = 'hide'--------------------------------------------------
## Keep columns "country", "year", and "pop"
select(gapminder, country, year, pop)

## ------------------------------------------------------------------------
## All data for Finland
filter(gapminder, country == "Finland")

## ------------------------------------------------------------------------
### Countries and years when populations were less than or equal to 10000
gapminder %>%
  filter(pop <= 100000) %>%
  select(country, year)

## ------------------------------------------------------------------------
gapminder_sml <- gapminder %>%
  filter(pop <= 100000) %>%
  select(country, year)

gapminder_sml

## ----, results = 'hide'--------------------------------------------------
mutate(gapminder, totalgdp = gdpPercap * pop)

## ------------------------------------------------------------------------
mutate(gapminder, totalgdp = gdpPercap * pop) %>%
  head

## ------------------------------------------------------------------------
gapminder %>%
  mutate(totalgdp = gdpPercap * pop) %>%
  group_by(continent) %>%
  summarize(meangdp = mean(totalgdp))

## ------------------------------------------------------------------------
gapminder %>%
  mutate(totalgdp = gdpPercap * pop) %>%
  group_by(continent, year) %>%
  summarize(meangdp = mean(totalgdp))

## ------------------------------------------------------------------------
gapminder %>%
  mutate(totalgdp = gdpPercap * pop) %>%
  group_by(continent, year) %>%
  summarize(meangdp = mean(totalgdp),
            mingdp = min(totalgdp))

