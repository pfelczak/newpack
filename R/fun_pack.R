#' Test
#'
#' @param dane dataframe
#' @param kategoria character
#' @param euro character
#' @param mode character
#' @param substancja character
#'
#' @return
#' @import dplyr tidyverse ggplot2
#' @export
#'
#' @examples
fun_pack <- function(dane = input,
                     kategoria = "Passenger Cars",
                     paliwo = "Petrol",
                     #segment = "Mini",
                     euro = "Euro 5",
                     #technologia = "GDI",
                     mode = "",
                     substancja = c("EC", "CO")) {

  # Zabezpieczenia argumentów funkcji i danych wejscioweych.

  out <- wskazniki %>%
    filter(Category %in% kategoria) %>%
    filter(Fuel %in% paliwo) %>%
    filter(Euro.Standard %in% euro) %>%
    filter(Pollutant %in% substancja) %>%
    filter(Mode %in% mode)
  #filter(Technology %in% technologia)

  out <- inner_join(x = out, y = input, by = "Segment")

  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  out <<- out
  return(out)


}
