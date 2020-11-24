pfwykres <- function(out,zm1,zm2){

  ggplot()+geom_boxplot(out,mapping = aes(x = zm1, y = zm2))
}
