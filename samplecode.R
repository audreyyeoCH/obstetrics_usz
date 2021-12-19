remotes::install_github('haleyjeppson/ggmosaic' )
library(tableone)
library(readxl)
library(tidyverse)
library(dplyr)
library(ggmosaic)
library(janitor)
library(viridis) 
library(kableExtra)
library(RColorBrewer)
## Additional settings
cols <- brewer.pal(3, "Set1")
options(width = 85, digits = 4, show.signif.stars=FALSE)
alpha <- 0.05
qa <- qnorm(1 - alpha / 2)


# Top ten Mosaic plot
#library(ggplot2)
#library(tidyverse)
#library(ggmosaic)
stat10 <- c("P1+2", "I", "E", "P1+2V", "L", "V", "P1+2L", "VL", "EV", "P1+2VL")
tab_code_top10tear_pattern$tear_pattern_ordered <- factor(tab_code_top10tear_pattern$tear_pattern, levels=stat10, ordered=TRUE) 
tab_code_top10tear_pattern %>%  
  ggplot() +
  geom_mosaic(aes(x = product(tear_pattern_ordered, Parity), fill = tear_pattern_ordered)) + 
  theme_minimal() +
  labs(x = "Parity", y = "Tear patterns") +
  ggtitle("") +
  theme(
    legend.position = "none", 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank())  -> mosaic_top10tear_pattern
mosaic_top10tear_pattern

# Subsequent births from Parity 1 to 2
#library(ggplot2)
#library(tidyverse)
#library(ggmosaic)
tab_concodepar12$tear_patternP1 <- factor(tab_concodepar12$tear_patternP1, levels=stat10, ordered=TRUE)
tab_concodepar12$tear_patternP2 <- factor(tab_concodepar12$tear_patternP2, levels=stat10, ordered=TRUE)
tab_concodepar12 %>%
  ggplot() +
  geom_mosaic(aes(x = product(tear_patternP1, tear_patternP2), fill = tear_patternP1)) +
  theme_minimal() +
  labs(x = "Parity 1 ", y = "Parity 2", title = "") +
  theme(
    legend.position = "", 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(angle = 90, size = 8),
    axis.text.y = element_text(size = 8)) -> mosaic_par12_top10tear_pattern
mosaic_par12_top10tear_pattern