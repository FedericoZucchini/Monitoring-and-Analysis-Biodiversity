#Installation packages from CRAN
#Installation package "terra"
#E' una libreria R per la gestione e l'analisi di dati spaziali, che mira a fornire un'alternativa più veloce e semplice al pacchetto raster

##Aggiungo a fianco delle cose integrate da me un Cancelletto con un ASTERISCO
install.packages ("terra")

# Si mettono le virgolette perchè è una parte testuale
# Selezionare una città da cui scaricare il pacchetto. Si usa solitamente Padova.
#Usare comando "library" per vedere se il pacchetto è stato installato correttamente.
#Se resituisce un ">" senza altro a fianco significa che è andata a buon fine l'operazione. Questo vale in generale per ogni operazione che si fa su R, se da "+" è un segnale d'errore

library(terra) #package used for remote sensing data

#Si usa in R quindi non si usano le virgolette 

install.packages("imageRy") #*
library(imageRy) #*

#E' un pacchetto che fornisce strumenti per manipolare e analizzare immagini
#imageRy è un altro pacchetto che contiene alcune immagini utili per sperimentare un po' e fare es, comprese queste che usiamo noi

#Importing data
#Cosa fare su Mac o Linux:
#option5 porta a creare tilde (option5/Desktop/)

setwd("~/Desktop/")

#Per Windows invece:
setwd ("C://utente/Desktop/") # Serve per settare la cartella di lavoro
# ATTENZIONE! USE SLASH AND NOT BACKSLASH

#IO ho impostato così: setwd("C:/Users/Federico/Documenti")
#Consiglio: Guardare dove metti le immagine e copiare il percorso pedissequamente, ricordando di stare attenti allo slash che si usa.

#Utilizzo funzione "rast" nominando un file col nome del contenuto inserito al suo interno.
#In questo caso lavorando su un'immagine del Mato Grosso nomino il file, ad es. "mato"
#usando "rast" sto creando oggetti SpatRaster, ovvero delle immagini contenenti informazioni dati dai pixel contenenti valori values a cui posso accedere per vedere come sono con il comando "values"

mato1 = rast("Matogrosso_l5_1992219_lrg.jpg")
#questa è la prima imagine, la più vecchia, in cui vediamo la vegetazione prima del disastro
#Da un messaggio d'errore da ignorare perchè non conosce le estensioni

#Il prof ha fatto solo il lavoro con la prima immagine, io qua metto tutto anche per la seconda.
mato2 = rast("Matogrosso_ast_2006209_lrg.jpg") #*
#questa è la seconda imagine, la più nuova, in cui vediamo la vegetazione DOPO il disastro

#Con la funzione "plot()" chiedo a R di mostrarmi l'immagine che ho caricato dalla mia home (o dove l'ho messa).
plot(mato1)
#plotto anche la seconda per vedere subito la differenza
plot(mato2) #*

#Posso inserire poi il comando per vedere le immagini insieme accoppiate e appaiate, per riga o colonna
#Consiglio colonna per tenerle impilate da un lato e dall'altro proseguire col codice

#Partendo dalla prima coppia di immagini posso appaiarle per vederle in colonna una sull'altra
#Uso il comando par (che accoppia cose indicando che voglio una colonna, c, con 1 colonna e due righe)
par(mfrow=c(2,1))
#Posso fare l'analogo invertendo i due numeri per averle in righa
par(mfrow=c(1,2))

#Ora che ho l'immagine posso farci un po' di cose simpatiche...
#qualche esempio ora lo vediamo, ma prima, parliamo delle bande.
#Le immagini che vediamo sono caratterizzate da 3 possibili bande di colore nel formato RGB (Rosso, Verde, Blu eka Red, Green, Blue) ma posso anche lavorare in NiRGB (Nir, Green, Blue)
#Mi evidenzio quindi per me per comodità le bande

#Bands:
#Band 1: nir
#Band 2: red
#Band 3: green

#Lavoro sulle 3 combinazioni sulla prima immagine
plotRGB (mato1, r=2, g=3, b=1)
plotRGB (mato1, r=2, g=1, b=3)
plotRGB (mato1, r=1, g=2, b=3)

#Lavoro sulle 3 combinazioni sulla seconda immagine
plotRGB (mato1, r=2, g=3, b=1)
plotRGB (mato1, r=2, g=1, b=3)
plotRGB (mato1, r=1, g=2, b=3)

#Posso fare la stessa cosa di prima con le immagine nei diversi colori, cambiando semplicemente i nomi dei file su cui lavoro e come li voglio appaiare.
#Non li scegno tutti per non far troppo casino ma per provare ne segno solo uno per il primo caso

plotRGB (mato1, r=2, g=3, b=1)
plotRGB (mato1, r=2, g=3, b=1)
par(mfrow=c(2,1))
par(mfrow=c(1,2))

