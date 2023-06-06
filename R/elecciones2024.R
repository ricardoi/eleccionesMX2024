# Elecciones 2023

PRIANRD.EDOMEX <- 2752330
MORENAPTPV.EDOMEX <- 3268516
PRIANRD.COAH <- 160874+527708+15839
MORENAPTPV.COAH <- 44498+25713+201497

elecciones2023 <- data.frame(
PRIANRD2023 = sum(PRIANRD.COAH+PRIANRD.EDOMEX),
MORENAPTPV2023 = sum(MORENAPTPV.EDOMEX+MORENAPTPV.COAH))|> 
  t() |>
  as.data.frame()
colnames(elecciones2023) <- "votos"
elecciones2023$colors <- c("darkgreen", "#800000")
# ploting votos
library(ggplot2)

ggplot(elecciones2023, aes(x=rownames(elecciones2023), votos, fill=rev(colors)))+
  geom_bar(stat='identity')+
  scale_fill_manual(values = elecciones2023$colors)+
  geom_text(aes(label=votos), position=position_dodge(width=0.9), vjust=-0.25)+
  theme_classic()
  