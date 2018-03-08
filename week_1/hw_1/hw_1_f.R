### hw_1_question


########################################################### Task 1

# 查看內建資料集: 鳶尾花(iris)資料集
iris

# 使用dim(), 回傳iris的列數與欄數

# ans : 150   5

# 使用head() 回傳iris的前六列

head(iris)
# 使用tail() 回傳iris的後六列
tail(iris)

# 使用str() 
str(iris)

# 使用summary() 查看iris敘述性統計、類別型資料概述。
summary(iris)

########################################################### Task 2

# 使用for loop 印出九九乘法表
# Ex: (1x1=1 1x2=2...1x9=9 ~ 9x1=9 9x2=18... 9x9=81)
for(i in 1:length(x)){
for(f in 1:length(y)){
  z<-x[i]*y[f]
  cat(x[i], 'x', y[f], '=' ,z)
  cat('\n')
}}

########################################################### Task 3

# 使用sample(), 產出10個介於10~100的整數，並存在變數 nums

nums<-sample(10:100,10)

# 查看nums
nums
#  [1]  70  13 100  34  38  30  17  85  25  99

# 1.使用for loop 以及 if-else，印出大於50的偶數，並提示("偶數且大於50": 數字value)
nums<-sample(10:100,10)

for(i in 1:length(nums)){
  if(nums[i]>50 & nums[i]%%2==0){
    cat('偶數且大於50',':', nums[i],'number:',i)
    cat('\n')
  }else{next}
}

# 2.特別規則：若數字為66，則提示("太66666666666了")並中止迴圈。
nums<-sample(10:100,10)
for(i in 1:length(nums)){
  if(nums[i]>50 & nums[i]%%2==0){
    cat('偶數且大於50',':', nums[i],'number:',i)
    cat('\n')
  }else if(nums[i]==66){
  print('太66666666666了')
    break}else{next}
}

  

########################################################### Task 4

# 請寫一段程式碼，能判斷輸入之西元年分 year 是否為閏年

greg_even<-function(year){
  if((year%%400==0)|(year%%4==0 & year%%100!=0)){print('這是閏年')
    }else{print('這是平年')}
}





########################################################### Task 5

# 猜數字遊戲
# 1. 請寫一個由電腦隨機產生 #不同數字# 的四位數(1A2B遊戲)
# 2. 玩家可重覆猜電腦所產生的數字，並提示猜測的結果(EX:1A2B)
# 3. 一旦猜對，系統可自動計算玩家猜測的次數

#generate 4 random numbers

gen<-as.numeric(sample(1:9,4,replace = F))

game<-function(a,b,c,d){
on_track<-sum((a==gen[1])+(b==gen[2])+(c==gen[3])+(d==gen[4]))
num_right<-sum((a==gen)+(b==gen)+(c==gen)+(d==gen))
B<-num_right-on_track
A<-on_track
if(B==0){return(cat(A,'A'))
}else if (B==4){return(cat(B,'B'))
    }else(return(cat(A,'A',B,'B')))
}

## final test !!
gen<-as.numeric(sample(1:9,4,replace = F))
i<-1
game<-function(a,b,c,d){
  on_track<-sum((a==gen[1])+(b==gen[2])+(c==gen[3])+(d==gen[4]))
  num_right<-sum((a==gen)+(b==gen)+(c==gen)+(d==gen))
  B<-num_right-on_track
  A<-on_track
  i=i+1
  cat(A,'A',B,'B')
  cat('\n')
  if(A==4){
    cat('共猜了',i,'次')
  }
}












