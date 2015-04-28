# functions for SWC at WSU

# convert fahrenheit to celsius
f2c <-
function(fahr) {
 return( (fahr - 32)*5/9 )
}

f2c_alt <-
  function(fahr) {
    (fahr - 32)*5/9
  }

f2c_alt2 <-
  function(fahr)
    (fahr - 32)*5/9

f2c_and_k <- 
  function(fahr) {    
    cel <- (fahr - 32)*5/9
    kel <- cel + 273.15
    c(celsius = cel, kelvin = kel)
  }

c2f <-
  function(cel) {
    cel * 9/5 + 32
  }

# plot gdpPercap vs lifeExp for one year
plot_year <-
  function(year, data=gapminder)
  {    
    the_year <- year
    library(dplyr)
    library(ggplot2)

    data %>% filter(year==the_year) %>%
      ggplot(aes(y=lifeExp, x=gdpPercap, 
                 color=continent)) +
      geom_point() +
      scale_x_log10()
  }