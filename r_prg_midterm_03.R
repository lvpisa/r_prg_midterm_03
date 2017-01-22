library(ggplot2)

#繪製散佈圖，看看顏色是G且淨度是VVS1的鑽石克拉數與價格的關係
#先挑選出顏色是G且淨度是VVS1的鑽石資料為dd
dd <- subset(diamonds, color == "G" & clarity == "VVS1")
#作圖並加上linear model的回歸曲線
ggplot(dd, aes(x = carat, y = price))+geom_point()+geom_smooth(method ="lm")
#將鑽石的不同切工（cut）分開作圖並加上linear model的回歸曲線
ggplot(dd, aes(x = carat, y = price, color = cut))+geom_point()+geom_smooth(method ="lm")

#繪製線圖
#airmiles是1937年到1960年共24年間美國旅客航空的里程數
airmiles_num <- as.numeric(airmiles)
airmiles_df <- data.frame(airmiles_num)
ggplot(airmiles_df, aes(x =1937:1960, y = airmiles))+geom_line()+geom_point() + xlab("Year")+ ylab("Passenger Miles/year")+ ggtitle("Passenger Miles on Commercial US Airlines, 1937–1960")

#繪製直方圖
#繪製直方圖，看看顏色是G且淨度是VVS1的0.4-0.6克拉鑽石的價格分佈
dd_carat46 <- dd[dd$carat<0.6& dd$carat>=0.4,]
ggplot(dd_carat46, aes(x= price)) + geom_histogram()
ggplot(dd_carat46, aes(x= price)) + geom_histogram() + facet_wrap(~ cut)

#繪製盒鬚圖
#看看顏色是G且淨度是VVS1的0.4-0.6克拉鑽石的價格分佈
ggplot(dd_carat46,aes(x = cut, y =price)) + geom_boxplot()

#繪製長條圖
ggplot(dd_carat46, aes(x = cut))+geom_bar()
ggplot(diamonds, aes(x = cut))+geom_bar(aes(fill=color),position="dodge")
library(plotly)
ggplotly(ggplot(diamonds, aes(x = cut))+geom_bar(aes(fill=color),position="dodge"))
