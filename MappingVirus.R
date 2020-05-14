# Packages 
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
theme_set(theme_bw())
library("sf")
library("rnaturalearth")
library("rnaturalearthdata")
library(dplyr)
library(ggspatial)
## Importing CSV files 

case_info = read.csv("Case.csv")
patient_route = read.csv("PatientRoute.csv")
patient_info = read.csv("PatientInfo.csv")

case_info = case_info %>% 
  mutate(longitude = as.numeric(longitude), 
         latitude = as.numeric(latitude))

patient_route = patient_route %>% 
  mutate(longitude = as.numeric(longitude), 
         latitude = as.numeric(latitude))
## Korean Map 

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)



ggplot() +
  geom_sf(data = world, fill = "antiquewhite") +
  coord_sf(xlim = c(123, 131), ylim = c(34, 39), expand = FALSE)+
  theme(panel.grid.major = element_line(color = gray(.5), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))+
  geom_point(data = patient_route, aes(x= longitude, y = latitude), color = "red", size = 0.5, alpha = 0.5)+
  annotate(geom = "text", x = 124, y = 37.5, label = "South Korea", fontface = "italic", 
           color = "grey22", size = 6)+
  annotate(geom = 'text', x= 127, y = 38, label = 'Seoul', fontface = "italic", color = 'black', size = 4)+
  geom_point(aes(x= 126.97, y = 37.56), colour = 'black', size= 3)+
  annotate(geom = 'text', x= 129.5, y = 35.2, label = 'Busan', fontface = "italic", color = 'black', size = 4)+
  geom_point(aes(x= 129.34, y = 36), colour = 'black', size= 3)+
  annotate(geom = 'text', x= 130, y = 36.2, label = 'Pohang', fontface = "italic", color = 'black', size = 4)+
  geom_point(aes(x= 129, y = 35.17), colour = 'black', size= 3)+
  annotate(geom = 'text', x= 126.8, y = 36.6, label = 'Cheonan', fontface = "italic", color = 'black', size = 4)+
  geom_point(aes(x= 127.11, y = 36.82), colour = 'black', size= 3)+
  annotation_scale(location = "bl", width_hint = 0.3) + 
  annotation_north_arrow(location = "bl", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"), 
                         style = north_arrow_fancy_orienteering)


ggsave("Korea_Covid.pdf")    
  
