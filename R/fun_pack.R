fun_pack <- function(a = 10, b = 20, d = 2){

  out <- sqrt(a*b*d/2 + 100+1)

  out <- stats::rnorm(n = base::round(out,0))
  out <- base::as.data.frame(out)

  out <-dyplr::summarise(out,
                         mean = base::mean(.,na.rm = T))

  return(out)
}
