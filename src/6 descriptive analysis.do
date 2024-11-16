///descriptive analysis for girls
clear

cd "C:\Users\Cryst\Desktop\selling daughter\CHARLS\1数据整理\4描述性统计&results"
use summarystatisticsdata
**********generate percentage
***marriage age
tab mar_age
gen mar_b20=1 if mar_age<20
replace mar_b20=0 if mar_b20==.
tab mar_b20

gen mar_b24=1 if mar_age<=24
replace mar_b24=0 if mar_b24==.
tab mar_b24

****parents job
/*gen farmer=1 if fb002==6
replace farmer=0 if farmer==.
tab farmer*/

********demographic
/*bysort 省份: sum gift_mave
tab gift_mave
*/
*****BP=10000是分界线


****full sample
sum mar_b20 mar_b24 gift_mave gift_fave 
sum mar_b20 mar_b24 gift_mave gift_fave if gift_mave>10000
sum mar_b20 mar_b24 gift_mave gift_fave if gift_mave<=10000


*****outreg
outreg2 using 描述性统计1.doc, replace sum(log) keep(mar_b20 mar_b24 gift_mave gift_fave) title(Decriptive Statistics)

outreg2 using 描述性统计2.doc if gift_mave>10000, replace sum(log) keep(mar_b20 mar_b24 gift_mave gift_fave) title(Decriptive Statistics(High BP)) 

outreg2 using 描述性统计3.doc if gift_mave<10000, replace sum(log) keep(mar_b20 mar_b24 gift_mave gift_fave) title(Decriptive Statistics(Lower BP)) 

