#this is for the first task

Tuna <- dplyr::filter(AustFishAquacStats_2022_Tables_v1_0_0, Commodity == "Tunas")

AustFishAquacStats_2022_Tables_v1_0_0 %>%
  ggplot()+
  geom_point(mapping = aes(x= Commodity, y=`1989–90`))

ggplot(data = Tuna) +
  geom_bar(mapping = aes(x = `1989–90`))


df <-AustFishAquacStats_2022_Tables_v1_0_0


df %>%
  select(!unit) %>%
  pivot_longer(!Commodity, names_to = "years")
  