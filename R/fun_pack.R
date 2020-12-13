#' Fukcja do obliczania emisji spalania
#'
#'Funkcja oblicza emisje spalania na podstawie danych ze zmiennej
#' \code{wskazniki}, oraz ze zmiennej \code{input}. Wynikiem jest ramka danych
#' zapisana w zmiennej \code{out}. Dane mozna dowolnie filtrowac ze wzgleu na
#' kategorie, euro standard, oraz zanieczyszczenie.
#'
#' @details Funkcja korzysta z algorytmu do liczenia emisji:
#' Emisja = Nat x ((Alpha  x Procent^2 + Beta x Procent + Gamma +
#' (Delta/Procent)) / (Epsilon x Procent^2 + Zita x Procent + Hta) x (1- Reduction))
#'
#' @param dane dataframe - dane wejscowe
#' @param kategoria character - kategoria pojazdu
#' @param euro character - dopuszczalna norma emnisji spalin np Euro 5
#' @param zanieczyszczenie character - rodzaj emitowanego zanieczyszczenia
#' @param mod character - tryb jazdy danego pojazdu
#'
#' @return dataframe
#'
#' @import dplyr tidyverse ggplot2
#' @examples
#' fun_pack(input, "Passenger Cars", "Euro 5", c("EC", "CO"),"")
#'
#' @export

fun_pack <- function(dane = input,
                     kategoria = NULL,
                     euro = NULL,
                     zanieczyszczenie = NULL,
                     mod = "")
                      {

  out <- wskazniki

  if(!is.null(kategoria))
  {
    out <- out  %>% filter(Category %in% kategoria)
  }
  else
  {
    uniq <- unique(out$Category)
    out <- out  %>% filter(Category %in% uniq)
  }


  #Filter Euro.Standard

  if(!is.null(euro))
  {
    out <- out %>% filter(Euro.Standard %in% euro)
  }
  else
  {
    uniq <- unique(out$Euro.Standard)
    out <- out %>% filter(Euro.Standard %in% uniq)
  }


  #Filter Pollutant

  if(!is.null(zanieczyszczenie))
  {
    out <- out %>% filter(Pollutant %in% zanieczyszczenie)
  }
  else
  {
    uniq <- unique(out$Pollutant)
    out <- out %>% filter(Pollutant %in% uniq)
  }

  #inner join

  out <- inner_join(x = out, y = input, by = c("Segment","Fuel","Technology"))

  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  out <<- out
  return(out)


}
