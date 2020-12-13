#' Fukcja obliczania emisji spalania
#'
#' @param dane dataframe
#' @param kategoria character
#' @param paliwo = character
#' @param euro character
#' @param technologia character
#' @param zanieczyszczenie character
#' @param mod character
#'
#' @return dataframe
#'
#' @import dplyr tidyverse ggplot2
#' @examples
#' fun_pack(input, "Passenger Cars", NULL, "Euro 5", NULL, c("EC", "CO"),"")
#'
#' @export

fun_pack <- function(dane = input,
                     kategoria = NULL,
                     paliwo = NULL,
                     euro = NULL,
                     technologia = NULL,
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

  #Filter Fuel

  if(!is.null(paliwo))
  {
    out <- out %>% filter(Fuel %in% paliwo)
  }
  else
  {
    uniq <- unique(out$Fuel)
    out <- out %>% filter(Fuel %in% uniq)
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

  #Filter Technology

  if(!is.null(technologia))
  {
    out <- out %>% filter(Technology %in% technologia)
  }
  else
  {
    uniq <- unique(out$Technology)
    out <- out %>% filter(Technology %in% uniq)
  }

  #Filter Technology

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

  out <- inner_join(x = out, y = input, by = "Segment")

  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  out <<- out
  return(out)


}
