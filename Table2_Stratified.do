***************************************************************
***P3: Table 2 Calculations
***Authors: Bryon Langford and Matthew Hoctor
***Code current as of 2021-08-09
***************************************************************


* Survey Weight Calculation (2005-2018)
gen wtmec14yr = (1/7) * wtmec2yr
svyset sdmvpsu [pw=wtmec14yr], strata(sdmvstra)


* Prevalence of outcome (BP) by MJ category
svy, subpop(if include==1): ta BP_cat MJ_cat, ci col percent
svy, subpop(if include==1): ta BP_abn MJ_cat, ci col percent

ta BP_cat MJ_cat if include==1,m
ta BP_abn MJ_cat if include==1,m

* Prevalence of outcome by gender

** Male
svy, subpop(if include==1 & riagendr==1): ta BP_cat MJ_cat, ci col percent
svy, subpop(if include==1 & riagendr==1): ta BP_abn MJ_cat, ci col percent

ta BP_cat MJ_cat if include==1 & riagendr==1,m
ta BP_abn MJ_cat if include==1 & riagendr==1,m


** Female
svy, subpop(if include==1 & riagendr==2): ta BP_cat MJ_cat, ci col percent
svy, subpop(if include==1 & riagendr==2): ta BP_abn MJ_cat, ci col percent

ta BP_cat MJ_cat if include==1 & riagendr==2,m
ta BP_abn MJ_cat if include==1 & riagendr==2,m




recode BP_cat 0=0 1=1 2=1 3=1 .=., gen(BP_abn)

label define BP_abn 0 "Normal BP" 1 "Abnormal BP"
label values BP_abn BP_abn
label variable BP_abn "Abnormal/Normal BP"

ta BP_abn




