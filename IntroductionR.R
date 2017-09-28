# http://www.rpubs.com/JonasLinnell/171851

#{r load-packages, message = FALSE}
library(dplyr)
library(ggplot2)
library(statsr)

#{r load-abrbuthnot-data}
data(arbuthnot)

# You can see the dimensions of this data frame by typing:
## [1] 82  3
dim(arbuthnot)

#{r view-data}

# A tibble: 82 x 3
#    year  boys girls
#   <int> <int> <int>
# 1  1629  5218  4683
# 2  1630  4858  4457
# 3  1631  4422  4102
# 4  1632  4994  4590
# 5  1633  5158  4839
# 6  1634  5035  4820
# 7  1635  5106  4928
# 8  1636  4917  4605
# 9  1637  4703  4457
#10  1638  5359  4952
# ... with 72 more rows

arbuthnot

#{r names-data} [1] "year"  "boys"  "girls"

names(arbuthnot)

#display the first columns
# A tibble: 6 x 5
#   year  boys girls total more_boys
#  <int> <int> <int> <int>     <lgl>
#1  1629  5218  4683  9901      TRUE
#2  1630  4858  4457  9315      TRUE
#3  1631  4422  4102  8524      TRUE
#4  1632  4994  4590  9584      TRUE
#5  1633  5158  4839  9997      TRUE
#6  1634  5035  4820  9855      TRUE
head(arbuthnot)

#{r view-boys}
#[1] 4683 4457 4102 4590 4839 4820 4928 4605 4457 4952 4784 5332 5200 4910 4617
#[16] 3997 3919 3395 3536 3181 2746 2722 2840 2908 2959 3179 3349 3382 3289 3013
#[31] 2781 3247 4107 4803 4881 5681 4858 4319 5322 5560 5829 5719 6061 6120 5822
#[46] 5738 5717 5847 6203 6033 6041 6299 6533 6744 7158 7127 7246 7119 7214 7101
#[61] 7167 7302 7392 7316 7483 6647 6713 7229 7767 7626 7452 7061 7514 7656 7683
#[76] 5738 7779 7417 7687 7623 7380 7288
arbuthnot$boys

#Display a plot
ggplot(data = arbuthnot, aes(x = year, y = girls)) + geom_point()

#help plot
?ggplot

#display the sum
5218 + 4683

#[1]  9901  9315  8524  9584  9997  9855 10034  9522  9160 10311 10150 10850
#[13] 10670 10370  9410  8104  7966  7163  7332  6544  5825  5612  6071  6128
#[25]  6155  6620  7004  7050  6685  6170  5990  6971  8855 10019 10292 11722
#[37]  9972  8997 10938 11633 12335 11997 12510 12563 11895 11851 11775 12399
#[49] 12626 12601 12288 12847 13355 13653 14735 14702 14730 14694 14951 14588
#[61] 14771 15211 15054 14918 15159 13632 13976 14861 15829 16052 15363 14639
#[73] 15616 15687 15448 11851 16145 15369 16066 15862 15220 14928'
arbuthnot$boys + arbuthnot$girls

#add a new column
arbuthnot <- arbuthnot %>% mutate(total = boys + girls)

#Display 
ggplot(data = arbuthnot, aes(x = year, y = total)) +  geom_line()

ggplot(data = arbuthnot, aes(x = year, y = total)) + geom_line() + geom_point()

ggplot(data = arbuthnot, aes(x = year, y = boys/total)) + geom_line()

arbuthnot <- arbuthnot %>% mutate(more_boys = boys > girls)
  
# [1] 1629 1710
range(arbuthnot$year)

data(present)

dim(present)

present <- present %>% mutate(total = boys + girls)

present <- present %>% mutate(prop_boys = boys/total)

ggplot(data = present, aes(x = year, y = prop_boys)) + geom_line()
 
present <- present %>% mutate(more_boys = boys > girls)
 
present <- present %>% mutate(prop_boy_girl = boys/girls)

ggplot(data = present, aes(x = year, y = prop_boy_girl)) + geom_line()

present <- present %>% arrange(desc(total)) 

present
