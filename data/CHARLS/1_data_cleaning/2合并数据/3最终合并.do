****合并(降水和charls)***
clear
cd "C:\Users\Cryst\Desktop\selling daughter\weather"
use 降水量_update

merge m:m 城市 year using "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\2合并数据\child数据_update.dta"
keep if _merge==3
drop _merge

sort CID ID householdID communityID 城市 省份 year
order CID ID householdID communityID 城市 省份 year shock abs_shock mar_age gender cb054, first



*****reg*****

///面板
destring CID, replace force
xtset CID year
gen labs_shock=ln(abs_shock)

replace bc001=0 if bc001==2
 
reghdfe mar_sta labs_shock zbd001, absorb(communityID child_marry_year)
reghdfe mar_sta labs_shock zbd001, absorb(城市 child_marry_year)
reghdfe mar_sta labs_shock zbd001, absorb(communityID)

reghdfe mar_sta labs_shock zbd001 betro_gift, absorb(communityID child_marry_year)