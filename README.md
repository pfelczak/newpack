# newpack
Celem pakietu `newpack` jest policzenie emisji zanieczyszczeń powietrza dla zadanych parametrów.
W pakiecie znajdują się dwie funcje: `fun_pack()`, oraz `pfwykres`
Obie funkcje korzystają z danych zawartych w pliku excel: `1.A.3.b.i-iv Road Transport Appendix 4 Emission Factors 2019`, których nie ma w pakiecie.
Plik został wsptępnie przerobiony i zapisany do zmiennych `input` oraz `wskazniki`
Funkcja `fun_pack()` liczy emisje zanieczyszczeń powietrza dla zadanych flitrów.
Funkcja `pfwykres()` rysuje wykres emisji zanieczyszczeń powietrza dla zadanych parametrów

# instalacja

Wczytanie potrzebnych pakietow:
```r
if (!require(devtools)) {install.packages("devtools"); require(devtools)}
```

Wczytanie plików z githuba

```r

install_git("https://github.com/pfelczak/newpack", force = T, build_vignettes = T)
library(newpack)

```

Zapoznaj się z winietą

``` r
# Podgląd winiety w przeglądarce
browseVignettes("newpack")

# Wyświetlenie okna pomocy
vignette("newpac")

# Wyświetlenie kodu
edit(vignette("newpac"))
```
