#Installation packages from CRAN
#Installation package "terra"

install.packages ("terra")

# Si mettono le virgolette perchè è una parte testuale
# Selezionare una città da cui scaricare il pacchetto. Si usa solitamente Padova.
#Usare comando "library" per vedere se il pacchetto è stato installato correttamente.
#Se resituisce un ">" senza altro a fianco significa che è andata a buon fine l'operazione. Questo vale in generale per ogni operazione che si fa su R, se da "+" è un segnale d'errore

library(terra) #package used for remote sensing data

#Si usa in R quindi non si usano le virgolette 

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

mato = rast("Matogrosso_l5_1992219_lrg.jpg")
#Da un messaggio d'errore da ignorare perchè non conosce le estensioni

#Con la funzione "plot()" chiedo a R di mostrarmi l'immagine che ho caricato dalla mia home (o dove l'ho messa).
plot(mato)

#Ora che ho l'immagine posso farci un po' di cose simpatiche...
#qualche esempio ora lo vediamo, ma prima, parliamo delle bande.
#Le immagini che vediamo sono caratterizzate da 3 possibili bande di colore nel formato RGB (Rosso, Verde, Blu eka Red, Green, Blue) ma posso anche lavorare in NiRGB (Nir, Green, Blue)
#Mi evidenzio quindi per me per comodità le bande

#Bands:
#Band 1: nir
#Band 2: red
#Band 3: green

plotRGB (mato, r=2, g=3, b=1)
plotRGB (mato, r=2, g=1, b=3)
plotRGB (mato, r=1, g=2, b=3)

