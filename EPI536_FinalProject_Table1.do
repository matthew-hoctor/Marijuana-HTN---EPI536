***************************************************************
***P3: Table 1 Calculations
***Authors: Bryon Langford and Matthew Hoctor
***Code current as of 2021-07-12
***************************************************************


* Survey Weight Calculation
gen wtmec12yr = (1/7) * wtmec2yr
svyset sdmvpsu [pw=wtmec12yr], strata(sdmvstra)

* Prevalence of outcome (BP)
svy, subpop(if include==1): ta BP_cat, ci col percent

** By gender
svy, subpop(if include==1): ta BP_cat riagendr, ci col percent
svy, subpop(if include==1): ta BP_cat riagendr, ci row percent

* Table 1 Elements (calculate frequencies, proportions, means, standard errors when appropriate)

** Main exposure (Marijuana Use)
ta MJ_cat if include==1

*Covariates

** Sex
svy, subpop(if include==1): ta riagendr MJ_cat, col percent
ta riagendr MJ_cat if include==1
*** Missing Sex
ta riagendr MJ_cat if include==1,m

** Race/Ethnicity
svy, subpop(if include==1): ta race_eth MJ_cat, col percent
ta race_eth MJ_cat if include==1,m

** Education Level
*recode dmdeduc2 1=1 2=2 3=3 4=4 5=5 7=. 9=., gen(EDUC_cat)
*label define EDUC_cat 1 "Less than 9th Grade" 2 "Less than High School" 3 "High School/GED" 4 "Some College" 5 "College Graduate"
*label values EDUC_cat EDUC_cat
*label variable include "Recode Education Level"

svy, subpop(if include==1): ta EDUC_cat MJ_cat, col percent
ta EDUC_cat MJ_cat if include==1,m

** Smoking
svy, subpop(if include==1): ta SMK_cat MJ_cat, col percent
ta SMK_cat MJ_cat if include==1,m

** Alcohol
svy, subpop(if include==1): ta AL_cat MJ_cat, col percent
ta AL_cat MJ_cat if include==1,m

** Age (Mean)
svy, subpop(if include==1): mean ridageyr, over(MJ_cat)
ta ridageyr MJ_cat if include==1,m

** BMI (Mean)
svy, subpop(if include==1): mean bmxbmi, over(MJ_cat)

** Family Income Poverty Ratio (Mean)
svy, subpop(if include==1): mean indfmpir, over(MJ_cat)
ta indfmpir MJ_cat if include==1,m

** Healthy Eating Index (Mean)
svy, subpop(if include==1): mean hei2015_total_score, over(MJ_cat)







