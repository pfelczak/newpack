library(openxlsx)
library(tidyverse)


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



