#' Funkcja rysujaca wykres na podstawie obliczonych emisji spalin
#'
#' Funkcja rysuje wykres na podstawie obliczonych emisji z funkcji \code{fun_pack()}
#'
#' @param path dataframe - ramka danych obliczonych emisji z funkcji \code{fun_pack()}
#' @param kat character - kategoria pojazdu
#' @param default character - domyslna wartosc kategori pojazdu
#' @param x character - zmiennna numeryczna (os x)
#' @param y character - zmianna kategoryczna (os y)
#'
#' @return double
#'
#' @import dplyr tidyverse ggplot2
#' @examples
#' # Wykres emisji spalin ze wzgledu na technologie pojazdow
#' pfwykres(path = out,
#'         kat = Category,
#'         x = Technology,
#'         y = Emisja)
#'
#' @export

pfwykres <- function(path = out,
                kat = Category,
                default = "Passenger Cars",
                x = Technology,
                y = Emisja) {

  kat <- enquo(kat)
  x <- enquo(x)
  y   <- enquo(y)

  data <- out

  if (!is.null(default)) {
    data <- data %>%
      filter(!!kat %in% default)
  }

  data %>%
    ggplot(., aes(x = !!x,
                  y = !!y,
                  fill = !!x)) +
    geom_boxplot() +
    scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))-> p



  return(p)
}



