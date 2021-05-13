##load library
library(ggplot2)
library(dplyr)
library(tidyverse)
##Set work space
basefolder <- 'C:/Rworkspace/'
setwd(paste0(basefolder,file.path('isotope')))

##Input csv
pulp.data <- read.csv('isotope_CN_pulp.csv')
peel.data <- read.csv('isotope_CN_peel.csv')

##plot scatterplots
pulp_production <- pulp.data %>%
  filter(Farm %in% c("EC1", "EC2"))
pulp_con_country <- pulp.data %>%
  filter(Farm %in% c("EC2", "DR2", "CO1", "CR1", "CR2", "CR3", "PA1"))
pulp_org_country <- pulp.data %>%
  filter(Farm %in% c("DR1", "EC1", "PE1"))


peel_production <- peel.data %>%
  filter(Farm %in% c("EC1", "EC2"))
peel_con_country <- peel.data %>%
  filter(Farm %in% c("EC2", "DR2", "CO1", "CR1", "CR2", "CR3", "PA1"))
peel_org_country <- peel.data %>%
  filter(Farm %in% c("DR1", "EC1", "PE1"))


g1 <- ggplot(pulp_production) +
  aes(x = C, y = N, colour = Organic.non) +
  geom_point(size = 3L) +
  scale_color_ipsum() +
  labs(x = "13C/12C", y = "15N/14N", color = "Production") +
  theme_bw()+
  theme(legend.position="bottom")

g2 <- ggplot(pulp_con_country) +
  aes(x = C, y = N, colour = Country) +
  geom_point(size = 3L) +
  scale_color_ipsum() +
  labs(x = "13C/12C", y = "15N/14N", color = "Country") +
  theme_bw()+
  theme(legend.position="bottom")
g3 <- ggplot(pulp_org_country) +
  aes(x = C, y = N, colour = Country) +
  geom_point(size = 3L) +
  scale_color_ipsum() +
  labs(x = "13C/12C", y = "15N/14N", color = "Country") +
  theme_bw()+
  theme(legend.position="bottom")


g4 <- ggplot(peel_production) +
  aes(x = C, y = N, colour = Organic.non) +
  geom_point(size = 3L) +
  scale_color_ipsum() +
  labs(x = "13C/12C", y = "15N/14N", color = "Production") +
  theme_bw()+
  theme(legend.position="bottom")
g5 <- ggplot(peel_con_country) +
  aes(x = C, y = N, colour = Country) +
  geom_point(size = 3L) +
  scale_color_ipsum() +
  labs(x = "13C/12C", y = "15N/14N", color = "Country") +
  theme_bw()+
  theme(legend.position="bottom")
g6 <- ggplot(peel_org_country) +
  aes(x = C, y = N, colour = Country) +
  geom_point(size = 3L) +
  scale_color_ipsum() +
  labs(x = "13C/12C", y = "15N/14N", color = "Country") +
  theme_bw()+
  theme(legend.position="bottom")


##Save plots
ggsave("pulp_production.tiff", plot = g1, dpi=300)
ggsave("pulp_con_country.tiff", plot = g2, dpi=300)
ggsave("pulp_org_country.tiff", plot = g3, dpi=300)
ggsave("peel_production.tiff", plot = g4, dpi=300)
ggsave("peel_con_country.tiff", plot = g5, dpi=300)
ggsave("peel_org_country.tiff", plot = g6, dpi=300)
