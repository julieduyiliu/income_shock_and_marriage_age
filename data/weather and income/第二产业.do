import excel "C:\Users\Cryst\Desktop\selling daughter\weather and income\1999-2021地级市GDP及一二三产业GDP.xlsx",sheet("第二产业GDP") firstrow allstring clear
drop C
rename 地级市 城市

rename E GDP1999
rename F GDP2000
rename G GDP2001
rename H GDP2002
rename I GDP2003
rename J GDP2004
rename K GDP2005
rename L GDP2006
rename M GDP2007
rename N GDP2008
rename O GDP2009
rename P GDP2010
rename Q GDP2011
rename R GDP2012
rename S GDP2013
rename T GDP2014
rename U GDP2015
rename V GDP2016
rename W GDP2017
rename X GDP2018
rename Y GDP2019
rename Z GDP2020
rename AA GDP2021



reshape long GDP,i(城市) j(year)
rename GDP GDP2

save "C:\Users\Cryst\Desktop\selling daughter\weather and income\地级市GDP第二产业面板数据.dta",replace
