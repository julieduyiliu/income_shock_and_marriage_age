clear
use "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\3finalreg\final.dta"
cd "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\4描述性统计&results"

reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0, absorb(cb051_1)
***导出
outreg2 using results.doc, replace tstat bdec(3) tdec(2) addtext(Location FE, NO, Birth Year FE, YES)
///this works!!!!:
reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0, absorb(communityID)

***导出
outreg2 using results.doc, append tstat bdec(3) tdec(2) addtext(Location FE, YES, Birth Year FE, NO)


///this works！！！！
reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0, absorb(communityID cb051_1)
***导出
outreg2 using results.doc, append tstat bdec(3) tdec(2) addtext(Location FE, YES, Birth Year FE, YES)

///分彩礼数值讨论一下，works！！！！！
reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&gift_mave>=10000, absorb(communityID cb051_1)

outreg2 using results2.doc, replace tstat bdec(3) tdec(2) ctitle(BP>50%) addtext(Location FE, YES, Birth Year FE, YES)

reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&gift_mave<10000, absorb(communityID cb051_1)

outreg2 using results2.doc, append tstat bdec(3) tdec(2) ctitle(BP<50%) addtext(Location FE, YES, Birth Year FE, YES)


///异质性分析rural or city
reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&cb054==1, absorb(communityID cb051_1)
outreg2 using h1area.doc, replace tstat bdec(3) tdec(2) ctitle(City)addtext(Location FE, NO, Birth Year FE, YES)

reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&cb054==2, absorb(communityID cb051_1)
outreg2 using h1area.doc, append tstat bdec(3) tdec(2) ctitle(County) addtext(Location FE, YES, Birth Year FE, YES)

reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&cb054==3, absorb(communityID cb051_1)
outreg2 using h1area.doc, append tstat bdec(3) tdec(2) ctitle(Town) addtext(Location FE, YES, Birth Year FE, YES)

reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&cb054==4, absorb(communityID cb051_1)
outreg2 using h1area.doc, append tstat bdec(3) tdec(2) ctitle(Village) addtext(Location FE, YES, Birth Year FE, YES)


///异质性 教育
gen edu=0 if zbd001==1
replace edu=1 if zbd001<=4&zbd001>=2
replace edu=2 if zbd001>=5&zbd001<=7
replace edu=3 if zbd001>=8

reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&edu==0, absorb(communityID cb051_1)
outreg2 using h2edu.doc, replace tstat bdec(3) tdec(2) ctitle(No Formal Education)addtext(Location FE, NO, Birth Year FE, YES)

reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&edu==1, absorb(communityID cb051_1)
outreg2 using h2edu.doc, append tstat bdec(3) tdec(2) ctitle(Elementrary School) addtext(Location FE, YES, Birth Year FE, YES)

reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&edu==2, absorb(communityID cb051_1)
outreg2 using h2edu.doc, append tstat bdec(3) tdec(2) ctitle(Secondary School) addtext(Location FE, YES, Birth Year FE, YES)

reghdfe mar_age l3.shock l2.shock l.shock shock if gender==0&edu==3, absorb(communityID cb051_1)
outreg2 using h2edu.doc, append tstat bdec(3) tdec(2) ctitle(Higher Education) addtext(Location FE, YES, Birth Year FE, YES)
