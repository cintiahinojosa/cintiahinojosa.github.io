# ANCOVA

library(tidyverse)
library(ggpubr)
library(rstatix)
library(broom)

# Load and prepare the data
study <- study %>%
  select(id, group, t1, t3) %>%
  rename(pretest = t1, posttest = t3)
study[14, "posttest"] <- 19
# Inspect the data by showing one random row by groups
set.seed(123)
study %>% sample_n_by(group, size = 1)

# Pairwise comparisons
library(emmeans)
pwc <- study %>% 
  emmeans_test(
    posttest ~ group, covariate = pretest,
    p.adjust.method = "bonferroni"
  )
pwc

# Display the adjusted means of each group
# Also called as the estimated marginal means (emmeans)
get_emmeans(pwc)


# Visualization: line plots with p-values
pwc <- pwc %>% add_xy_position(x = "group", fun = "mean_se")
ggline(get_emmeans(pwc), x = "group", y = "emmean") +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) + 
  stat_pvalue_manual(pwc, hide.ns = TRUE, tip.length = FALSE) +
  labs(
    subtitle = get_test_label(res.aov, detailed = TRUE),
    caption = get_pwc_label(pwc)
  )


## TWO WAY

s3 %>% sample_n_by(condition.f, political3.f)

# Effect of condition.f at each level of political3.f
s3 %>%
  group_by(political3.f) %>%
  anova_test(punitive.c ~ white + condition.f)

# Pairwise comparisons
pwc <- s3 %>% 
  group_by(political3.f) %>%
  emmeans_test(
    punitive.c ~ condition.f, covariate = white,
    p.adjust.method = "bonferroni"
  )
pwc %>% filter(political3.f == "high")


# Effect of political3.f at each level of condition.f
s3 %>%
  group_by(condition.f) %>%
  anova_test(punitive.c ~ white + political3.f)


pwc2 <- s3 %>% 
  group_by(condition.f) %>%
  emmeans_test(
    punitive.c ~ political3.f, covariate = white,
    p.adjust.method = "bonferroni"
  ) %>%
  select(-df, -statistic, -p) # Remove details
pwc2 %>% filter(condition.f == "yes")


# Line plot
lp <- ggline(
  get_emmeans(pwc), x = "political3.f", y = "emmean", 
  color = "condition.f", palette = "jco"
) +
  geom_errorbar(
    aes(ymin = conf.low, ymax = conf.high, color = condition.f), 
    width = 0.1
  )


# Comparisons between condition.f group at each political3.f level
pwc <- pwc %>% add_xy_position(x = "political3.f", fun = "mean_se", step.increase = 0.2)
pwc.filtered <- pwc %>% filter(political3.f == "high")
lp + 
  stat_pvalue_manual(
    pwc.filtered, hide.ns = TRUE, tip.length = 0,
    bracket.size = 0
  ) +
  labs(
    subtitle = get_test_label(res.aov,  detailed = TRUE),
    caption = get_pwc_label(pwc)
  )

# Comparisons between political3.fs group at each condition.f level
pwc2 <- pwc2 %>% add_xy_position(x = "political3.f", fun = "mean_se")
pwc2.filtered <- pwc2 %>% filter(condition.f == "yes")
lp + 
  stat_pvalue_manual(
    pwc2.filtered, hide.ns = TRUE, tip.length = 0,
    step.group.by = "condition.f", color = "condition.f"
  ) +
  labs(
    subtitle = get_test_label(res.aov,  detailed = TRUE),
    caption = get_pwc_label(pwc2)
  )

