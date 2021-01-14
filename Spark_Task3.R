


df1 = read.csv("C:/Users/ADMIN/Downloads/SampleSuperstore.csv")
View(df1)

library(ggplot2)
library(dplyr)

ncol(df1) 
nrow(df1)

str(df1)
summary(df1)

#Data preparation and cleaning
is.null(df1) #Checking presence of any null values

sum(duplicated(df1)) # Checking presence of any duplicate values
df2=unique(df1) # Gives only unique values
df2
sum(duplicated(df2)) #0 means no duplicate value are present


df=df2 %>% select(-c(Country,Postal.Code)) #Remove country and postal code
View(df)

#Visualization

#sales vs quality
df %>%
  count(Ship.Mode) %>%
  mutate(percent=n/sum(n)*100) 

ggplot() + geom_bar(data=df, aes(x=Ship.Mode,y=Sales),stat = "identity")

ggplot(data=df, aes(x=Quantity,y=Sales,fill= Ship.Mode))+ geom_bar(stat="identity") + labs(title="Sales vs Quantity")
      # Most of sales are from Standard class Ship.mode


#Sales vs Profit
ggplot() + geom_bar(data=df, aes(x=Ship.Mode,y=Profit),stat = "identity")
ggplot(data=df, aes(x=Sales,y=Profit,col= Ship.Mode))+ geom_point()+labs(title="Sales vs Profit")
      #More profit/Loss from Standard class,there are not higher range of profits seen.  


#Sales vs Discount
ggplot() + geom_bar(data=df, aes(x=Ship.Mode,y=Discount),stat = "identity")
ggplot() + geom_point(data=df, aes(x=Discount,y=Sales,col= Ship.Mode))+labs(title="Sales vs Discount")
      #Discount attracts mostly the Standard class ,Same day receive least Discount


#Profit vs Discount
ggplot() + geom_bar(data=df, aes(x=Discount,y=Profit,fill= Ship.Mode),stat = "identity")+labs(title="Sales vs Profit")
      #Products with no discounts show high range of profits but as discount rate increases
      #more and more loss with hardly any profit


#Subcategory vs Profit
ggplot(df,aes(x=Sub.Category)) + geom_bar()
ggplot() + geom_bar(data=df, aes(x=Sub.Category,y=Profit,fill= Region),stat = "identity")+labs(title="Sub.Category vs Profit")
    #More loss are from binders mainly in the central region.Machine and Tables also gives losses


#Subcategory vs Discount
ggplot() + geom_bar(data=df, aes(x=Sub.Category,y=Discount,fill= Region),stat = "identity")+labs(title="Sub.Category vs Discount")
    #Sub category Binders gets more discount then others 


#Subcategory vs Sales
ggplot() + geom_bar(data=df, aes(x=Sub.Category,y=Sales,fill= Region),stat = "identity")+labs(title="Sub.Category vs Sales")
    #More sales are from Sub category Chairs and Phones


#Category vs Sales
ggplot() + geom_bar(data=df, aes(x=Category,y=Sales,fill= Region),stat = "identity")
    #More sales  are from Technology category then Furniture and Office Supplies

#Category vs Profit
ggplot() + geom_bar(data=df, aes(x=Category,y=Profit,fill= Region),stat = "identity")
   #Furniture incurrs more losses than Technology and Office Suppliers

#Category vs Discount
ggplot() + geom_bar(data=df, aes(x=Category,y=Discount,fill= Region),stat = "identity")
   #office suppliers gets more Discount 


#Sale vs Profit
ggplot() + geom_point(data=df, aes(x=Sales,y=Profit,col = Category))+labs(title = "Sale vs Profit")
   # Sales to Profit ratio is same in every category no matter how they are clubbed.



#Conclusion

   #Same day shipment if receives more discounts  can trigger more sales/Profit.Discounts should be
   #based on sales and should not increase after a particular range otherwise unnecessary discounts 
   #with low sales can witness huge losses.
   #Binders and Machine industry should be focused upon more, Binders gets more discount but gives more losses
   #Office Suppliers sales less but gets more discount and gives losses
   #Central region not performing well.

#THANK YOU












