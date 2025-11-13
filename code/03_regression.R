library(here)
here::i_am("code/03_regression.R")

library(dplyr)
library(gtsummary)
library(here)
library(broom)
library(broom.helpers)
library(car)
library(parameters)

data2 <- readRDS(file = here::here("output/data_clean.rds"))

data2 <- data2 %>%
  mutate(Mortality= ifelse(Data_Value > median(Data_Value, na.rm = TRUE), 1, 0))

mod_logit <- glm(
  Mortality ~ Stratification1 + Stratification2,
  data = data2,
  family = binomial
)

reg_table<-tbl_regression(mod_logit, exponentiate = TRUE) %>%
  add_global_p() %>%
  bold_labels()

saveRDS(
  reg_table,
  file = here::here("output/model_table.rds")
)

