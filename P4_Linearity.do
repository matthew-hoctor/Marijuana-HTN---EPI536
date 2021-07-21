***************************************************************
***EpiData: P4: Linearity
***Author: Bryon Langford & Matthew Hoctor
***Code current as of 2021-07-21
***************************************************************

* Survey Weight Calculation (2005-2018)
gen wtmec14yr = (1/7) * wtmec2yr
svyset sdmvpsu [pw=wtmec14yr], strata(sdmvstra)


* Test Linearity of Age

** 1a Create quintiles
xtile age_q5=ridageyr [aweight=wtmec14yr] if include==1,nq(5)
**Report medians of quintiles
bysort age_q5: tabstat ridageyr,stat(min max p50)

**1b: Run model with age quintiles
xi: svy,subpop(if include==1): logit BP_cat i.age_q5
**1c: Run model with linear age
xi: svy,subpop(if include==1): logit BP_cat ridageyr

*** Approximately linear


* Test Linearity of BMI

** 1a Create quintiles
xtile bmi_q5=bmxbmi [aweight=wtmec14yr] if include==1,nq(5)
**Report medians of quintiles
bysort bmi_q5: tabstat bmxbmi,stat(min max p50)

**1b: Run model with BMI quintiles
xi: svy,subpop(if include==1): logit BP_cat i.bmi_q5
**1c: Run model with linear age
xi: svy,subpop(if include==1): logit BP_cat bmxbmi

**1d: Test higher order terms
**Created centered variable on the mean for the whole study population
svy,subpop(include): mean bmxbmi
**mean bmi: 28.99249
gen bmic=bmxbmi-28.99249

**Create higher order terms
gen bmic_sq=bmic^2
gen bmic_cb=bmic^3
**Verify that n's and descriptive stats are as expected
su bmxbmi bmic bmic_sq bmic_cb if include==1

**Run model with linear, quadratic, and cubic terms
xi: svy,subpop(if include==1): logit BP_cat bmic bmic_sq bmic_cb

**Run model, dropping cubic term
xi: svy,subpop(if subpop2==1 & male==1 & foodinsec==0): logit wccata agec agec_sq



* Test Linearity of Poverty-Income Ratio

** 1a Create quintiles
xtile pir_q5=indfmpir [aweight=wtmec14yr] if include==1,nq(5)
**Report medians of quintiles
bysort pir_q5: tabstat indfmpir,stat(min max p50)

**1b: Run model with PIR quintiles
xi: svy,subpop(if include==1): logit BP_cat i.pir_q5
**1c: Run model with linear PIR
xi: svy,subpop(if include==1): logit BP_cat indfmpir

**1d: Test higher order terms
**Created centered variable on the mean for the whole study population
svy,subpop(include): mean indfmpir
**mean pir: 3.03458
gen pirc=indfmpir-3.03458

**Create higher order terms
gen pirc_sq=bmic^2
gen pirc_cb=bmic^3
**Verify that n's and descriptive stats are as expected
su indfmpir pirc pirc_sq pirc_cb if include==1

**Run model with linear, quadratic, and cubic terms
xi: svy,subpop(if include==1): logit BP_cat pirc pirc_sq pirc_cb


* Test Linearity of Total HEI-2015 Score

** 1a Create quintiles
xtile hei_q5=hei2015_total_score [aweight=wtmec14yr] if include==1,nq(5)
**Report medians of quintiles
bysort hei_q5: tabstat hei2015_total_score,stat(min max p50)

**1b: Run model with PIR quintiles
xi: svy,subpop(if include==1): logit BP_cat i.hei_q5
**1c: Run model with linear PIR
xi: svy,subpop(if include==1): logit BP_cat hei2015_total_score

**1d: Test higher order terms
*Created centered variable on the mean for the whole study population
svy,subpop(include): mean hei2015_total_score
*mean hei-2015 score: 51.9808
gen heic=ridageyr-51.9808

*Create higher order terms
gen heic_sq=agec^2
gen heic_cb=agec^3
*Verify that n's and descriptive stats are as expected
su hei2015_total_score heic heic_sq heic_cb if include==1

*Run model with linear, quadratic, and cubic terms
xi: svy,subpop(if include==1): logit BP_cat heic heic_sq heic_cb
*Run model, dropping cubic term
xi: svy,subpop(if include==1): logit BP_cat heic heic_sq





