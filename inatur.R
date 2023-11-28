# Coordinates for Sone øst
coordinates_sone_ost <- matrix(c(
  672923.1, 7770025.7, 673194.4, 7770010.8, 673699.8, 7770448.7,
  674242.2, 7770985.8, 674369.2, 7771520.3, 674328.2, 7772116.9,
  674692, 7773429.3, 675180.1, 7774877.9, 675672.2, 7774393.7,
  676151.1, 7774307.7, 677400.6, 7772985.4, 676913.9, 7772349.5,
  675636, 7772000.2, 675405.8, 7770881, 675223.2, 7770513.2,
  674162.2, 7769240.6, 672828.7, 7768055.3, 672625, 7768158.4,
  672214, 7768077.6, 672212.2, 7768087, 672923.1, 7770025.7
), ncol = 2, byrow = TRUE)

polygon_sone_ost <- st_polygon(list(coordinates_sone_ost))
sone_ost_sf <- st_sf(name = "Sone øst", geom = st_sfc(polygon_sone_ost, crs = 25833))


# Coordinates for Sone vest
coordinates_sone_vest <- matrix(c(
  673050, 7770374.2, 672214, 7768077.6, 671409.6, 7768056.4,
  671155.6, 7769009, 671489, 7770003.8, 671213.8, 7770871.6,
  670229.6, 7770908.7, 669991.5, 7771459, 670213.7, 7772654.9,
  671404.3, 7775390.7, 671039.2, 7776300.9, 670774.6, 7778110.6,
  672542, 7777279.8, 672838.4, 7776613.1, 673050, 7770374.2
), ncol = 2, byrow = TRUE)

polygon_sone_vest <- st_polygon(list(coordinates_sone_vest))
sone_vest_sf <- st_sf(name = "Sone vest", geom = st_sfc(polygon_sone_vest, crs = 25833))

# Transform to WGS 84
sone_ost_sf <- st_transform(sone_ost_sf, crs = 4326)
sone_vest_sf <- st_transform(sone_vest_sf, crs = 4326)

# Combine into a single sf object for visualization
combined_sf <- rbind(sone_ost_sf, sone_vest_sf)

# Visualize with Leaflet
library(leaflet)
leaflet(data = combined_sf) %>%
  addTiles() %>%
  addPolygons(color = ~ifelse(name == "Sone øst", "blue", "green"))



