****数据清洗******

clear
use "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\2合并数据\child数据.dta"

drop if mar_age<7

replace gender=0 if gender==2
replace betro_gift=0 if betro_gift==2
gen ln_mage=ln(mar_age)
order childID ID householdID communityID 城市 省份 mar_age ln_mage gender cb054, first



****构造所需数据******
///新建childid
gen ChildID="01" if childID==1
replace ChildID="02" if childID==2
replace ChildID="03" if childID==3
replace ChildID="04" if childID==4
replace ChildID="05" if childID==5
replace ChildID="06" if childID==6
replace ChildID="07" if childID==7
replace ChildID="08" if childID==8
replace ChildID="09" if childID==9
replace ChildID="10" if childID==10
replace ChildID="11" if childID==11

order ChildID, first

gen CID=ID+ChildID

order CID, first




///筛选需要的数据
drop if mar_age==.
drop if mar_age<10
drop if mar_age>20&gender==0
keep if gender==0


///构造婚姻状况
gen xage10=.
gen xage11=.
gen xage12=.
gen xage13=.
gen xage14=.
gen xage15=.
gen xage16=.
gen xage17=.
gen xage18=.
gen xage19=.
gen xage20=.

reshape long xage, i(CID) j(z_age)
drop xage
gen year=cb051_1+z_age
drop if z_age>mar_age
gen mar_sta=1 if z_age==mar_age

order CID childID ID householdID communityID 城市 省份 mar_age ln_mage gender cb054 year z_age mar_sta, first
replace mar_sta=0 if mar_sta==.

save "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\2合并数据\child数据_update.dta", replace

*****