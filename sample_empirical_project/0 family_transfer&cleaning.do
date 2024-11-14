///transfer from long to short
clear
use "C:\Users\Cryst\Desktop\selling daughter\CHARLS\0原始数据\2013 wave\CHARLS2013_Dataset\6Family_Transfer.dta"

merge m:m communityID using "C:\Users\Cryst\Desktop\selling daughter\weather\PSU_update.dta"
keep if _merge==3
drop _merge
order 城市 省份, after(communityID)


***keep useful variables*******
keep 省份 城市 ID householdID communityID ce066_w2_1_1_ ce066_w2_2_1_ ce066_w2_3_1_ ce066_w2_1_2_ ce066_w2_2_2_ ce066_w2_3_2_ ce066_w2_1_3_ ce066_w2_2_3_ ce066_w2_3_3_ ce066_w2_1_4_ ce066_w2_2_4_ ce066_w2_3_4_ ce066_w2_1_5_ ce066_w2_2_5_ ce066_w2_3_5_ ce066_w2_1_6_ ce066_w2_2_6_ ce066_w2_3_6_ ce066_w2_1_7_ ce066_w2_2_7_ ce066_w2_3_7_ ce066_w2_1_8_ ce066_w2_2_8_ ce066_w2_3_8_ ce066_w2_1_9_ ce066_w2_2_9_ ce066_w2_3_9_ ce066_w2_1_10_ ce066_w2_2_10_ ce066_w2_3_10_ ce066_w2_1_11_ ce066_w2_2_11_ ce066_w2_3_11_ ce067_w2_1_1_ ce067_w2_1_2_ ce067_w2_1_3_ ce067_w2_1_4_ ce067_w2_1_5_ ce067_w2_1_6_ ce067_w2_1_7_ ce067_w2_1_8_ ce067_w2_1_9_ ce067_w2_1_10_ ce067_w2_1_11_ ce068_w2_1_1_ ce068_w2_1_2_ ce068_w2_1_3_ ce068_w2_1_4_ ce068_w2_1_5_ ce068_w2_1_6_ ce068_w2_1_7_ ce068_w2_1_8_ ce068_w2_1_9_ ce068_w2_1_10_ ce068_w2_1_11_ ce069_w2_1_1_ ce069_w2_1_2_ ce069_w2_1_3_ ce069_w2_1_4_ ce069_w2_1_5_ ce069_w2_1_6_ ce069_w2_1_7_ ce069_w2_1_8_ ce069_w2_1_9_ ce069_w2_1_10_ ce069_w2_1_11_ ce070_w2_1_1_ ce070_w2_1_2_ ce070_w2_1_3_ ce070_w2_1_4_ ce070_w2_1_5_ ce070_w2_1_6_ ce070_w2_1_7_ ce070_w2_1_8_ ce070_w2_1_9_ 

***reshape long********
*******rename the variables******
renvarlab ce066_w2_1_1_ ce066_w2_2_1_ ce066_w2_3_1_ ce066_w2_1_2_ ce066_w2_2_2_ ce066_w2_3_2_ ce066_w2_1_3_ ce066_w2_2_3_ ce066_w2_3_3_ ce066_w2_1_4_ ce066_w2_2_4_ ce066_w2_3_4_ ce066_w2_1_5_ ce066_w2_2_5_ ce066_w2_3_5_ ce066_w2_1_6_ ce066_w2_2_6_ ce066_w2_3_6_ ce066_w2_1_7_ ce066_w2_2_7_ ce066_w2_3_7_ ce066_w2_1_8_ ce066_w2_2_8_ ce066_w2_3_8_ ce066_w2_1_9_ ce066_w2_2_9_ ce066_w2_3_9_ ce066_w2_1_10_ ce066_w2_2_10_ ce066_w2_3_10_  ce066_w2_1_11_ ce066_w2_2_11_ ce066_w2_3_11_ ce067_w2_1_1_ ce067_w2_1_2_ ce067_w2_1_3_ ce067_w2_1_4_ ce067_w2_1_5_ ce067_w2_1_6_ ce067_w2_1_7_ ce067_w2_1_8_ ce067_w2_1_9_ ce067_w2_1_10_ ce067_w2_1_11_ ce068_w2_1_1_ ce068_w2_1_2_ ce068_w2_1_3_ ce068_w2_1_4_ ce068_w2_1_5_ ce068_w2_1_6_ ce068_w2_1_7_ ce068_w2_1_8_ ce068_w2_1_9_ ce068_w2_1_10_ ce068_w2_1_11_ ce069_w2_1_1_ ce069_w2_1_2_ ce069_w2_1_3_ ce069_w2_1_4_ ce069_w2_1_5_ ce069_w2_1_6_ ce069_w2_1_7_ ce069_w2_1_8_ ce069_w2_1_9_ ce069_w2_1_10_ ce069_w2_1_11_ ce070_w2_1_1_ ce070_w2_1_2_ ce070_w2_1_3_ ce070_w2_1_4_ ce070_w2_1_5_ ce070_w2_1_6_ ce070_w2_1_7_ ce070_w2_1_8_ ce070_w2_1_9_ ,postdrop(1)

*******reshape******
gen ce070_w2_1_10=. 
gen ce070_w2_1_11=.
reshape long ce066_w2_1_ ce066_w2_2_ ce066_w2_3_ ce067_w2_1_ ce068_w2_1_ ce069_w2_1_ ce070_w2_1_ , i(ID) j(childID)

*******rename the variables******
label variable ce066_w2_1_ "year of child get married"
rename ce066_w2_1_ child_marry_year

label variable ce066_w2_2_ "month of child get married"
rename ce066_w2_2_ child_marry_month

label variable ce066_w2_3_ "day of child get married"
rename ce066_w2_3_ child_marry_day

label variable ce067_w2_1_ "give betrothal gift when child get married"
rename ce067_w2_1_ betro_gift

label variable ce068_w2_1_ "total value of betrothal gift(ten thousand yuan)"
rename ce068_w2_1_ value_betro_gift

label variable ce069_w2_1_ "buy a house for them when child get married"
rename ce069_w2_1_ marry_house

label variable ce070_w2_1_ "total value of house(ten thousand yuan)"
rename ce070_w2_1_ value_marry_house






*****save file******
save "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\长宽数据、合并数据\2013_family_transfer.dta",replace
