### Prenatal development of brain structure-function coupling

This repository provides code and data for data analysis in the article entitled "Development of structure and function coupling at birth predicts neurocognitive outcomes at 2 years of age" by Xu et al.,2025.

---

### Data

#### 1. Basic information of multi-modal MRI scans, including age,gender, headmotion parameter and age duration between birth and scan

- infant_info.mat

- behavior.mat

- covariates.mat

> The multi-modal MRI data of all participants are obtained from the Upenn-Chop developmental connectome project (<http://brainmrimap.org/penn-chop-developmental-connectome-data-preterm-and-term.html>). The behavior data includes cognitive and language scores that are obtained with the Bayley Scales of Infant and Toddler Development Ⅲ \[1].
> gender, ‘-1’ and ‘1’ denote female and male, respectively; mFD, mean framewise displacement; age, scan age in days; age_diff, age duration time between birth and scan.

#### 2. JHU neonate parcellation

- JHU_neonate_SS_58_b0space.nii

> Network nodes were obtained by transferring the 58 cortical parcellation from the Johns Hopkins University (JHU) neonate atlas \[2] into each infant’s native dMRI space.

#### 3. Regional structure and function coupling of infants

- sub_coupling.mat

---

### Codes

#### 1. structure-function coupling

- SC-FC_58.m

#### 2. general linear model

- nodal_glm_forbaby.m

- glm_for_baby.m

#### 3.behavior prediction

> The behavior prediction analysis was conducted using an open MATLAB code package : <https://github.com/ZaixuCui/Pattern_Regression_Matlab/tree/master/SVR> \[3]

---

### References

1.  Bayley, N. (2006). Bayley Scales of Infant and Toddler Development– Third Edition. San Antonio, TX: Harcourt Assessment.

2.  Oishi, K., Mori, S., Donohue, P.K., Ernst, T., Anderson, L., Buchthal, S., et al. (2011). Multi-contrast human neonatal brain atlas: application to normal neonate development analysis. _Neuroimage_ 56(1)**,** 8-20. doi: 10.1016/j.neuroimage.2011.01.051.

3.  Cui, Z., and Gong, G. (2018). The effect of machine learning regression algorithms and sample size on individualized behavioral prediction with functional connectivity features. _Neuroimage_ 178, 622-637. doi: 10.1016/j.neuroimage.2018.06.001.
