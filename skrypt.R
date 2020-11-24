library(openxlsx)
library(devtools) #pakiet potrzebny do oslugi gita
library(tidyverse)

use_git() #komenda która pozwala użyć gita

use_r("fun_pack") #tworzy funkcji fun_pack jesli nie istnieje

load_all() # laduje funcjie

fun_pack()

exists("funpack", where = globalenv(), inherits = FALSE) #sprawdzenie czy funkcja istnieje lokalnie

check() # sprawdzanie czy funkcja jest dobrze napisana

#tworzymy dokumentacje
library(roxygen2) #code -> insert Roxygen Selection

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

unique(wskazniki$Fuel)
unique(wskazniki$Technology)

# 2. Przygotowanie danych wejściowych -------------------------------------


input <- data.frame(Nat = rnorm(50, mean = 100, sd = 50),
                    Segment = sample(c("Mini", "Small", "Medium", "Large-SUV-Executive"),
                                     size = 50, replace = T) %>% as.character())
input$Segment <- as.character(input$Segment)

save(input,file="Data/input.rda")
save(wskazniki,file="Data/wskazniki.rda")

# Zdanie domowe. Nasz input ma zawierać również infomracje o rodzaju paliwa (Fuel),
# technologi oczyszczania spalin (Technology).

# 3. Funkcja --------------------------------------------------------------

library(devtools) #pakiet potrzebny do oslugi gita
library(tidyverse)

load_all() # laduje funcjie

fun_pack()
pfwykres(out,out$Technology, out$Emisja)

colnames(wskazniki)



