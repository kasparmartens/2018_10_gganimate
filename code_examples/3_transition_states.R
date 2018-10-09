library(dplyr)
library(gganimate)

N <- 10
theta <- seq(0, 2*pi, length=N)
x <- cos(theta)
y <- sin(theta)
df1 <- data.frame(x, y, time = 1:N, type = "A")
df2 <- data.frame(x = 0, y = 0, time = 1:N, type = "B")
df <- bind_rows(df1, df2) %>%
  mutate(type = factor(type))

# static plot
df %>%
  ggplot(aes(x, y, col = type)) +
  geom_point(size=4)

ggsave("fig/circle2.png", width = 4, height = 3)

# animated plot
p <- df %>%
  ggplot(aes(x, y, group = time, col=type)) +
  geom_point(size=4) +
  transition_states(type, 
                    transition_length = 3, 
                    state_length = 1) +
  labs(title = "prev_state: {previous_state}, closest_state: {closest_state}, transitioning: {transitioning}")

animate(p, nframes = 25, width = 300, height = 250)

anim_save("fig/circle2.gif")
