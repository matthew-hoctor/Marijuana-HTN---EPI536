
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

*Current Tobacco Use (not sure how to calculate)
su smd650
recode smd650








*Body Mass Index
su bmxbmi

gen bmic = .
replace bmic = 1 if bmxbmi <25
replace bmic = 2 if bmxbmi >=25 & bmxbmi < 30
replace bmic = 3 if bmxbmi >=30 & bmxbmi <.

label define bmic 1 "Normal Weight" 2 "Overweight" 3 "Obese"
label values bmic bmic

ta bmic

*Marijuana Use
ta duq200,m

gen marijuana_use = .

**Never users, N=9,664
replace marijuana_use =3 if duq200==2

**Past Users, N=7,684
replace marijuana_use =2 if duq200==1 & duq220u==1 & duq220q >=30 & duq220q <.
replace marijuana_use =2 if duq200==1 & duq220u==2 & duq220q >=4 & duq220q <.
replace marijuana_use =2 if duq200==1 & duq220u==3 & duq220q >=1 & duq220q <.
replace marijuana_use =2 if duq200==1 & duq220u==4 & duq220q >=1 & duq220q <.

ta marijuana_use duq200, m

**Current Users, N=3,186
replace marijuana_use =1 if duq200==1 & duq230 >=1 & duq230 <.

*Frequency of Marijuana Use
gen marijuana_use_freq =.

**Light, N=1,660
replace marijuana_use_freq =1 if duq200==1 & duq230 <10

**Moderate, N=553
replace marijuana_use_freq =2 if duq200==1 & duq230 >=10 & duq230 <=20

**Heavy, N=973
replace marijuana_use_freq =3 if duq200==1 & duq230 >20 & duq230 <.

ta marijuana_use_freq


















drop marijuana_use





********************************
***School meal coding
***Video clip will demo school lunch code

***School breakfast
*applies same logic as school lunch
ta dbq421,m
*no missing codes
gen school_bkfst=dbq421
ta school_bkfst,m

*not attend k-12 (dbq360==2; n=472)
ta dbq360,m
replace school_bkfst=4 if dbq360==2
ta school_bkfst dbq360, m
*no breakfast served (n=408)
ta dbq400, m
replace school_bkfst=4 if dbq400==2
ta school_bkfst dbq400, m
*school breakfast frequency=0 (n=911)
ta dbd411, m
replace school_bkfst=4 if dbd411==0
ta school_bkfst dbd411, m

*check variable
ta school_bkfst,m
*n=1,791 in category 4; matches 472+408+911
ta dbq421 school_bkfst,m

*binary school breakfast variable
recode school_bkfst 1=1 2=1 3=0 4=0,gen(school_bkfst01)
ta school_bkfst school_bkfst01,m




drop bmic
label drop bmic
