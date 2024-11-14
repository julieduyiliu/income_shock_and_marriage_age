///合并合并
clear
cd "C:\Users\Cryst\Desktop\selling daughter\weather"
***PSU******
*****standardize*****
use PSU
rename city 城市
rename province 省份
replace 省份="北京市" if 省份=="北京"
replace 省份="天津市" if 省份=="天津"
replace 省份="广西壮族自治区" if 省份=="广西省"

replace 城市="哈尔滨市" if 城市=="哈尔滨"
replace 城市="襄阳市" if 城市=="襄樊市"
replace 城市="北京市" if 城市=="北京"
replace 城市="天津市" if 城市=="天津"
drop urban_nbs areatype versionID

save PSU_update,replace
***降水量****
*******standardize（最小到城市）*****
use 降水量
replace 城市="上海市" if 省份=="上海市"
replace 城市="北京市" if 省份=="北京市"
replace 城市="天津市" if 省份=="天津市"
replace 城市="重庆市" if 省份=="重庆市"
drop mean_pre lat lon 县区

*******计算城市平均降水量(geo)******
bysort 城市 year: egen precip_ave=mean(precip)
sort 省份 城市 year 

//删除重复值
bysort 省份 城市 year: g n=_n
keep if n==1
drop n

*******计算城市平均降水量(time)******
bysort 城市: egen city_ave=mean(precip)
gen shock=precip_ave-city_ave
gen abs_shock=abs(shock)



///兴安盟巢湖市锡林郭勒盟不要了
drop precip 
save 降水量_update,replace


 

