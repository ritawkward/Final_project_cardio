library(here)
here::i_am("code/02_graphical.R")

data2 <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(ggplot2)

graph <- ggplot(data2, aes(x = Stratification1, y = Data_Value, fill = Stratification1)) +
  stat_summary(fun = "mean", geom = "bar", alpha = 0.7,width=0.5) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  labs(
    title = "Heart Disease Mortality by Sex (2018–2020)",
    x = "Sex",
    y = "Mortality Rate (per 100,000 population)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")


ggsave("output/figure2_plot.png", plot = graph, width = 7, height = 5, dpi = 300)