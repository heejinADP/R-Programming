install.packages("ggiraphExtra")
library(ggiraphExtra)
library(tibble)
library(ggplot2)
install.packages("maps")
install.packages("mapproj")

USArrests

usa=USArrests
head(usa)

crime = rownames_to_column(usa, var="state")
head(crime)
crime$state = tolower(crime$state)
states_map = map_data("state")
head(states_map)

states_map_df=as.data.frame(states_map, stringsAsFactors=F)
states_map_df

ggChoropleth(data=crime, aes(fill=Murder, map_id=state), map=states_map_df)
crime$Murder
crime$state

ggChoropleth(crime, aes(fill=Murder, map_id=state), map=states_map_df, interactive=T)
