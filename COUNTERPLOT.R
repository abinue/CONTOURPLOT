
install.packages("readr")
install.packages("akima")
install.packages("dplyr")

library(readr)
library(akima)
library(dplyr)

# Leemos el dataset
datos <- read_csv("GlobalWeatherRepository.csv")

# Interpolamos sobre una cuadrícula
interp_data <- with(datos, interp(x = longitude,
                                          y = latitude,
                                          z = pressure_mb,
                                          duplicate = "mean",
                                          linear = TRUE))

# Crear el contour plot clásico
contour(interp_data$x, interp_data$y, interp_data$z,
        nlevels = 15,                           
        col = topo.colors(15),                
        lwd = 2,                                
        xlab = "Longitud", ylab = "Latitud",
        main = "Mapa de Isobaras (Contour Plot)")
