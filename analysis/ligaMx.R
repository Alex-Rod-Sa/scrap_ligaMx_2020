library(rvest)
#Obtiene la URL de cada equipo de la liga
url_equipo <- "http://www.ligabbva.mx/cancha/estadisticahistorica"
selector_equipo <- "body > section:nth-child(17) > div > div.estadisticas-equipos > div:nth-child(1) > div > table > tbody > tr:nth-child(1) > td:nth-child(2) > a.tpts.loadershow"
pagina_equipo <- read_html(url_equipo)
nodo_equipo <- html_node(pagina_equipo, selector_equipo)
nodo_texto_equipo <- html_text(nodo_equipo)
nodo_texto_equipo
nodo_links <- html_attr(nodo_equipo, "href")
nodo_links

url_equipo_completo <- paste0("http://www.ligabbva.mx/", nodo_links)

#Obtiene URL de cada jugador
selector_jugador <- "body > section.posiciones > div.container > ul:nth-child(2) > li:nth-child(1) > div > div.detalle > a"
pagina_jugador <- read_html(url_equipo_completo)
nodo_jugador <- html_node(pagina_jugador, selector_jugador)
nodo_texto_jugador <- html_text(nodo_jugador)
nodo_links_jugador <- html_attr(nodo_jugador, "href")

url_jugador <- paste0("http://www.ligabbva.mx", nodo_links_jugador)

lista_pagina_equipos <- c(1:20)
paginas <- paste0("http://www.ligabbva.mx/", lista_pagina_equipos)


linksJugadoresIndividuales <- function(url){
  
  selector_jugador <- "div > div.detalle > a"
  pagina_jugador <- read_html(url_equipo_completo)
  nodo_jugador <- html_nodes(pagina_jugador, selector_jugador)
  nodo_texto_jugador <- html_text(nodo_jugador)
  nodo_links_jugador <- html_attr(nodo_jugador, "href")

}

prueba <- linksJugadoresIndividuales(paginas[5])
linksPlayer <- sapply(paginas, linksJugadoresIndividuales)
vlinks <- as.vector(linksPlayer)
vlinkPlayer <- paste0("http://www.ligabbva.mx", linksPlayer)

url <- "http://www.ligabbva.mx/cancha/jugador/17149/eyJpZENsdWIiOiA2fQ==/jose-de-jesus-corona-rodriguez"
nombre <- "#infoJugador > div > div.detalle.col-xs-9 > h1"
pagina_web <- read_html(url)
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

edad_

minutos_jugados <- "#info > div > div > div.col-lg-12 > div > p:nth-child(5) > a > span"
minutos_nodo <- html_node(pagina_web, minutos_jugados)
minutos_texto <- html_text(minutos_nodo)

partidos <- "#info > div > div > div.col-lg-12 > div > p:nth-child(1) > a > span"
partidos_nodo <- html_node(pagina_web, partidos)
partidos_texto <- html_text(partidos_nodo)

partidos_titular <- "#info > div > div > div.col-lg-12 > div > p:nth-child(2) > a > span"
partidos_titular_nodo <- html_node(pagina_web, partidos_titular)
partidos_titular_texto <- html_text(partidos_titular_nodo)

tarjetas_amarillas <- "#info > div > div > div.col-lg-12 > div > p.amarillo > a > span"
amarillas_nodo <- html_node(pagina_web, tarjetas_amarillas)
amarillas_texto <- html_text(amarillas_nodo)

tarjetas_rojas <- "#info > div > div > div.col-lg-12 > div > p.rojo > span"
rojas_nodo <- html_node(pagina_web, tarjetas_rojas)
rojas_texto <- html_text(rojas_nodo)

goles <- "#info > div > div > div.col-lg-12 > div > p:nth-child(3) > span"
goles_nodo <- html_node(pagina_web, goles)
goles_texto <- html_text(goles_nodo)

auto_goles <- "#info > div > div > div.col-lg-12 > div > p:nth-child(4) > span"
auto_goles_nodo <- html_node(pagina_web, auto_goles)
auto_goles_texto <- html_text(auto_goles_nodo)















