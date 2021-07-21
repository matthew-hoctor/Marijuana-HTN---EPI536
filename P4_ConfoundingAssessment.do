***************************************************************
***EpiData: P4: Confounding Assessment
***Author: Bryon Langford & Matthew Hoctor
***Code current as of 2021-07-21
***************************************************************

* Survey Weight Calculation (2005-2018)
gen wtmec14yr = (1/7) * wtmec2yr
svyset sdmvpsu [pw=wtmec14yr], strata(sdmvstra)

* SELECTION

** Crude relationship
xi: svy,subpop(if include==1): logit BP_cat i.MJ,or

* Add Potential Confounders One At a Time

** Age
xi: svy,subpop(if include==1): logit BP_cat i.MJ ridageyr, or

** BMI
xi: svy,subpop(if include==1): logit BP_cat i.MJ bmxbmi, or

** Poverty Income Ratio
xi: svy,subpop(if include==1): logit BP_cat i.MJ indfmpir, or

** Total HEI-2015 Score
xi: svy,subpop(if include==1): logit BP_cat i.MJ hei2015_total_score, or

** Sex
xi: svy,subpop(if include==1): logit BP_cat i.MJ i.riagendr, or

** Race/Ethnicity
xi: svy,subpop(if include==1): logit BP_cat i.MJ i.race_eth, or

** Education Level
xi: svy,subpop(if include==1): logit BP_cat i.MJ i.EDUC_cat, or

** Current Tobacco Use
xi: svy,subpop(if include==1): logit BP_cat i.MJ i.SMK_cat, or

** Alcohol Intake
xi: svy,subpop(if include==1): logit BP_cat i.MJ i.AL_cat, or

