///merge with child data
****transfer&children*****
clear
cd "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\1长宽数据、初步清理\"
use 2013_family_transfer.dta

merge m:m ID childID using "C:\Users\Cryst\Desktop\selling daughter\CHARLS\0原始数据\2013 wave\CHARLS2013_Dataset\4Child.dta"
keep if _merge==3
drop _merge


*****生成适合回归的变量generate variables for regression*****
gen mar_age=child_marry_year-cb051_1
drop if child_marry_year<1979


****transfer&demogra*****
merge m:m ID using "C:\Users\Cryst\Desktop\selling daughter\CHARLS\0原始数据\2013 wave\CHARLS2013_Dataset\1Demographic_Background.dta", keepusing(zbc001 zbc005 zbd001 bc001 bd011 be001)
keep if _merge==3
drop _merge

******merge with work data*****
merge m:m ID using "C:\Users\Cryst\Desktop\selling daughter\CHARLS\0原始数据\2013 wave\CHARLS2013_Dataset\9Work_Retirement_and_Pension.dta", keepusing(fa001 fb002 fb003 fb004 fb005 fb006 fc003 fc020 fc021 fd004)
keep if _merge==3
drop _merge

*****merge with household income data****
merge m:m ID using "C:\Users\Cryst\Desktop\selling daughter\CHARLS\0原始数据\2013 wave\CHARLS2013_Dataset\10Household_Income.dta", keepusing(gb003 gb005_1 gb005_2 gb005_3)
keep if _merge==3
drop _merge

///save
save "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\2合并数据\child数据.dta",replace


