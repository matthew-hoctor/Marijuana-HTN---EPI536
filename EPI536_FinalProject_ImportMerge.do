


**MERGE and create dataset for 2005-2006

*import NHANES file for demographics
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/Demo_D.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/temp_Demo_D.dta"
clear

*import NHANES file for drug use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/DUQ_D.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/temp_DUQ_D.dta"
clear

*import NHANES file for blood pressure
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/BPX_D.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/temp_BPX_D.dta"
clear

*import NHANES file for alcohol use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/ALQ_D.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/temp_ALQ_D.dta"
clear

*import NHANES file for smoking
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/SMQ_D.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/temp_SMQ_D.dta"
clear

*import NHANES file for body measures
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/BMX_D.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006/temp_BMX_D.dta"
clear

*MERGE datasets
*Merge all 6 datasets within the same cycle year
cd "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2005-2006"
use "temp_Demo_D.dta", clear

*merge Demo with DUQ
merge 1:1 seqn using "temp_DUQ_D.dta"
drop _merge

*mege DUQ with BPX
merge 1:1 seqn using "temp_BPX_D.dta"
drop _merge

*merge BPX with ALQ
merge 1:1 seqn using "temp_ALQ_D.dta"
drop _merge

*merge ALQ with SMQRTU
merge 1:1 seqn using "temp_SMQ_D.dta"
drop _merge

*merge SMQ with BMX
merge 1:1 seqn using "temp_BMX_D.dta"
drop _merge

keep seqn sddsrvyr ridageyr indfmpir dmdeduc2 ridreth1 alq130 smd650 bmxbmi riagendr bpxdi1 bpxdi2 bpxdi3 bpxdi4 bpxsy1 bpxsy2 bpxsy3 bpxsy4 duq200 duq220q duq230 duq210 duq220u

save "2005-2006.dta", replace
*N=10,348

**MERGE and create dataset for 2007-2008

*import NHANES file for demographics
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/Demo_E.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/temp_Demo_E.dta"
clear

*import NHANES file for drug use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/DUQ_E.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/temp_DUQ_E.dta"
clear

*import NHANES file for blood pressure
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/BPX_E.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/temp_BPX_E.dta"
clear

*import NHANES file for alcohol use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/ALQ_E.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/temp_ALQ_E.dta"
clear

*import NHANES file for smoking
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/SMQ_E.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/temp_SMQ_E.dta"
clear

*import NHANES file for body measures
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/BMX_E.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008/temp_BMX_E.dta"
clear

*MERGE datasets
*Merge all 6 datasets within the same cycle year
cd "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2007-2008"
use "temp_Demo_E.dta", clear

*merge Demo with DUQ
merge 1:1 seqn using "temp_DUQ_E.dta"
drop _merge

*mege DUQ with BPX
merge 1:1 seqn using "temp_BPX_E.dta"
drop _merge

*merge BPX with ALQ
merge 1:1 seqn using "temp_ALQ_E.dta"
drop _merge

*merge ALQ with SMQRTU
merge 1:1 seqn using "temp_SMQ_E.dta"
drop _merge

*merge SMQ with BMX
merge 1:1 seqn using "temp_BMX_E.dta"
drop _merge

keep seqn sddsrvyr ridageyr indfmpir dmdeduc2 ridreth1 alq130 smd650 bmxbmi riagendr bpxdi1 bpxdi2 bpxdi3 bpxdi4 bpxsy1 bpxsy2 bpxsy3 bpxsy4 duq200 duq220q duq230 duq210 duq220u
save "2007-2008.dta", replace
*N=10,149

**MERGE and create dataset for 2009-2010

*import NHANES file for demographics
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/Demo_F.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/temp_Demo_F.dta"
clear

*import NHANES file for drug use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/DUQ_F.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/temp_DUQ_F.dta"
clear

*import NHANES file for blood pressure
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/BPX_F.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/temp_BPX_F.dta"
clear

*import NHANES file for alcohol use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/ALQ_F.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/temp_ALQ_F.dta"
clear

*import NHANES file for smoking
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/SMQ_F.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/temp_SMQ_F.dta"
clear

*import NHANES file for body measures
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/BMX_F.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010/temp_BMX_F.dta"
clear

*MERGE datasets
*Merge all 6 datasets within the same cycle year
cd "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2009-2010"
use "temp_Demo_F.dta", clear

*merge Demo with DUQ
merge 1:1 seqn using "temp_DUQ_F.dta"
drop _merge

*mege DUQ with BPX
merge 1:1 seqn using "temp_BPX_F.dta"
drop _merge

*merge BPX with ALQ
merge 1:1 seqn using "temp_ALQ_F.dta"
drop _merge

*merge ALQ with SMQRTU
merge 1:1 seqn using "temp_SMQ_F.dta"
drop _merge

*merge SMQ with BMX
merge 1:1 seqn using "temp_BMX_F.dta"
drop _merge

keep seqn sddsrvyr ridageyr indfmpir dmdeduc2 ridreth1 alq130 smd650 bmxbmi riagendr bpxdi1 bpxdi2 bpxdi3 bpxdi4 bpxsy1 bpxsy2 bpxsy3 bpxsy4 duq200 duq220q duq230 duq210 duq220u
save "2009-2010.dta", replace
*10,537

**MERGE and create dataset for 2011-2012

*import NHANES file for demographics
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/Demo_G.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/temp_Demo_G.dta"
clear

*import NHANES file for drug use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/DUQ_G.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/temp_DUQ_G.dta"
clear

*import NHANES file for blood pressure
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/BPX_G.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/temp_BPX_G.dta"
clear

*import NHANES file for alcohol use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/ALQ_G.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/temp_ALQ_G.dta"
clear

*import NHANES file for smoking
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/SMQ_G.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/temp_SMQ_G.dta"
clear

*import NHANES file for body measures
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/BMX_G.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012/temp_BMX_G.dta"
clear

*MERGE datasets
*Merge all 6 datasets within the same cycle year
cd "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2011-2012"
use "temp_Demo_G.dta", clear

*merge Demo with DUQ
merge 1:1 seqn using "temp_DUQ_G.dta"
drop _merge

*mege DUQ with BPX
merge 1:1 seqn using "temp_BPX_G.dta"
drop _merge

*merge BPX with ALQ
merge 1:1 seqn using "temp_ALQ_G.dta"
drop _merge

*merge ALQ with SMQ
merge 1:1 seqn using "temp_SMQ_G.dta"
drop _merge

*merge SMQRTU with BMX
merge 1:1 seqn using "temp_BMX_G.dta"
drop _merge

keep seqn sddsrvyr ridageyr indfmpir dmdeduc2 ridreth1 alq130 smd650 bmxbmi riagendr bpxdi1 bpxdi2 bpxdi3 bpxdi4 bpxsy1 bpxsy2 bpxsy3 bpxsy4 duq200 duq220q duq230 duq210 duq220u
save "2011-2012.dta", replace
*N=9,756

**MERGE and create dataset for 2013-2014

*import NHANES file for demographics
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/Demo_H.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/temp_Demo_H.dta"
clear

*import NHANES file for drug use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/DUQ_H.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/temp_DUQ_H.dta"
clear

*import NHANES file for blood pressure
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/BPX_H.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/temp_BPX_H.dta"
clear

*import NHANES file for alcohol use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/ALQ_H.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/temp_ALQ_H.dta"
clear

*import NHANES file for smoking
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/SMQ_H.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/temp_SMQ_H.dta"
clear

*import NHANES file for body measures
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/BMX_H.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014/temp_BMX_H.dta"
clear

*MERGE datasets
*Merge all 6 datasets within the same cycle year
cd "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2013-2014"
use "temp_Demo_H.dta", clear

*merge Demo with DUQ
merge 1:1 seqn using "temp_DUQ_H.dta"
drop _merge

*mege DUQ with BPX
merge 1:1 seqn using "temp_BPX_H.dta"
drop _merge

*merge BPX with ALQ
merge 1:1 seqn using "temp_ALQ_H.dta"
drop _merge

*merge ALQ with SMQ
merge 1:1 seqn using "temp_SMQ_H.dta"
drop _merge

*merge SMQRTU with BMX
merge 1:1 seqn using "temp_BMX_H.dta"
drop _merge

keep seqn sddsrvyr ridageyr indfmpir dmdeduc2 ridreth1 alq130 smd650 bmxbmi riagendr bpxdi1 bpxdi2 bpxdi3 bpxdi4 bpxsy1 bpxsy2 bpxsy3 bpxsy4 duq200 duq220q duq230 duq210 duq220u
save "2013-2014.dta", replace
*N=10,175

**MERGE and create dataset for 2015-2016

*import NHANES file for demographics
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/Demo_I.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/temp_Demo_I.dta"
clear

*import NHANES file for drug use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/DUQ_I.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/temp_DUQ_I.dta"
clear

*import NHANES file for blood pressure
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/BPX_I.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/temp_BPX_I.dta"
clear

*import NHANES file for alcohol use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/ALQ_I.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/temp_ALQ_I.dta"
clear

*import NHANES file for smoking
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/SMQ_I.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/temp_SMQ_I.dta"
clear

*import NHANES file for body measures
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/BMX_I.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016/temp_BMX_I.dta"
clear

*MERGE datasets
*Merge all 6 datasets within the same cycle year
cd "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2015-2016"
use "temp_Demo_I.dta", clear

*merge Demo with DUQ
merge 1:1 seqn using "temp_DUQ_I.dta"
drop _merge

*mege DUQ with BPX
merge 1:1 seqn using "temp_BPX_I.dta"
drop _merge

*merge BPX with ALQ
merge 1:1 seqn using "temp_ALQ_I.dta"
drop _merge

*merge ALQ with SMQ
merge 1:1 seqn using "temp_SMQ_I.dta"
drop _merge

*merge SMQRTU with BMX
merge 1:1 seqn using "temp_BMX_I.dta"
drop _merge

keep seqn sddsrvyr ridageyr indfmpir dmdeduc2 ridreth1 alq130 smd650 bmxbmi riagendr bpxdi1 bpxdi2 bpxdi3 bpxdi4 bpxsy1 bpxsy2 bpxsy3 bpxsy4 duq200 duq220q duq230 duq210 duq220u
save "2015-2016.dta", replace
*N=9,971

**MERGE and create dataset for 2017-2018

*import NHANES file for demographics
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/Demo_J.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/temp_Demo_J.dta"
clear

*import NHANES file for drug use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/DUQ_J.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/temp_DUQ_J.dta"
clear

*import NHANES file for blood pressure
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/BPX_J.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/temp_BPX_J.dta"
clear

*import NHANES file for alcohol use
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/ALQ_J.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/temp_ALQ_J.dta"
clear

*import NHANES file for smoking
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/SMQ_J.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/temp_SMQ_J.dta"
clear

*import NHANES file for body measures
import sasxport5 "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/BMX_J.XPT"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018/temp_BMX_J.dta"
clear

*MERGE datasets
*Merge all 6 datasets within the same cycle year
cd "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/2017-2018"
use "temp_Demo_J.dta", clear

*merge Demo with DUQ
merge 1:1 seqn using "temp_DUQ_J.dta"
drop _merge

*mege DUQ with BPX
merge 1:1 seqn using "temp_BPX_J.dta"
drop _merge

*merge BPX with ALQ
merge 1:1 seqn using "temp_ALQ_J.dta"
drop _merge

*merge ALQ with SMQ
merge 1:1 seqn using "temp_SMQ_J.dta"
drop _merge

*merge SMQRTU with BMX
merge 1:1 seqn using "temp_BMX_J.dta"
drop _merge

keep seqn sddsrvyr ridageyr indfmpir dmdeduc2 ridreth1 alq130 smd650 bmxbmi riagendr bpxdi1 bpxdi2 bpxdi3 bpxdi4 bpxsy1 bpxsy2 bpxsy3 bpxsy4 duq200 duq220q duq230 duq210 duq220u
save "2017-2018.dta", replace
*N=9,254

*APPENDING cycles
cd "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/Temp"
use "2005-2006.dta", clear
append using "2007-2008.dta" "2009-2010.dta" "2011-2012.dta" "2013-2014.dta" "2015-2016.dta" "2017-2018.dta"

save "NHANESfull.dta", replace
N=70,190

*MERGE full dataset with the healthy eating index dataset
use "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/Temp/NHANESfull.dta"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/Temp/NHANES_HEI_FULL.dta"
merge 1:1 seqn using "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/Temp/HEI2015R_00518.dta"
drop _merge
duplicates report seqn
save, replace

*Drop 2005-2006 cycle  N=10,348
use "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/Temp/NHANES_HEI_FULL.dta"
save "/Users/blang/Documents/OHSU:PSU/2021 Summer/EPI 536/NHANES/Temp/NHANES_HEI_0718.dta"
drop if sddsrvyr==4
save, replace
*N=59,842



