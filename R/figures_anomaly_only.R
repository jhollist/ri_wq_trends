#' script to generate figures
#' load up functions and packages
source(here::here("R/functions.R"))

ww_data <- read_csv(here("data/ww_lake_trend_data.csv")) %>%
  mutate(trophic_state = factor(trophic_state, 
                                levels = c("oligotrophic", "mesotrophic", 
                                           "eutrophic", "hypereutrophic", 
                                           ordered = TRUE)))

chla_gg <- ww_data %>%
  #filter(state == "RI") %>%
  wq_trend_gg( "chla", yvar = "measurement_anmly_mdn", 
               y = expression(paste("Median Yearly Chlorophyll ", 
                                    italic(" a"), " Anomaly (", mu, "g/L)")), 
               x = "Year",
               write = here("data/chla_data_anomaly.csv"), error_bar = "iqr",
               title = "A. URI Watershed Watch Chlorophyll")
ggsave(here("manuscript/ecosphere_production/figures/ww_chla_trends_anomaly.tiff"), chla_gg[[1]], width = 15.6, 
       height = 11.7, units = "cm", dpi = 300, compress = "lzw")

ww_chla_kt <- chla_gg[[2]]
ww_chla_df <- chla_gg[[3]]
ww_chla_rl <- chla_gg[[4]]

tn_gg <-  ww_data %>%
  #filter(state == "RI") %>%
  wq_trend_gg("total_n", yvar = "measurement_anmly_mdn", 
              y = expression(paste("Median Yearly Total Nitrogen Anomaly (", mu, "g/L)")), 
              x = "Year",
              write = here("data/total_n_data_anomaly.csv"), error_bar = "iqr",
              title = "A. URI Watershed Watch Total Nitrogen")
ggsave(here("manuscript/ecosphere_production/figures/ww_tn_trends_anomaly.tiff"), tn_gg[[1]], width = 15.6, 
       height = 11.7, units = "cm", dpi = 300, compress = "lzw")

ww_tn_kt <- tn_gg[[2]]
ww_tn_df <- tn_gg[[3]]
ww_tn_rl <- tn_gg[[4]]

tp_gg <-  ww_data %>%
  #filter(state == "RI") %>%
  wq_trend_gg("total_p", yvar = "measurement_anmly_mdn", 
              y = expression(paste("Median Yearly Total Phosphorus Anomaly (", mu, "g/L)")), 
              x = "Year",
              write = here("data/total_p_data_anomaly.csv"), error_bar = "iqr",
              title = "A. URI Watershed Watch Total Phosphorus")
ggsave(here("manuscript/ecosphere_production/figures/ww_tp_trends_anomaly.tiff"), tp_gg[[1]], width = 15.6, 
       height = 11.7, units = "cm", dpi = 300, compress = "lzw")

ww_tp_kt <- tp_gg[[2]]
ww_tp_df <- tp_gg[[3]]
ww_tp_rl <- tp_gg[[4]]

temp_gg <- ww_data %>%
  #filter(state == "RI") %>%
  wq_trend_gg("temp", yvar = "measurement_anmly_mdn", 
              y = "Median Yearly Temperature Anomaly (°C)", x = "Year",
              write = here("data/temp_data_anomaly.csv"), error_bar = "iqr",
              title = "URI Watershed Watch Temperature")
ggsave(here("manuscript/ecosphere_production/figures/ww_temp_trends_anomaly.tiff"), temp_gg[[1]], width = 15.6*1.34, 
       height = 11.7*1.34, units = "cm", dpi = 300, compress = "lzw")
img <- image_read(here("manuscript/ecosphere_production/figures/ww_temp_trends_anomaly.tiff"))
image_write(image_resize(img, "1842.52x1381.89"),here("manuscript/ecosphere_production/figures/figure_4_ww_temp_trends_anomaly.tiff"), compression = "lzw")

ww_temp_kt <- temp_gg[[2]]
ww_temp_df <- temp_gg[[3]]
ww_temp_rl <- temp_gg[[4]]

np_gg <- ww_data %>%
  #filter(state == "RI") %>%
  wq_trend_gg("np_ratio", yvar = "measurement_anmly_mdn", 
              y = "Median Yearly N:P Anomaly", x = "Year",
              write = here("data/np_data_anomaly.csv"), error_bar = "iqr",
              title = "A. URI Watershed Watch Nitrogen:Phosphorus")
ggsave(here("manuscript/ecosphere_production/figures/ww_np_trends_anomaly.tiff"), np_gg[[1]], width = 15.6, 
       height = 11.7, units = "cm", dpi = 300, compress = "lzw")

ww_np_kt <- np_gg[[2]]
ww_np_df <- np_gg[[3]]
ww_np_rl <- np_gg[[4]]

lagos_data <- read_csv(here("data/lagos_lake_trend_data.csv")) %>%
  mutate(trophic_state = factor(trophic_state, 
                                levels = c("oligotrophic", "mesotrophic", 
                                           "eutrophic", "hypereutrophic", 
                                           ordered = TRUE)))

lagos_chla_gg <- wq_trend_gg(lagos_data, "chla", yvar = "measurement_anmly_mdn", 
                             y = expression(paste("Median Yearly Chlorophyll  ", 
                                              italic(" a"), " Anomaly (", mu, "g/L)")), 
                             x = "Year",
                             write = here("data/chla_data_lagos_anomaly.csv"), 
                             error_bar = "iqr",
                             title = "B. LAGOS-NE Chlorophyll")
ggsave(here("manuscript/ecosphere_production/figures/lagos_chla_trends_anomaly.tiff"), lagos_chla_gg[[1]], 
       width = 15.6, 
       height = 11.7, units = "cm", dpi = 300, compress = "lzw")
lagos_chla_kt <- lagos_chla_gg[[2]]
lagos_chla_df <- lagos_chla_gg[[3]]
lagos_chla_rl <- lagos_chla_gg[[4]]

lagos_tn_gg <- wq_trend_gg(lagos_data, "total_n", yvar = "measurement_anmly_mdn", 
                           y = expression(paste("Median Yearly Nitrogen Anomaly (", mu, "g/L)")), 
                           x = "Year",
                           write = here("data/total_n_data_lagos_anomaly.csv"), 
                           error_bar = "iqr",
                           title = "B. LAGOS-NE Total Nitrogen")
ggsave(here("manuscript/ecosphere_production/figures/lagos_tn_trends_anomaly.tiff"), lagos_tn_gg[[1]], width = 15.6, 
       height = 11.7, units = "cm", dpi = 300, compress = "lzw")
lagos_tn_kt <- lagos_tn_gg[[2]]
lagos_tn_df <- lagos_tn_gg[[3]]
lagos_tn_rl <- lagos_tn_gg[[4]]


lagos_tp_gg <- wq_trend_gg(lagos_data, "total_p", yvar = "measurement_anmly_mdn", 
                           y = expression(paste("Median Yearly Total Phosphorus Anomaly (", mu, "g/L)")), 
                           x = "Year",
                           write = here("data/total_p_data_lagos_anomaly.csv"), 
                           error_bar = "iqr",
                           title = "B. LAGOS-NE Total Phosphorus")
ggsave(here("manuscript/ecosphere_production/figures/lagos_tp_trends_anomaly.tiff"), lagos_tp_gg[[1]], width = 15.6, 
       height = 11.7, units = "cm", dpi = 300, compress = "lzw")

lagos_tp_kt <- lagos_tp_gg[[2]]
lagos_tp_df <- lagos_tp_gg[[3]]
lagos_tp_rl <- lagos_tp_gg[[4]]

lagos_np_gg <- wq_trend_gg(lagos_data, "np_ratio", yvar = "measurement_anmly_mdn", 
              y = "Median Yearly N:P Anomaly", x = "Year",
              write = here("data/np_data_lagos_anomaly.csv"), error_bar = "iqr",
              title = "B. LAGOS-NE Nitrogen:Phosphorus")
ggsave(here("manuscript/ecosphere_production/figures/lagos_np_trends_anomaly.tiff"), lagos_np_gg[[1]], width = 15.6, 
       height = 11.7, units = "cm", dpi = 300, compress = "lzw")

lagos_np_kt <- lagos_np_gg[[2]]
lagos_np_df <- lagos_np_gg[[3]]
lagos_np_rl <- lagos_np_gg[[4]]

# Build Paired Plots
chla_plot <- cowplot::plot_grid(chla_gg[[1]], lagos_chla_gg[[1]], 
                                align = "h", ncol = 1) 

ggsave(here("manuscript/ecosphere_production/figures/paired_chla_trends_anomaly.tiff"), chla_plot, width = 15.45*1.34, 
       height = 20*1.34, units = "cm", dpi = 300, compress = "lzw")
img <- image_read(here("manuscript/ecosphere_production/figures/paired_chla_trends_anomaly.tiff"))
image_write(image_resize(img, "1824.803x2362.205"),here("manuscript/ecosphere_production/figures/figure_5_paired_chla_trends_anomaly.tiff"), compression = "lzw")

tn_plot <- cowplot::plot_grid(tn_gg[[1]], lagos_tn_gg[[1]], 
                              align = "h", ncol = 1)

ggsave(here("manuscript/ecosphere_production/figures/paired_tn_trends_anomaly.tiff"), tn_plot, width = 15.45*1.34, 
       height = 20*1.34, units = "cm", dpi = 300, compress = "lzw")
img <- image_read(here("manuscript/ecosphere_production/figures/paired_tn_trends_anomaly.tiff"))
image_write(image_resize(img, "1824.803x2362.205"),here("manuscript/ecosphere_production/figures/figure_6_paired_tn_trends_anomaly.tiff"), compression = "lzw")

tp_plot <- cowplot::plot_grid(tp_gg[[1]], lagos_tp_gg[[1]], 
                              align = "h", ncol = 1) 

ggsave(here("manuscript/ecosphere_production/figures/paired_tp_trends_anomaly.tiff"), tp_plot, width = 15.45*1.34, 
       height = 20*1.34, units = "cm", dpi = 300, compress = "lzw")

img <- image_read(here("manuscript/ecosphere_production/figures/paired_tp_trends_anomaly.tiff"))
image_write(image_resize(img, "1824.803x2362.205"),here("manuscript/ecosphere_production/figures/figure_7_paired_tp_trends_anomaly.tiff"), compression = "lzw")


np_plot <- cowplot::plot_grid(np_gg[[1]], lagos_np_gg[[1]], 
                              align = "h", ncol = 1) 

ggsave(here("manuscript/ecosphere_production/figures/paired_np_trends_anomaly.tiff"), np_plot, width = 15.45*1.34, 
       height = 20*1.34, units = "cm", dpi = 300, compress = "lzw")

img <- image_read(here("manuscript/ecosphere_production/figures/paired_np_trends_anomaly.tiff"))
image_write(image_resize(img, "1824.803x2362.205"),here("manuscript/ecosphere_production/figures/figure_8_paired_np_trends_anomaly.tiff"), compression = "lzw")

avail_data <- read_csv(here("data/ww_avail_data_stations.csv"))
ri <- us_states(resolution = "high", states = "Rhode Island")
ww_pts <- ww_data %>%
  #filter(state == "RI") %>%
  filter(!is.na(lon_dd)) %>%
  select(station_name, lat_dd, lon_dd) %>%
  unique() %>%
  st_as_sf(coords = c("lon_dd", "lat_dd"),
           crs = st_crs(ri), agr = "constant") %>%
  left_join(avail_data) %>%
  #yanks out all sites with less than 10 years data.
  filter(!is.na(params_avail)) %>%
  mutate(what_params = case_when(params_avail != "chla, total_p, total_n, np, temp" ~
                                   "Subset of parameters",
                                 TRUE ~ "All Parameters"))


ww_map <- ggplot(st_geometry(ri)) +
  geom_sf(size = 0.75, fill = "grey95", show.legend = FALSE) +
  geom_sf(data = ww_pts, aes(color = what_params, shape = what_params), size = 3.5, show.legend = "point") +
  scale_color_manual(values = c("grey40","grey60")) +
  scale_shape_manual(values = c(16,17)) +
  scale_x_continuous(breaks = seq(-72.0, -71.0, by  = 0.2)) +
  scale_y_continuous(breaks = seq(41.0, 42.0, by = 0.2)) +
  theme_ipsum_rc() +
  theme(legend.position = "bottom", legend.title = element_blank()) +
  theme(plot.margin=grid::unit(c(0,0,0,0), "mm"))
ww_map %>%  
  ggsave(here("manuscript/ecosphere_production/figures/ww_map.tiff"), ., width = 15.45*1.34, 
         height = 20*1.34, units = "cm", dpi = 300, compress = "lzw")
img <- image_read(here("manuscript/ecosphere_production/figures/ww_map.tiff"))
image_write(image_resize(img, "1824.803x2362.205"),here("manuscript/ecosphere_production/figures/figure_1_ww_map.tiff"), compression = "lzw")

# Create supplemental dataset with data for all figures:
figure_data <- chla_gg[[3]] %>%
  mutate(source = "uriww", variable = "chla") %>%
  rbind(mutate(temp_gg[[3]], source = "uriww", variable = "temp")) %>%
  rbind(mutate(tn_gg[[3]], source = "uriww", variable = "total_n")) %>%
  rbind(mutate(tp_gg[[3]], source = "uriww", variable = "total_p")) %>%
  rbind(mutate(np_gg[[3]], source = "uriww", variable = "np_ratio")) %>%
  rbind(mutate(lagos_chla_gg[[3]], source = "lagosne", variable = "chla")) %>%
  rbind(mutate(lagos_tn_gg[[3]], source = "lagosne", variable = "total_n")) %>%
  rbind(mutate(lagos_tp_gg[[3]], source = "lagosne", variable = "total_p")) %>%
  rbind(mutate(lagos_np_gg[[3]], source = "lagosne", variable = "np_ratio"))

write_csv(figure_data, here("data/yearly_average_anomaly.csv"))

# Create simulated data and analysis for figure in discussion.
set.seed(0)
options(scipen=10000)

site1 <- tibble(site=rep("Lake 1",24),
                year = 1993:2016,
                rep_1 = rnorm(24,10,2.5),
                rep_2 = rep_1*rnorm(24, 1, 0.05),
                rep_3 = rep_1*rnorm(24, 1, 0.05)) %>%
  pivot_longer(rep_1:rep_3, names_to = "replicate", values_to = "values") %>%
  mutate(replicate = str_extract(replicate, "[0-9]"))

site2 <- tibble(site=rep("Lake 2",12),
                year = 1993:2004,
                rep_1 = rnorm(12,3,1),
                rep_2 = rep_1 * rnorm(12, 1, 0.05),
                rep_3 = rep_1 * rnorm(12, 1, 0.05)) %>%
  pivot_longer(rep_1:rep_3, names_to = "replicate", values_to = "values") %>%
  mutate(replicate = str_extract(replicate, "[0-9]"))

site3 <- tibble(site=rep("Lake 3",13),
                year = 2004:2016,
                rep_1 = rnorm(13, 17, 1),
                rep_2 = rep_1*rnorm(13, 1, 0.05),
                rep_3 = rep_1*rnorm(13, 1, 0.05)) %>%
  pivot_longer(rep_1:rep_3, names_to = "replicate", values_to = "values") %>%
  mutate(replicate = str_extract(replicate, "[0-9]"))                

examp <- rbind(site1, site2, site3) %>%
  mutate(year = year(ymd(paste0(year,"01-01"))))

site_gg <- examp %>%
  ggplot(aes(x = year, y = values)) +
  geom_point() + 
  facet_grid(. ~ site) +
  theme_ipsum_rc()  +
  scale_x_continuous(labels = c(1995,2005,2015),
                     breaks = c(1995,2005,2015)) +
  labs(x = "Year", y = "Simulated Measurements", title = "A. Simulated Lakes") + 
  theme(legend.position="none", 
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(size=14, face="plain"),
        axis.title.x = element_text(size=14, face="plain",
                                    margin = margin(t = 10, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size=14, face="plain",
                                    margin = margin(t = 0, r = 10, b = 0, l = 0)),
        axis.text.x = element_text(size=14, face="plain"),
        axis.text.y = element_text(size=14, face="plain"),
        plot.margin = margin(t = 10, r = 0, b = 10, l = 0))
site_gg %>%  
  ggsave(here("manuscript/ecosphere_production/figures/simulated_data.tiff"), ., width = 15.6, 
         height = 11.7, units = "cm", dpi = 300, compress = "lzw")


examp_site_summ <- examp %>% 
  group_by(site) %>%
  mutate(lt_median = median(values)) %>%
  ungroup() %>%
  group_by(site, year) %>%
  summarize(measured_value = median(values),
            anomaly = median(values-lt_median)) %>%
  ungroup() %>%
  pivot_longer(measured_value:anomaly, "Method")

examp_yr_summ <- examp_site_summ %>%
  group_by(year, Method) %>%
  summarize(values = median(value)) %>%
  ungroup() 

meas_lm <- lm(values ~ year, 
              data = examp_yr_summ[examp_yr_summ$Method == "measured_value",]) %>% 
  tidy() %>%
  slice(2) %>%
  select(slope = estimate, p.value)
anom_lm <- lm(values ~ year, 
              data = examp_yr_summ[examp_yr_summ$Method == "anomaly",]) %>% 
  tidy() %>%
  slice(2) %>%
  select(slope = estimate, p.value)


simulated_trends_gg <- ggplot(examp_yr_summ, 
                              aes(x = year, y = values, color = Method)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = c("darkblue", "darkred"), 
                     labels = c("Anomaly", "Measured Values")) +
  labs(y = "Yearly Median Value", x = "Year", 
       subtitle = paste0("Measured Values: slope = ", signif(meas_lm$slope, 2), 
                         ", p-value = ", signif(meas_lm$p.value, 2), 
                         "\nAnomaly: slope = ", signif(anom_lm$slope, 2), 
                         ", p-value = ", signif(anom_lm$p.value, 2)),
       title = "B. Simulated Trend Analyses") +
  theme_ipsum_rc() +
  scale_x_continuous(labels = c(1995,2000,2005,2010,2015),
                     breaks = c(1995,2000,2005,2010,2015)) +
  theme(legend.position="none", 
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(size=14, face="plain"),
        axis.title.x = element_text(size=14, face="plain",
                                    margin = margin(t = 10, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size=14, face="plain",
                                    margin = margin(t = 0, r = 10, b = 0, l = 0)),
        axis.text.x = element_text(size=14, face="plain"),
        axis.text.y = element_text(size=14, face="plain"),
        plot.margin = margin(t = 10, r = 0, b = 10, l = 0))
simulated_trends_gg %>%  
  ggsave(here("manuscript/ecosphere_production/figures/simulated_analysis.tiff"), ., width = 8.5, height = 5.5,
         units = "in", dpi = 300, compress = "lzw")

simulated_plot <- cowplot::plot_grid(site_gg, simulated_trends_gg, 
                                align = "h", ncol = 1) 

ggsave(here("manuscript/ecosphere_production/figures/simulated_data_analysis.tiff"), simulated_plot, width = 15.45*1.34, 
       height = 20*1.34, units = "cm", dpi = 300, compress = "lzw")
img <- image_read(here("manuscript/ecosphere_production/figures/simulated_data_analysis.tiff"))
image_write(image_resize(img, "1824.803x2362.205"),here("manuscript/ecosphere_production/figures/figure_9_simulated_data_analysis.tiff"), compression = "lzw")

# Trophic State Plots
chla_gg_ts <- ww_data %>%
  #filter(state == "RI") %>%
  wq_trophic_trend_gg("chla", yvar = "measurement_anmly_mdn", 
               y = expression(paste("Median Yearly Chlorophyll ", 
                                    italic(" a"), " Anomaly (", mu, "g/L)")), 
               x = "Year",
               write = here("data/chla_data_anomaly_ts.csv"), error_bar = "iqr",
               title = "A. URI Watershed Watch Chlorophyll")
ggsave(here("manuscript/ecosphere_production/figures/ww_chla_trends_anomaly_ts.tiff"), chla_gg_ts[[1]], width = 7.5, 
       height = 5.625, 
       units = "in", dpi = 300, compress = "lzw")

ww_chla_kt_ts <- chla_gg_ts[[2]]
ww_chla_df_ts <- chla_gg_ts[[3]]
ww_chla_rl_ts <- chla_gg_ts[[4]]

temp_gg_ts <- ww_data %>%
  #filter(state == "RI") %>%
  wq_trophic_trend_gg("temp", yvar = "measurement_anmly_mdn", 
                      y = expression(paste("Median Yearly Temperature (°C)")), 
                      x = "Year",
                      write = here("data/temp_data_anomaly_ts.csv"), error_bar = "iqr",
                      title = "B. URI Watershed Watch Temperature")
ggsave(here("manuscript/ecosphere_production/figures/ww_temp_trends_anomaly_ts.tiff"), temp_gg_ts[[1]], width = 7.5, 
       height = 5.625, 
       units = "in", dpi = 300, compress = "lzw")

ww_temp_kt_ts <- temp_gg_ts[[2]]
ww_temp_df_ts <- temp_gg_ts[[3]]
ww_temp_rl_ts <- temp_gg_ts[[4]]

tp_gg_ts <- ww_data %>%
  #filter(state == "RI") %>%
  wq_trophic_trend_gg("total_p", yvar = "measurement_anmly_mdn", 
                      y = expression(paste("Median Yearly Total Phosphorus Anomaly (", mu, "g/L)")), 
                      x = "Year",
                      write = here("data/tp_data_anomaly_ts.csv"), error_bar = "iqr",
                      title = "C. URI Watershed Watch Total Phosphorus")
ggsave(here("manuscript/ecosphere_production/figures/ww_tp_trends_anomaly_ts.tiff"), tp_gg_ts[[1]], width = 7.5, 
       height = 5.625, 
       units = "in", dpi = 300, compress = "lzw")

ww_tp_kt_ts <- tp_gg_ts[[2]]
ww_tp_df_ts <- tp_gg_ts[[3]]
ww_tp_rl_ts <- tp_gg_ts[[4]]

tn_gg_ts <- ww_data %>%
  #filter(state == "RI") %>%
  wq_trophic_trend_gg("total_n", yvar = "measurement_anmly_mdn", 
                      y = expression(paste("Median Yearly Total Nitrogen Anomaly (", mu, "g/L)")), 
                      x = "Year",
                      write = here("data/tn_data_anomaly_ts.csv"), error_bar = "iqr",
                      title = "D. URI Watershed Watch Total Nitrogen")
ggsave(here("manuscript/ecosphere_production/figures/ww_tn_trends_anomaly_ts.tiff"), tn_gg_ts[[1]], width = 7.5, 
       height = 5.625, 
       units = "in", dpi = 300, compress = "lzw")

ww_tn_kt_ts <- tn_gg_ts[[2]]
ww_tn_df_ts <- tn_gg_ts[[3]]
ww_tn_rl_ts <- tn_gg_ts[[4]]

np_gg_ts <- ww_data %>%
  #filter(state == "RI") %>%
  wq_trophic_trend_gg("total_n", yvar = "measurement_anmly_mdn", 
                      y = expression(paste("Median Yearly N:P Anomaly (", mu, "g/L)")), 
                      x = "Year",
                      write = here("data/np_data_anomaly_ts.csv"), error_bar = "iqr",
                      title = "E. URI Watershed Watch Nitrogen:Phosphorus")
ggsave(here("manuscript/ecosphere_production/figures/ww_np_trends_anomaly_ts.tiff"), np_gg_ts[[1]], width = 7.5, 
       height = 5.625, 
       units = "in", dpi = 300, compress = "lzw")

ww_np_kt_ts <- np_gg_ts[[2]]
ww_np_df_ts <- np_gg_ts[[3]]
ww_np_rl_ts <- np_gg_ts[[4]]

# Build WW TS Plots
ts_plot <- cowplot::plot_grid(chla_gg_ts[[1]], temp_gg_ts[[1]], 
                              tp_gg_ts[[1]], tn_gg_ts[[1]], 
                              np_gg_ts[[1]], align = "h", ncol = 1) 

ggsave(here("manuscript/ecosphere_production/figures/trophic_state_trends_anomaly.tiff"), chla_plot, width = 15.45*1.34, 
       height = 20*1.34, units = "cm", dpi = 300, compress = "lzw")


# Build LAGOS-NE TS Plots
chla_gg_ts <- lagos_data %>%
  #filter(state == "RI") %>%
  wq_trophic_trend_gg("chla", yvar = "measurement_anmly_mdn", 
                      y = expression(paste("Median Yearly Chlorophyll ", 
                                           italic(" a"), " Anomaly (", mu, "g/L)")), 
                      x = "Year",
                      write = here("data/lagos_chla_data_anomaly_ts.csv"), error_bar = "iqr",
                      title = "A. LAGOS-NE Chlorophyll")
ggsave(here("manuscript/ecosphere_production/figures/lagos_chla_trends_anomaly_ts.tiff"), chla_gg_ts[[1]], width = 7.5, 
       height = 5.625, 
       units = "in", dpi = 300, compress = "lzw")

lagos_chla_kt_ts <- chla_gg_ts[[2]]
lagos_chla_df_ts <- chla_gg_ts[[3]]
lagos_chla_rl_ts <- chla_gg_ts[[4]]

tp_gg_ts <- lagos_data %>%
  #filter(state == "RI") %>%
  wq_trophic_trend_gg("total_p", yvar = "measurement_anmly_mdn", 
                      y = expression(paste("Median Yearly Total Phosphorus Anomaly (", mu, "g/L)")), 
                      x = "Year",
                      write = here("data/lagos_tp_data_anomaly_ts.csv"), error_bar = "iqr",
                      title = "B. LAGOS-NE Total Phosphorus")
ggsave(here("manuscript/ecosphere_production/figures/lagos_tp_trends_anomaly_ts.tiff"), tp_gg_ts[[1]], width = 7.5, 
       height = 5.625, 
       units = "in", dpi = 300, compress = "lzw")

lagos_tp_kt_ts <- tp_gg_ts[[2]]
lagos_tp_df_ts <- tp_gg_ts[[3]]
lagos_tp_rl_ts <- tp_gg_ts[[4]]

tn_gg_ts <- lagos_data %>%
  #filter(state == "RI") %>%
  wq_trophic_trend_gg("total_n", yvar = "measurement_anmly_mdn", 
                      y = expression(paste("Median Yearly Total Nitrogen Anomaly (", mu, "g/L)")), 
                      x = "Year",
                      write = here("data/lagos_tn_data_anomaly_ts.csv"), error_bar = "iqr",
                      title = "C. LAGOS-NE Total Nitrogen")
ggsave(here("manuscript/ecosphere_production/figures/lagos_tn_trends_anomaly_ts.tiff"), tn_gg_ts[[1]], width = 7.5, 
       height = 5.625, 
       units = "in", dpi = 300, compress = "lzw")

lagos_tn_kt_ts <- tn_gg_ts[[2]]
lagos_tn_df_ts <- tn_gg_ts[[3]]
lagos_tn_rl_ts <- tn_gg_ts[[4]]

np_gg_ts <- lagos_data %>%
  #filter(state == "RI") %>%
  wq_trophic_trend_gg("total_n", yvar = "measurement_anmly_mdn", 
                      y = expression(paste("Median Yearly N:P Anomaly (", mu, "g/L)")), 
                      x = "Year",
                      write = here("data/lagos_np_data_anomaly_ts.csv"), error_bar = "iqr",
                      title = "D. LAGOS-NE Nitrogen:Phosphorus")
ggsave(here("manuscript/ecosphere_production/figures/lagos_np_trends_anomaly_ts.tiff"), np_gg_ts[[1]], width = 7.5, 
       height = 5.625, 
       units = "in", dpi = 300, compress = "lzw")

lagos_np_kt_ts <- np_gg_ts[[2]]
lagos_np_df_ts <- np_gg_ts[[3]]
lagos_np_rl_ts <- np_gg_ts[[4]]

# Sample size figure
year_num_ww <- figure_data %>%
  filter(source == "uriww") %>%
  select(year, variable, n) %>%
  spread(variable, n) %>%
  rename("Year" = "year", "Chl." = "chla", 
         "N:P" = "np_ratio", "Temp." = "temp", 
         "TN" = "total_n", "TP" = "total_p") %>%
  gather(variable, n, Chl.:TP) %>%
  mutate(variable = factor(variable,levels = c("Temp.", "Chl.",
                                               "TN", "TP",
                                               "N:P"), 
                           ordered = TRUE))

year_num_lagosne <- figure_data %>%
  filter(source == "lagosne") %>%
  select(year, variable, n) %>%
  spread(variable, n)  %>%
  rename("Year" = "year", "Chl." = "chla", 
         "N:P" = "np_ratio", 
         "TN" = "total_n", "TP" = "total_p") %>%
  gather(variable, n, Chl.:TP) %>%
  mutate(variable = factor(variable,levels = c("Chl.",
                                               "TN", "TP",
                                               "N:P"), 
                           ordered = TRUE))

ww_sample_gg <- year_num_ww %>%
  ggplot(aes(x = Year, y = n)) +
  geom_line(color = "darkred", size = 1) +
  geom_point(color = "darkred", size = 1.5) +
  facet_grid(variable ~ .)  +
  theme_ipsum_rc() +
  scale_x_continuous(labels = c(1995,2000,2005,2010,2015),
                     breaks = c(1995,2000,2005,2010,2015),
                     limits = c(1993, 2016)) +
  scale_y_continuous(labels = c(0, 25, 50),
                     breaks = c(0, 25, 50),
                     limits = c(0, 55)) +
  theme(legend.position="none", 
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(size=14, face="plain"),
        axis.title.x = element_text(size=14, face="plain",
                                    margin = margin(t = 10, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size=14, face="plain",
                                    margin = margin(t = 0, r = 10, b = 0, l = 0)),
        axis.text.x = element_text(size=14, face="plain"),
        axis.text.y = element_text(size=14, face="plain"),
        plot.margin = margin(t = 10, r = 0, b = 10, l = 0),
        strip.text = element_text(size = 11)) +
  labs(title = "A. Number of sampled lakes for each variable 
       from URI Watershed Watch program", y = "Number of sampled lakes")
  
  lagos_sample_gg <- year_num_lagosne %>%
    ggplot(aes(x = Year, y = n)) +
    geom_line(color = "darkblue", size = 1) +
    geom_point(color = "darkblue", size = 1.5) +
    facet_grid(variable ~ .)  +
    theme_ipsum_rc() +
    scale_x_continuous(labels = c(1995,2000,2005,2010,2015),
                       breaks = c(1995,2000,2005,2010,2015),
                       limits = c(1993, 2016)) +
    scale_y_continuous(labels = c(0, 200, 400),
                       breaks = c(0, 200, 400)) +
    theme(legend.position="none", 
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(size=14, face="plain"),
        axis.title.x = element_text(size=14, face="plain",
                                    margin = margin(t = 10, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size=14, face="plain",
                                    margin = margin(t = 0, r = 10, b = 0, l = 0)),
        axis.text.x = element_text(size=14, face="plain"),
        axis.text.y = element_text(size=14, face="plain"),
        plot.margin = margin(t = 10, r = 0, b = 10, l = 0),
        strip.text = element_text(size = 11)) +
    labs(title = "B. Number of sampled lakes for each variable 
       from LAGOS-NE", y = "Number of sampled lakes")

sample_size_plot <- cowplot::plot_grid(ww_sample_gg, lagos_sample_gg, 
                                      align = "h", ncol = 1) 
  
#sample_size_plot
ggsave(here("manuscript/ecosphere_production/figures/sample_sizes.tiff"), 
       sample_size_plot, width = 15.45*1.34, 
       height = 20*1.34, units = "cm", dpi = 300, compress = "lzw")
img <- image_read(here("manuscript/ecosphere_production/figures/sample_sizes.tiff"))
image_write(image_resize(img, "1824.803x2362.205"),here("manuscript/ecosphere_production/figures/figure_3_sample_sizes.tiff"), compression = "lzw")
