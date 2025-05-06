Es. Duccio Rocchini su R e RStudio per Corso Cazzolla Gatti "Monitoraggio e Analisi della Biodiversità"

!) IMPORTANTE: Ricordarsi di salvare e riaprire ogni tot per sicurezza di non perdere i dati. Le modifiche si fanno cliccando sulla matitina in alto a destra.
!) Per salvare le modifiche una volta finito si clicca su "ammetti modifiche/applica modifiche" o simili
!) Se si riapre le modifiche sono state salvate e si può riprendere a modificare ricliccando la matita che attiva la modalità modifica

!!) Alcune cose sono scritte in inglese e altre in italiano ma in generale meglio far tutto in inglese, io adesso son pigro e faccio come mi viene al momento.

1) Creare account GitHub
	- Cercare github sul browser
	- cliccare sul sito
	- cliccare su signup per fare account
	- segnare il proprio nome
	- inserire una mail stabile nel tempo, tipo una mail privata, non quella di Unibo che prima o poi scade
	- scegliere metodo di verifica per autenticazione
	- concludere creazione account con successo

2) Creare il proprio repository
	- Cliccare in alto a su NEW di fianco a dove sono indicati i propri repository
	- Dargli un nome, meglio in inglese, perchè si tende a lasciarlo pubblico anche perchè dice che le aziende lo guardano.
	- Selezionare opzione "pubblico"
	- Descrivere brevemente a cosa serve (mi pare)
	- Salvare

3) Lavorare su primo file comparso "ReadMe.md", file in linguaggio markdown, serve per ampliare informazioni di facciata del proprio GitHub e repository (mi pare)
	- Cliccare sul file Readme.md
	- Cliccare sulla matitina in alto a destra, permette di modificare il file in questione
	- Iniziare a scrivere informazioni
	- es. il prof scrive informazioni su di se e su dove prendiamo i dati.
 	 Riporto cosa ha scritto nel codice:
	# Monitoring-and-Analysis-Biodiversity
	Repo for a monitoring lecture

	## Prof. 
	Duccio Rocchini

	## Contacts
	duccio.rocchini@unibo.it

	## Data used
	The Data are Downloaded from [Earth 0bservatory]: (https://earthobservatory.nasa.gov/)

	## Paper useful
	https://besjournals.onlinelibrary.wiley.com/doi/abs/10.1111/2041-210X.14108

	Braga, PHP, Hébert, K., Hudgins, EJ, Scott, ER, Edwards, BP, Sánchez Reyes, LL, ... & Crystal‐Ornelas, R. (2023).
	Non solo per programmatori: come GitHub può accelerare la ricerca collaborativa e riproducibile in ecologia ed evoluzione. Methods in Ecology and Evolution , 14 (6), 1364-1380.
 
	Commenti su cosa ha fatto:
	- Ha indicato il nome del repository che si vede in anteprima in grassetto
	- Spiega a cosa serve
	- Indica il nome del prof
	- Indica i suoi contatti utili
	- Indica da dove vengono i dati impiegati. Scrive con le parentesi quadre e le tonde per far si che alla vista appaia come un link cliccabile e non come un nome con il link a fianco

4) Creare il primo file di R su cui andiamo a lavorare, a scrivere il codice che possiamo importare su R attivamente.
	Se non si vuole rischiare di far della confusione, oltre a lavorare su GitHub su può scrivere appunti e codice nelle note del pc che hanno una codifica di testo in linea con R
	- Cliccare su "+" in alto a destra di fianco alla casellina verde con scritto "codice"
	- Si apre un menù a tendina con scritto "crea nuovo file", cliccarci sopra.
	- Si apre un nuovo file a cui dare il nome dell'argomento contenuto al suo interno. IN QUESTO CASO: "Primo_codice.R", per esempio.
	- Si apre la pagina di testo del nuovo file. Dargli il nome e salvarlo.
	- Aprirlo e iniziare a lavorarci.
	- !) Cliccare sul lato sinistro e non destro, poi sulla matita per iniziare a scrivere e modificare.

5) Cosa si fa in questo nuovo file?, si scrive questo nuovo codice.
	(riporto il codice del mio github INTEGRANDO anche cose che non ha fatto ma si possono fare, viste al corso di Telerilevamento,
	Cosi da avere una visione più completa di alcune funzionalità o resa grafica).

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

!) Per far si che vengano bene in sequenza, occorre prima indicare la funzione e cosa vogliamo che faccia, poi richiamare i grafici, che la funzione impila in colonna o affianca in riga
quindi la resa deve essere questa:

#COLONNA
par(mfrow=c(2,1))
plot(mato1)
plot(mato2)

#RIGA
par(mfrow=c(2,1))
plot(mato1)
plot(mato2)

!: Per fare PULIZIA dopo tante rappresentazioni sull'interfaccia grafica impiego il comando/funzione "dev.off()" che mi pulisce l'interfaccia grafica cancellando l'ultima rappresentazione
dev.off()

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




