mis_datos <- as.data.frame(tabinfo)

#Eliminar la columna Nombre
mis_datos <- mis_datos[, -1]
#Eliminar la columna Nacionalidad
mis_datos <- mis_datos[, -1]
#Eliminar columna Tarjetas rojas
mis_datos <- mis_datos[, -10]
#Eliminar columna Autogoles
mis_datos <- mis_datos[, -8]


#Escalar datos, dividir entre las varianzas 
data <- scale(mis_datos)
write.csv(data, dir "data_for_Kmeans.csv", row.names=TRUE)



micluster <- kmeans(data, 3, nstart=5, iter.max=30)
wss <- (nrow(data) - 1) * sum(apply(data, 2, var))
for(i in 2:20) wss[i] <- sum(kmeans(data, centers=i)$withinss)
par(mar=c(1, 1, 1, 1))
plot(1:20, wss, type="b", xlab="Numero de clusters", ylab="withinss groups")


micluster <- kmeans(data, 5, nstart=5, iter.max=30)

library(fmsb)
par(mfrow=c(3,2))


dat <- as.data.frame(t(micluster$centers[1, ]))
dat <- rbind(rep(1,10), rep(-1,10), dat)
radarchart(dat)

dat <- as.data.frame(t(micluster$centers[2, ]))
dat <- rbind(rep(1,10), rep(-1,10), dat)
radarchart(dat)

dat <- as.data.frame(t(micluster$centers[3, ]))
dat <- rbind(rep(1,10), rep(-1,10), dat)
radarchart(dat)

dat <- as.data.frame(t(micluster$centers[4, ]))
dat <- rbind(rep(1,10), rep(-1,10), dat)
radarchart(dat)

dat <- as.data.frame(t(micluster$centers[5, ]))
dat <- rbind(rep(1,10), rep(-1,10), dat)
radarchart(dat)


















