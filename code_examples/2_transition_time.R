library(dplyr)
library(gganimate)

N <- 10
theta <- seq(0, 2*pi, length=N)
x <- cos(theta)
y <- sin(theta)
df <- data.frame(x, y, time = 1:N)

# static plot
df %>%
  ggplot(aes(x, y, col = time)) +
  geom_point(size=4)

ggsave("fig/circle1.png", width = 4, height = 3)

# animation 
p <- df %>%
  ggplot(aes(x, y, col = time)) +
  geom_point(size=4) +
  transition_time(time)

animate(p, nframes = 50, width=300, height=200)

anim_save("fig/circle1.gif")

