However, before carrying this out, I first tested whether the data followed the assumption of linearity and normality of a linear regression. 

```{r, figures-side, fig.show="hold", out.width="50%"}

# Residual plot
model <- lm(culmen_length_mm ~ culmen_depth_mm, data = penguins_clean)
res <- resid(model)
plot(fitted(model), res)
abline(0,0)

# Q-Q plot 
qqnorm(res)
qqline(res)

```


```{r, figures-side, fig.show="hold", out.width="50%", message=FALSE}
# Residuals plot
library(broom)
library(gridExtra)
library(grid)

# ADELIE
adelie_residuals <- augment(adelie_model) # the augment command in the broom package calculates the residuals and predicted values for this model

adelie_residuals_plot <- ggplot(adelie_residuals, aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Residuals Plot for Adelie Penguin Linear Model",
       x = "Predicted Values",
       y = "Residuals") +
  theme_bw()
adelie_residuals_plot

# CHINSTRAP
chinstrap_residuals <- augment(chinstrap_model) 
chinstrap_residuals_plot <- ggplot(chinstrap_residuals, aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Residuals Plot for Chinstrap Penguin Linear Model",
       x = "Predicted Values",
       y = "Residuals") +
  theme_bw()
chinstrap_residuals_plot

# GENTOO
gentoo_residuals <- augment(gentoo_model) 
gentoo_residuals_plot <- ggplot(gentoo_residuals, aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Residuals Plot for Gentoo Penguin Linear Model",
       x = "Predicted Values",
       y = "Residuals") +
  theme_bw()
gentoo_residuals_plot






**Saving the graphs depicting the linear regression and testing the residuals**
  ```{r, warning=FALSE, message=FALSE}
# Saving the linear regression graphs
sf <- 1.2
ggsave("/home/alanazammit/Reproducible_Figures_R/figures/lm_graph.png", plot = lm_graph, width = 6*sf, height = 4*sf, dpi = 1000)
ggsave("/home/alanazammit/Reproducible_Figures_R/figures/lm_combined_graph.png", plot = lm_combined_graph, width = 6*sf, height = 4*sf, dpi = 1000)


# Saving each of the residuals plots 
ggsave("/home/alanazammit/Reproducible_Figures_R/figures/adelie_residuals_plot.png", plot = adelie_residuals_plot, width = 6*sf, height = 4*sf, dpi = 1000)
ggsave("/home/alanazammit/Reproducible_Figures_R/figures/chinstrap_residuals_plot.png", plot = chinstrap_residuals_plot, width = 6*sf, height = 4*sf, dpi = 1000)
ggsave("/home/alanazammit/Reproducible_Figures_R/figures/gentoo_residuals_plot.png", plot = gentoo_residuals_plot, width = 6*sf, height = 4*sf, dpi = 1000)
```
```


subset_data <- penguins[penguins_clean$species == "Adelie", c("culmen_length_mm", "culmen_depth_mm")]
subset_data <- penguins_clean["culmen_length_mm"]


