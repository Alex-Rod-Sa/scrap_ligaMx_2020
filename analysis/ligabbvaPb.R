
#* @param Peso
#* @param Altura
#* @param Edad
#* @param Minutos
#* @param Partidos jugados
#* @param Partidos inicial
#* @param Goles
#* @param Tarjetas amarillas
#* @get /getCluster
function(Peso, Altura, Edad, Minutos, `Partidos jugados`, `Partidos inicial`, Goles, `Tarjetas amarillas`){ 
  campos <- as.vector(data[1,])
  midist <- matrix(0, ncol=5, nrow=8)
  
  for(i in 1:8){
    c <- dist(x=c(campos[i], micluster$centers[,i]))
    b <- as.matrix(c)
    distancia <- b[-1, 1]
    midist[i,] <- distancia
    
  }
  
  rownames(midist) <- c("Peso", "Altura", "Edad", "Minutos",
                        "Partidos jugados", "Partidos inicial",
                        "Goles", "Targetas amarillas")
  midist
  
  
  dist_total <- apply(midist, 2, sum)
  dist_total
  num_cluster <- which.min(dist_total)  
}

