mis_datos2 <- as.data.frame(tabinfo2)
#Procesado de datos

#Borrar las filas con 0 minutos jugados
#Estos pertenecen a jugadores de banca o de cuerpo tecnico
mis_datos2 <- mis_datos2[!is.na(mis_datos2$`Minutos jugados`),]

#Limpiar datos de Pesos
mis_datos2$Peso <- gsub("kg", "", mis_datos2$Peso)
mis_datos2$Peso <- as.numeric(mis_datos2$Peso) #Convertir altura a numeric
promedio_peso <- mean(mis_datos2$Peso, na.rm=TRUE)

#Convertir a numericos la altura
mis_datos2$Altura <- as.numeric(mis_datos2$Altura)

#Limpiar datos de edad y convertir a numeric
mis_datos2$Edad <- str_sub(mis_datos2$Edad, 1, 2)
mis_datos2$Edad <- as.numeric(mis_datos2$Edad)

#Convertir a numericos los minutos jugados
mis_datos2$`Minutos jugados` <- as.numeric(mis_datos2$`Minutos jugados`)

#Convertir a numericos los partidos jugados
mis_datos2$`Partidos jugados` <- as.numeric(mis_datos2$`Partidos jugados`)

#Convertir a numericos los partidos jugados como titular
#Sustituir lo valores NA por la media de partidos jugados como titular
mis_datos2$`Partidos como titular` <- as.numeric(mis_datos2$`Partidos como titular`)
promedio_partidos_titular <- mean(mis_datos2$`Partidos como titular`, na.rm=TRUE)
mis_datos2$`Partidos como titular`[is.na(mis_datos2$`Partidos como titular`)] <- promedio_partidos_titular

#Convertir a numericos las tarjetas amarillas
#Sustituir lo valores NA por la media de tarjetas amarillas
mis_datos2$`Tarjetas amarillas` <- as.numeric(mis_datos2$`Tarjetas amarillas`)
promedio_tarjetas_amarillas <- mean(mis_datos2$`Tarjetas amarillas`, na.rm=TRUE)
mis_datos2$`Tarjetas amarillas`[is.na(mis_datos2$`Tarjetas amarillas`)] <- promedio_tarjetas_amarillas

#Covertir a numeric numero de tarjetas rojas
#mis_datos2$`Targetas rojas`[is.na(mis_datos2$`Targetas rojas`)] <- 0
mis_datos2$`Targetas rojas` <- as.numeric(mis_datos2$`Targetas rojas`)

#Convertir a numericos los goles
#Sustituir lo valores NA por la media de los goles
mis_datos2$Goles <- as.numeric(mis_datos2$Goles)
promedio_goles <- mean(mis_datos2$Goles, na.rm=TRUE)
mis_datos2$Goles[is.na(mis_datos2$Goles)] <- promedio_goles

#Convertir los autogoles a datos numeric
#mis_datos2$Autogoles[is.na(mis_datos2$Autogoles)] <- 0
mis_datos2$Autogoles <- as.numeric(mis_datos2$Autogoles)













