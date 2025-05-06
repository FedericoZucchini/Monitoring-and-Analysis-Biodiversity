#Installation packages from CRAN
#Installation package "terra"
install.packages ("terra") ## Si mettono le virgolette perchè è una parte testuale
## Selezionare una città da cui scaricare il pacchetto. Si usa solitamente Padova.
#Usare comando "library" per vedere se il pacchetto è stato installato correttamente.
library (terra) ## Si usa in R quindi non si usano le virgolette #package used for remote sensing data

#Importing data
#Mac o Linux: option5 porta a creare tilde (option5/Desktop/)
#Per Windows
setwd ("C://utente/Desktop/") # Serve per settare la cartella di lavoro
# ATTENZIONE! USE SLASH AND NOT BACKSLASH

mato = rast(Matogrosso_l5_1992219_lrg.jpg)
plot(mato)

#Bands:
#Band 1: nir
#Band 2: red
#Band 3: green

plotRGB (mato, r=2, g=3, b=1)
plotRGB (mato, r=2, g=1, b=3)
plotRGB (mato, r=1, g=2, b=3)

