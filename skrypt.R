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
