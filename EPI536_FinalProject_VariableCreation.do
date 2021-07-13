
*Meets age criteria
su ridageyr
recode ridageyr min/19=0 20/69=1 70/max=0, gen (age_instudy)
bysort age_instudy: su ridageyr
ta age_instudy

*Create a new race/ethnicity variable
ta ridreth1
recode ridreth1 1=3 2=4 3=1 4=2 5=4, gen(race_eth)

label define race_eth 1 "White-NH" 2 "Black_NH" 3 "Mex Am" 4 "Oth"
label values race_eth race_eth
ta race_eth

ta ridreth1 race_eth,m

*Education variable
ta dmdeduc2

*Tobacco Use Categories

**Current Tobacco Use
ta smq020
ta smq040
ta smd650
	
recode smq020 1=1 2=0 7=. 9=., gen(SMK_cat)
	replace SMK_cat=2 if smd650 < 777
	
label define SMK_cat 0 "Never Use" 1 " Past Use" 2 "Current Use"
label values SMK_cat SMK_cat
label variable SMK_cat "Tobacco Use Category"
ta SMK_cat

ta SMK_cat smq020, m

**Tobacco Frequency Categories
recode smd650 min/10=0 11/20=1 21/95=2 96/max=., gen(SMK_freq)

label define SMK_freq 0 "1-10 cigs" 1 "11-20 cigs" 2 "21+ cigs"
label values SMK_freq SMK_freq
label variable SMK_freq "Tobacco Use Frequency In the Past 30 days"
ta SMK_freq

*Body Mass Index
su bmxbmi

gen BMI_cat = .
replace BMI_cat = 1 if bmxbmi <25
replace BMI_cat = 2 if bmxbmi >=25 & bmxbmi < 30
replace BMI_cat = 3 if bmxbmi >=30 & bmxbmi <.

label define BMI_cat 1 "Normal Weight" 2 "Overweight" 3 "Obese"
label values BMI_cat BMI_cat

ta BMI_cat

*Alcohol Intake
ta alq101
ta alq110
ta alq111
ta alq120q
ta alq121
ta alq130

