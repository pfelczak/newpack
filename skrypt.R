# Pakiety startowe

library(openxlsx)
library(devtools) #pakiet potrzebny do oslugi gita
library(tidyverse)

use_git() #komenda która pozwala użyć gita

use_r("fun_pack") #tworzy funkcji fun_pack jesli nie istnieje

load_all() # laduje funcjie

fun_pack()

exists("funpack", where = globalenv(), inherits = FALSE) #sprawdzenie czy funkcja istnieje lokalnie


# Tworzenie dokumentacji

library(roxygen2) #code -> insert Roxygen Selection
document()

use_mit_license("Piotr Felczak")

check() # sprawdzanie czy funkcja jest dobrze napisana


# 1. Wczytanie wskazników  ------------------------------------------------

nazwa <- "F:/(MIiSE) Metody Inwentaryzacji i Szacowania Emisji/cwiczenia dr_Rzeszutek/emisja/nowe_dane_emisja.xlsx"

wskazniki <- openxlsx::read.xlsx(xlsxFile = nazwa,
                                 sheet = 2)

wskazniki$Mode[is.na(wskazniki$Mode)] <- ""

wskazniki <- wskazniki %>%
  select(-`EF.[g/km].or.ECF.[MJ/km]`,
         -`Min.Speed.[km/h]`,
         -`Max.Speed.[km/h]`,
         -Road.Slope,
         -Load)

colnames(wskazniki)[15:17] <- c("Reduction", "Bio", "Procent")


# 2. Przygotowanie danych wejściowych -------------------------------------

segm = c("Mini","Small","Medium","Large-SUV-Executive")
n_spl = 50

input <- data.frame(Nat = abs(rnorm(n_spl, mean = n_spl*2, sd = n_spl)),
                    Segment = sample(segm,
                                  size = n_spl,replace = T) %>% as.character(),
                    Fuel = sample(unique(wskazniki$Fuel),
                                  size = n_spl, replace = T) %>% as.character(),
                    Technology = sample(unique(wskazniki$Technology),
                                  size = n_spl, replace = T) %>% as.character())

save(input,file="Data/input.rda")
save(wskazniki,file="Data/wskazniki.rda")


# 3. Funkcja --------------------------------------------------------------

library(devtools) #pakiet potrzebny do oslugi gita
library(tidyverse)

load_all() # laduje funcjie

#przykladowe wywolanie funkcji fun_pack()

fun_pack(input, "Passenger Cars", "Euro 5", c("EC", "CO"),"")


#przykladowe wywolanie funkcji pfwykres()

pfwykres(path = out,
         kat = Category,
         x = Technology,
         y = Emisja)

#ramki danych

view(wskazniki)
view(input)

#dokumentacja

?input
?wskazniki
?fun_pack()
?pfwykres


