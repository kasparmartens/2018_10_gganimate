library(dplyr)
library(gganimate)

N <- 10
theta <- seq(0, 2*pi, length=N)
x <- cos(theta)
y <- sin(theta)
df <- data.frame(x, y, time = 1:N)

# animation 
p <- df %>%
  ggplot(aes(x, y, col = time)) +
  geom_point(size=4) +
  transition_time(time) +
  shadow_wake(1.0, wrap = TRUE)

animate(p, nframes = 50, width=300, height=200)

anim_save("fig/shadow1.gif")
