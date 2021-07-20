***************************************************************
***E10: Descriptive Analysis
***Author: Bryon Langford & Matthew Hoctor
***Code current as of 2021-07-19
***************************************************************

* Survey Weight Calculation (2005-2018)
gen wtmec14yr = (1/7) * wtmec2yr
svyset sdmvpsu [pw=wtmec14yr], strata(sdmvstra)

***************************************************************

* Descriptive Assessment: Univariable Analysis

** 1. Examine exposure: Marijuana Use
ta MJ if include==1

** 2. Examine outcome: Hypertension status
ta BP_cat if include==1

** 3. Examine distributions of other independent variables


*** Age

**** Count, min/max
su ridageyr if include==1
* n= 21,020; Min=20; Max=59

**** Mean (SE)
svy, subpop(if include==1): mean ridageyr
* Mean=39.54 (0.16)

**** Percentiles
tabstat ridageyr [aweight=wtmec14yr] if include==1,stat(p50 p10 p90) col(stat)
* P50=40; P10=23; P90=55

**** Skewness
sktest ridageyr [aweight=wtmec14yr] if include==1
* Skewness=0.0970; Kurtosis=0.00

**** Histogram and boxplot
hist ridageyr if include==1, norm
graph box ridageyr if include==1
* Age distribution approximately normal with no outliers


*** Body Mass Index

**** Count, min/max
su bmxbmi if include==1
* n= 20,931; Min=13.6; Max=77.5

**** Mean (SE)
svy, subpop(if include==1): mean bmxbmi
* Mean=28.99 (0.10)

**** Percentiles
tabstat bmxbmi [aweight=wtmec14yr] if include==1,stat(p50 p10 p90) col(stat)
* P50=27.80; P10=21.40; P90=38.10

**** Skewness
sktest bmxbmi [aweight=wtmec14yr] if include==1
* Skewness=0.00; Kurtosis=0.00

**** Histogram and boxplot
hist bmxbmi if include==1,norm
graph box bmxbmi if include==1
* Distribution skewed to the right wih many positive outliers

**** Outliers (arbitruary cut-off point)
list bmxbmi ridageyr bmxwt bmxht indfmpir hei2015_total_score if bmxbmi >50 & bmxbmi~=. & ///
include==1


*** Poverty-Income Ratio

**** Count, min/max
su indfmpir if include==1
* n= 19,446; Min=0; Max=5

**** Mean (SE)
svy, subpop(if include==1): mean indfmpir
* mean= 3.03 (0.04)

**** Percentiles
tabstat indfmpir [aweight=wtmec14yr] if include==1,stat(p50 p10 p90) col(stat)
*P50=3.11; P10=0.77; P90=5

**** Skewness
sktest indfmpir [aweight=wtmec14yr] if include==1
* Skewness=0.00

**** Histogram and boxplot
hist indfmpir if include==1,norm
graph box indfmpir if include==1


*** Total HEI-2015 score

**** Count, min/max
su hei2015_total_score if include==1
* n= 20,472; Min=10; Max=98.75

**** Mean (SE)
svy, subpop(if include==1): mean hei2015_total_score
* mean= 51.98 (0.22)

**** Percentiles
tabstat hei2015_total_score [aweight=wtmec14yr] if include==1,stat(p50 p10 p90) col(stat)
* P50=51.06; P10=35.19; P90=70.06

**** Skewness
sktest hei2015_total_score [aweight=wtmec14yr] if include==1
* Skewness=0.00; Kurtosis=0.00

**** Histogram and boxplot
hist hei2015_total_score if include==1,norm
graph box hei2015_total_score if include==1
* Distribution is approximately normal with several positive and negative outliers

**** Outliers (arbituary cut-off points)
list bmxbmi ridageyr bmxwt bmxht indfmpir hei2015_total_score if hei2015_total_score <20 & ///
include==1

list bmxbmi ridageyr bmxwt bmxht indfmpir hei2015_total_score if hei2015_total_score >90 & hei2015_total_score~=. & ///
include==1 


*** Sex
ta riagendr if include==1
* male= 10,341; female= 10,679


*** Race/Ethnicity
ta race_eth if include==1
* White-NH= 8,395; Black-NH= 4,494; Mex Am= 3,609; Other= 4,522


*** Education Level
ta EDUC_cat if include==1
* Less than 9th grade=1,442; Less than high school=2,910; High school/GED=4,738; Some college=6,754; College grad=5,168


*** Current Tobacco Use
ta SMK_cat if include==1
* Never=12,159; Past smoker=3,665; Light= 3,121; Moderate= 1,566; Heavy= 458


*** Alcohol Intake
ta AL_cat if include==1
*None-light=9,828; Moderate=5,658; Heavy=3,427

***************************************************************

* Descriptive Assessment: Bivariable Analysis

** 1. Cross-tabulate categorical indpendent variables with dependent categorical variable, hypertension status

*** Marijuana use X Hypertension status
ta MJ BP_cat if include==1
* Sufficient cell sizes. Intersection of 11-20 times and stage 2 hypertension is relatively small (44). 

*** Sex X Hypertension status
ta riagendr BP_cat if include==1
* Sufficient cell sizes

*** Race/Ethnicity X Hypertension status
ta race_eth BP_cat if include==1
* Sufficient cell sizes

*** Education level X Hypertension status
ta EDUC_cat BP_cat if include==1
* Sufficient cell sizes

*** Current Tobacco Use X Hypertension status
ta SMK_cat BP_cat if include==1
* Sufficient cell sizes

*** Alcohol intake X Hypertension status
ta AL_cat BP_cat if include==1
* Sufficient cell sizes


** 2. Calculate 10th and 90th percentile values of continuous independent variables within each category of the hypertension status

*** Age
tabstat ridageyr if include==1, stat (n p50 p10 p90) col(stat) by(BP_cat)
* Distribution of age between blood pressure categories are similar. Normal blood pressure shifted to the left and stege 2 shifted to the right.

*** Body Mass Index
tabstat bmxbmi if include==1, stat (n p50 p10 p90) col(stat) by(BP_cat)
* Distribution of BMI between blood pressure categories are similar

*** Poverty-Income Ratio
tabstat indfmpir if include==1, stat (n p50 p10 p90) col(stat) by(BP_cat)
* Distribution of PIR between blood pressure categories are similar

*** Total HEI-2015 Score
tabstat hei2015_total_score if include==1, stat (n p50 p10 p90) col(stat) by(BP_cat)
* Distribution of Total HEI-2015 Score between blood pressure categories are similar


** 3. Cross-tabulate example categorical independent variables with the exposure variable, marijuana use

*** Sex X Marijuana use
ta riagendr MJ if include==1
* Sufficient cell sizes

*** Race/Ethnicity X Marijuana use
ta race_eth MJ if include==1
* Insufficient cell sizes. Intersection of Mexican American and 11-20 times.

*** Education level X  Marijuana use
ta EDUC_cat MJ if include==1
* Insufficient cell sizes. Intersection of less than 9th grade and 11-20 times and less than 9th grade and 21-30 times.

*** Current Tobacco use X Marijuana use
ta SMK_cat MJ if include==1
* Insufficient cell sizes. Intersection of Heavy and 11-20 times.

*** Alcohol intake X Marijuana use
ta AL_cat MJ if include==1
* Sufficient cell sizes.


** 4. Calculate 10th and 90th percentile values of continuous independent variables within each category of the exposure (Marijuana use)

*** Age
tabstat ridageyr if include==1, stat (n p50 p10 p90) col(stat) by(MJ)
* Distributions of current users shifted to the left.

*** Body Mass Index
tabstat bmxbmi if include==1, stat (n p50 p10 p90) col(stat) by(MJ)
* Distribution of BMI between marijuana use categories are similar

*** Poverty-Income Ratio
tabstat indfmpir if include==1, stat (n p50 p10 p90) col(stat) by(MJ)
* Distributions of current users shifted to the left.

*** Total HEI-2015 Score
tabstat hei2015_total_score if include==1, stat (n p50 p10 p90) col(stat) by(MJ)
* Distribution of never users shifted to the right
