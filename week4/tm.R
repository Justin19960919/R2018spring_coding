token<-
  'EAACEdEose0cBALwncqM5T5iIpZCdLEjE8WYema9PxSY397Yjc5qHrsDZC4oeOQVJ7gkGJfCZAU6ARW64DZA8TKo6JZCideVrfe7B5UdOENOz6x75ZCUDbLp0EZBuZAkjrs9UB60xODYLZCGZAkoxDjXTBClmB1HbBVXqlZCAIkY7ZApbZB4MeuJNbPo4u9RxfnZAk4bme2sMkuG1tLZBwZDZD'
## token 會變，所以要用的時候需更新
install.packages('Rfacebook')
install.packages('devtools')
library('Rfacebook')
library('devtools')
## Test my token
test<-getUsers('me',token,private_info=F)
test$name
# Using R facebook
#curl -i -X GET \
#"https://graph.facebook.com/v2.12/nexttw?fields=release_date%2Cposts&access_token=EAACEdEose0cBAC8sFeJxZB99wZAZAiRkeMXi6ZBbP6xWr3n9LGYi5mjggWfD17DsJkBbFLVkxpQLxBf12OZBdlz3ZBsgT4yOSpvFCm2InZA5sIUQ3wFstCBZAW17Oo4BZCuZCUGh87jSCAqiNovfqSLlG1wXIUBaQTB14JOe92vhGHBF0220GlX7VPzjX1BqTsEJ62JSvzViZBexgZDZD"

## 壹週刊
page.id<- "125693144152226"
page<-getPage(page.id,token,n=300) #n=300 代表你要取300個posts
View(page[page$likes_count==max(page$likes_count),])
write.csv(page,'tm.csv')





# Make wordclouds
install.packages("tm") 
install.packages('tmcn')
install.packages("SnowballC") 
install.packages("wordcloud") 
install.packages("RColorBrewer") 




library("tm") 
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library('tmcn')

page<-read.csv(file.choose())
docs<-Corpus(VectorSource(page$message))
inspect(docs)
tospace<-content_transformer(function(x,pattern)gsub(pattern,'',x))
docs<-tm_map(docs,removePunctuation)
docs<-tm_map(docs,removeNumbers)
docs<-tm_map(docs,function(word){gsub('[A-Za-z0-9]','',word)})
docs<-tm_map(docs,tospace,'/')
docs<-tm_map(docs,tospace,'@')
docs<-tm_map(docs,tospace,'\\|')
docs<-tm_map(docs,stripWhitespace)
docs<-tm_map(docs,tospace,'我')
docs<-tm_map(docs,tospace,'的')
docs<-tm_map(docs,tospace,'了')
docs<-tm_map(docs,tospace,'呵')
docs<-tm_map(docs,tospace,'呢')
docs<-tm_map(docs,tospace,'嘛')
docs<-tm_map(docs,tospace,'是')
docs<-tm_map(docs,tospace,'啊')
docs<-tm_map(docs,tospace,'就')
docs<-tm_map(docs,removeWords,stopwordsCN())



##########################
install.packages('jiebaR')
install.packages('jiebaRD')
library('jiebaR')
library('jiebaRD')




mixseg = worker()
jieba_tokenizer=function(d){
  unlist(segment(d[[1]],mixseg))
}

seg = lapply(docs, jieba_tokenizer)
freqFrame = as.data.frame(table(unlist(seg)))
freqFrame<-freqFrame[1:3116,]


View(freqFrame)

pal <- brewer.pal(8, 'Dark2')

wordcloud(freqFrame$Var1,freqFrame$Freq,min.freq = 9,
          random.order=F,random.color=T, 
          rot.per=0.3,colors=pal,
          use.r.layout = F,fixed.asp=T,family='Heiti TC Light')



install.packages('tm') 
install.packages('tmcn')
install.packages("SnowballC") 
install.packages("wordcloud") 
install.packages("RColorBrewer") 
install.packages('jiebaR')
install.packages('jiebaRD')
library("tm") 
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library('tmcn')
library('jiebaR')
library('jiebaRD')
