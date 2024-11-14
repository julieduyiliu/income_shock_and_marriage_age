clear  
cd "C:\Users\Cryst\Desktop\selling daughter\weather and income\"


import excel "C:\Users\Cryst\Desktop\selling daughter\weather and income\1999-2021地级市GDP及一二三产业GDP.xlsx", sheet("地级市GDP") firstrow allstring clear

rename E GDP1991
rename F GDP1992
rename G GDP1993
rename H GDP1994
rename I GDP1995
rename J GDP1996
rename K GDP1997
rename L GDP1998
rename M GDP1999
rename N GDP2000
rename O GDP2001
rename P GDP2002
rename Q GDP2003
rename R GDP2004
rename S GDP2005
rename T GDP2006
rename U GDP2007
rename V GDP2008
rename W GDP2009
rename X GDP2010
rename Y GDP2011
rename Z GDP2012
rename AA GDP2013
rename AB GDP2014
rename AC GDP2015
rename AD GDP2016
rename AE GDP2017
rename AF GDP2018
rename AG GDP2019
rename AH GDP2020
rename 地级市 城市
reshape long GDP,i(城市) j(year)

save "C:\Users\Cryst\Desktop\selling daughter\weather and income\地级市GDP面板数据.dta", replace

merge m:m 城市  year using "C:\Users\Cryst\Desktop\selling daughter\weather and income\降水数据.dta"
keep if _merge==3
drop _merge


///跑结果
replace shock=0 if shock>=0
replace shock=(-shock)*(1/10) if shock<0

merge m:m 城市 using "C:\Users\Cryst\Desktop\selling daughter\weather and income\城市id.dta"
keep if _merge==3
drop _merge
xtset cityid year

cd "C:\Users\Cryst\Desktop\selling daughter\weather and income\"
destring GDP, replace force
reghdfe GDP l3.shock l2.shock l1.shock shock,absorb(城市)
outreg2 using shockandgdp.doc, replace tstat bdec(3) tdec(2) addtext(Location FE, YES)

destring GDP1, replace force
reghdfe GDP1 l3.shock l2.shock l1.shock shock,absorb(城市)
outreg2 using shockandgdp.doc, append tstat bdec(3) tdec(2) addtext(Location FE, YES)

destring GDP2, replace force
reghdfe GDP2 l3.shock l2.shock l1.shock shock,absorb(城市)
outreg2 using shockandgdp.doc, append tstat bdec(3) tdec(2) addtext(Location FE, YES)

destring GDP3, replace force
reghdfe GDP3 l3.shock l2.shock l1.shock shock,absorb(城市)
outreg2 using shockandgdp.doc, append tstat bdec(3) tdec(2) addtext(Location FE, YES)

/*
use "C:\Users\Cryst\Desktop\selling daughter\weather\PSU_update.dta"
merge m:m communityID using "D:\a JNU\RA\LEE-劳动&气候2\H_CHARLS_D_Data.dta"
drop _merge

keep hh1itot hh2itot hh3itot h1rural h2rural h3rural communityID 省份 城市 ID householdID

rename hh1itot income2011
rename hh2itot income2013
rename hh3itot income2015

gen id = _n
reshape long income,i(ID) j(year)


merge m:m 城市 year using "C:\Users\Cryst\Desktop\selling daughter\weather\降水量_update.dta"
drop if _merge==1
drop _merge

save "C:\Users\Cryst\Desktop\selling daughter\weather and income\气候与收入面板数据.dta", replace


///跑结果
replace shock=0 if shock>=0
replace shock=(-shock)*(1/10) if shock<0

duplicates drop id year, force
xtset id year
reghdfe income shock,absorb(省份)
*/