****merge precipitation data and child data***
clear
cd "C:\Users\Cryst\Desktop\selling daughter\weather"
use 降水量_update
///rename year child_marry_year
merge m:m 城市 year using "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\2合并数据\child数据_update.dta"
keep if _merge==3
drop _merge
/*
sort CID ID householdID communityID 城市 省份 year
order CID ID householdID communityID 城市 省份 year shock abs_shock mar_age gender cb054, first

*/

*****reg*****

///generate panel data
destring CID, replace force
xtset CID year
gen labs_shock=ln(abs_shock*10)
gen ingb=betro_gift*gender
replace shock=0 if shock>=0
replace shock=(-shock)*(1/10) if shock<0


save "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\3finalreg\final.dta", replace





