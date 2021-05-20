library(rvest)

#Obetener URL de equipo
url <- "http://www.ligabbva.mx/cancha/estadisticahistorica/1/eyJpZERpdmlzaW9uIjoiMSIsImlkVGVtcG9yYWRhIjoiNzAiLCAiaWRUb3JuZW8iOiIyIn0="
selector <- "body > section:nth-child(17) > div > div.estadisticas-equipos > div:nth-child(1) > div > table > tbody > tr:nth-child(1) > td:nth-child(2) > a:nth-child(1)"
pagina <- read_html(url)
nodo <- html_node(pagina, selector)
nodo_texto <- html_text(nodo)
nodo_link <- html_attr(nodo, "href")

urlcompleta <- paste0("http://www.ligabbva.mx/", nodo_link)

library(stringr)
pag <- "cancha/club/"
lista_paginas <- c(1:30)
pag <- paste0(pag, lista_paginas)

# Paginas de cada equipo
paginas <- paste0("http://www.ligabbva.mx/", pag)

# Obtener links para acceder a informacion de jugadores

linksJugadores <- function(url){
  
  selector <- "div > div.detalle > a" 
  pagina <- read_html(url)
  nodo <- html_nodes(pagina, selector)
  nodo_texto <- html_text(nodo)
  nodo_link <- html_attr(nodo, "href")
  
}

linksJug <- sapply(paginas, linksJugadores)
vlinksjug <- as.vector(unlist(linksJug))
vlinks <- paste0("http://www.ligabbva.mx", vlinksjug)



#Obtener la informacion de cada jugador

obtenerJugadores<- function(url){
  
  print(url)
  pagina_web <- read_html(url)
  nombre <- "#infoJugador > div > div.detalle.col-xs-9 > h1"
  nombre_nodo <- html_node(pagina_web, nombre)
  nombre_texto <- html_text(nombre_nodo)
  
  
  nacionalidad <- "#infoJugador > div > div.detalle.col-xs-9 > dl:nth-child(3) > dd:nth-child(6)"
  nacionalidad_nodo <- html_node(pagina_web, nacionalidad)
  nacionalidad_texto <- html_text(nacionalidad_nodo)
  
  peso_jugador <- "#infoJugador > div > div.detalle.col-xs-9 > dl:nth-child(4) > dd:nth-child(6)"
  peso_nodo <- html_node(pagina_web, peso_jugador)
  peso_texto <- html_text(peso_nodo)
  
  altura_jugador <- "#infoJugador > div > div.detalle.col-xs-9 > dl:nth-child(4) > dd:nth-child(4)"
  altura_nodo <- html_node(pagina_web, altura_jugador)
  altura_texto <- html_text(altura_nodo)
  
  edad <- "#infoJugador > div > div.detalle.col-xs-9 > dl:nth-child(4) > dd:nth-child(2)"
  edad_nodo <- html_node(pagina_web, edad)
  edad_texto <- html_text(edad_nodo)
  
  minutos_jugados <- "#info > div > div > div.col-lg-12 > div > p:nth-child(5) > a > span"
  minutos_nodo <- html_node(pagina_web, minutos_jugados)
  minutos_texto <- html_text(minutos_nodo)
  
  partidos <- "#info > div > div > div.col-lg-12 > div > p:nth-child(1) > a > span"
  partidos_nodo <- html_node(pagina_web, partidos)
  partidos_texto <- html_text(partidos_nodo)
  
  partidos_titular <- "#info > div > div > div.col-lg-12 > div > p:nth-child(2) > a > span"
  partidos_titular_nodo <- html_node(pagina_web, partidos_titular)
  partidos_titular_texto <- html_text(partidos_titular_nodo)
  
  goles <- "#info > div > div > div.col-lg-12 > div > p:nth-child(3) > a > span"
  goles_nodo <- html_node(pagina_web, goles)
  goles_texto <- html_text(goles_nodo)
  
  auto_goles <- "#info > div > div > div.col-lg-12 > div > p:nth-child(4) > span"
  auto_goles_nodo <- html_node(pagina_web, auto_goles)
  auto_goles_texto <- html_text(auto_goles_nodo)
  
  tarjetas_amarillas <- "#info > div > div > div.col-lg-12 > div > p.amarillo > a > span"
  amarillas_nodo <- html_node(pagina_web, tarjetas_amarillas)
  amarillas_texto <- html_text(amarillas_nodo)
  
  tarjetas_rojas <- "#info > div > div > div.col-lg-12 > div > p.rojo > span"
  rojas_nodo <- html_node(pagina_web, tarjetas_rojas)
  rojas_texto <- html_text(rojas_nodo)
  
  
  
  informacionPlayer <- c(nombre_texto, nacionalidad_texto,
                         peso_texto, altura_texto, edad_texto,
                         minutos_texto, partidos_texto, partidos_titular_texto,
                         goles_texto, auto_goles_texto, 
                         amarillas_texto, rojas_texto)
  
}



info <- sapply(vlinks, obtenerJugadores)

# Tabulador de informacion scrapeada
tabinfo <- t(info)
mis_datos <- as.data.frame(tabinfo)
colnames(mis_datos) <- c("Nombre", "Nacionalidad", "Peso", "Altura",
                         "Edad", "Minutos jugados", "Partidos jugados",
                         "Partidos como titular", "Goles", "Autogoles",
                         "Tarjetas amarillas", "Targetas rojas")
rownames(mis_datos) <- c(1:482)
  
#Export data as csv
write.csv(mis_datos, "dataset_LigaBBVA.csv")




