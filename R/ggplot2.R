# Intro to ggplot2

# load ggplot2 library
library(ggplot2)

# load gapminder data
gapminder <- read.csv("~/Desktop/gapminder.csv")

# scatterplot of lifeExp vs gdpPercap
ggplot(gapminder, 
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point()

# ggplot2 makes objects that you add together
p <- ggplot(gapminder, 
            aes(x=gdpPercap, y=lifeExp))
p + geom_point()

# make x-axis have log scale
p3 <- p + geom_point() + scale_x_log10()
p3

# another way to get log scale
ggplot(gapminder, 
       aes(x=log10(gdpPercap), y=lifeExp)) +
  geom_point()

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
  scale_x_log10() + geom_point()

# Challenge 1
library(dplyr)
(p_china <- gapminder %>%
  filter(country=="China") %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) +
  geom_point(size = 4) + aes(color=continent)
 
 # color points by continent
 p <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp))
 p2 <- p + geom_point() + scale_x_log10()
 p2 + aes(color=continent)
 
 # or this way
 p <- ggplot(gapminder, 
             aes(x=gdpPercap, y=lifeExp, color=continent))
 p + geom_point() + scale_x_log10()
 
 
 # play with aesthetics
 ggplot(gapminder, 
             aes(x=gdpPercap, y=lifeExp, 
                 shape=pop)) +
  geom_point() + scale_x_log10()
 
 # plot of china but with lines
 gm_china <- gapminder %>%
   filter(country=="China")
 ggplot(gm_china, aes(x=gdpPercap, y=lifeExp)) +
  geom_line(color="violetred") + 
   geom_point(color="lightblue", size=5)
 
 # points underneath lines
 ggplot(gm_china, aes(x=gdpPercap, y=lifeExp)) +
   geom_point(color="lightblue", size=5) +
   geom_line(color="violetred")
 
 # points colored by year
 ggplot(gm_china, 
        aes(x=gdpPercap, y=lifeExp)) +
   geom_line() +
   geom_point(aes(color=year))
   
 gm_chinaindia <- gapminder  %>% 
   filter(country %in% c("China", "India"))
 
 gm_chinaindia_alt <- gapminder  %>% 
   filter(country == "China" | country == "India")
 
 ggplot(gm_chinaindia, 
        aes(x=gdpPercap, y=lifeExp, group=country)) +
   geom_line() +
   geom_point(aes(color=country))
 
 gapminder %>%
   filter(year==2007) %>%
   ggplot(aes(x=lifeExp)) +
   geom_histogram(binwidth=2.5, 
                  fill="lightblue",
                  color="black")

 gapminder %>%
   filter(year==2007) %>%
   ggplot(aes(y=lifeExp, x=continent)) +
   geom_boxplot() + coord_flip()
 
 gapminder %>%
   filter(year==2007) %>%
   ggplot(aes(y=lifeExp, x=continent)) +
   geom_boxplot() +
   geom_point(position=
                position_jitter(width=0.1, height=0))
 
 # Faceting
 ggplot(gapminder, 
        aes(x=gdpPercap, y=lifeExp)) +
   geom_point() + scale_x_log10() +
   facet_grid(continent ~ year)
 
 ggplot(gapminder, 
        aes(x=gdpPercap, y=lifeExp,color=continent)) +
   geom_point() + scale_x_log10() +
   facet_wrap(~year)
 
 gapminder %>%
   filter(country %in% c("United States", "China",
                         "India", "Nigeria")) %>%
   ggplot(aes(x=gdpPercap, y=lifeExp)) +
   geom_line() + facet_wrap(~country)
 
 p <- gapminder %>%
   filter(country %in% c("United States", "China",
                         "India", "Nigeria")) %>%
   ggplot(aes(x=gdpPercap, y=lifeExp)) +
   geom_line() + facet_wrap(~country)
 
 ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
   geom_point() + facet_grid(continent~year)
 
 
 library(gapminder)
 gm2007 <- gapminder %>%
   filter(year==2007) %>% arrange(-pop)
 ggplot(gm2007, aes(y=lifeExp,
                     x=gdpPercap,
                     fill=country,
                     size=sqrt(pop))) +
   geom_point(shape=21) +
   scale_fill_manual(values=country_colors)+
   facet_wrap(~continent)+
   scale_size_continuous(range=c(1,20))+
   guides(fill=FALSE, size=FALSE)
          
        