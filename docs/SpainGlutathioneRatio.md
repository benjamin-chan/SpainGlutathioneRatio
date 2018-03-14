---
title: "Glutathione ratios as the mechanism of action of lipoic acid in progressive multiple sclerosis (PI: Rebecca Spain)"
date: "2018-03-14"
author: Benjamin Chan (chanb@ohsu.edu)
output:
  html_document:
    toc: true
    theme: simplex
---



# Import raw data





Joined data set.
Include only the 

* Study design variables,
* Normalized concentrations, and 
* GSH/GSSG ratios


```
## Classes 'tbl_df', 'tbl' and 'data.frame':	58 obs. of  9 variables:
##  $ sampleID              : num  1 2 3 4 5 6 7 8 9 10 ...
##  $ patientID             : Factor w/ 20 levels "118","119","120",..: 1 1 1 2 2 2 3 3 4 4 ...
##  $ visitMonth            : Factor w/ 3 levels "0","3","12": 1 2 3 1 2 3 1 3 1 3 ...
##  $ studyArm              : Factor w/ 2 levels "LA","Placebo": 1 1 1 2 2 2 2 2 2 2 ...
##  $ normalizedConcGSH     : num  125 101 137 87 171 ...
##  $ normalizedConcGSSG    : num  0.931 0.639 0.828 0.693 1.291 ...
##  $ normalizedConcStdEGSH : num  2.287 2.06 0.0847 0.3121 1.1748 ...
##  $ normalizedConcStdEGSSG: num  0.223 0.17 0.229 0.186 0.352 ...
##  $ normalizedConcRatio   : num  134 158 166 126 132 ...
```




## Clean data

Data check **before cleaning**.


| patientID | hasM0 | hasM3 | hasM12 |
|:---------:|:-----:|:-----:|:------:|
|    120    |   1   |   0   |   1    |
|    122    |   1   |   0   |   1    |
|    134    |   1   |   1   |   2    |
|    143    |   0   |   2   |   0    |

Recode data per Cassidy's email

> From: Cassidy Taylor  
> Sent: Monday, March 12, 2018 3:17 PM  
> To: Benjamin Chan <chanb@ohsu.edu>; Rebecca Spain <spainr@ohsu.edu>  
> Subject: RE: Rebecca Spain Glutathione Study  
> 
> Just heard back from the lab and based on the remaining levels of blood, the
> manifest was incorrectly labeled. It should read
> 
> Sample 44 = 143 M0  
> Sample 45 = 143 M3  
> Sample 46 = 143 M12  



Data check **after cleaning**.
Should return a data frame with only `patientID %in% c(120, 122)`.


| patientID | hasM0 | hasM3 | hasM12 |
|:---------:|:-----:|:-----:|:------:|
|    120    |   1   |   0   |   1    |
|    122    |   1   |   0   |   1    |
# Aim 1


## Normalized GSH:GSSG concentration ratio

![figures/lineplotNormalizedConcRatio.png](figures/lineplotNormalizedConcRatio.png)



Mixed effects model using the **lme4** package.


|term                         | estimate| std.error| statistic|group     |
|:----------------------------|--------:|---------:|---------:|:---------|
|(Intercept)                  |   155.30|      3.84|     40.45|fixed     |
|studyArmPlacebo              |   -20.65|      5.17|     -3.99|fixed     |
|visitMonth3                  |     2.29|      5.12|      0.45|fixed     |
|visitMonth12                 |    12.99|      5.00|      2.60|fixed     |
|studyArmPlacebo:visitMonth3  |    -3.01|      7.09|     -0.42|fixed     |
|studyArmPlacebo:visitMonth12 |   -14.34|      6.91|     -2.07|fixed     |
|sd_(Intercept).patientID     |     3.87|        NA|        NA|patientID |
|sd_Observation.Residual      |    10.86|        NA|        NA|Residual  |

```
## Linear mixed model fit by REML ['lmerMod']
## Formula: normalizedConcRatio ~ studyArm * visitMonth + (1 | patientID)
##    Data: df
## 
## REML criterion at convergence: 414.8
## 
## Scaled residuals: 
##      Min       1Q   Median       3Q      Max 
## -1.79662 -0.61361 -0.06285  0.78467  1.95927 
## 
## Random effects:
##  Groups    Name        Variance Std.Dev.
##  patientID (Intercept)  14.97    3.869  
##  Residual              117.86   10.856  
## Number of obs: 58, groups:  patientID, 20
## 
## Fixed effects:
##                              Estimate Std. Error t value
## (Intercept)                   155.296      3.839   40.45
## studyArmPlacebo               -20.646      5.174   -3.99
## visitMonth3                     2.285      5.118    0.45
## visitMonth12                   12.988      5.001    2.60
## studyArmPlacebo:visitMonth3    -3.010      7.088   -0.42
## studyArmPlacebo:visitMonth12  -14.341      6.914   -2.07
## 
## Correlation of Fixed Effects:
##             (Intr) stdyAP vstMn3 vstM12 sAP:M3
## stdyArmPlcb -0.741                            
## visitMonth3 -0.666  0.495                     
## visitMnth12 -0.690  0.517  0.512              
## stdyArmP:M3  0.481 -0.649 -0.722 -0.369       
## stdyArP:M12  0.499 -0.673 -0.370 -0.726  0.485
```

```
## $patientID
```

![plot of chunk normalizedConcRatio-lme4](figures/normalizedConcRatio-lme4-1.png)
![plot of chunk normalizedConcRatio-lme4](figures/normalizedConcRatio-lme4-2.png)![plot of chunk normalizedConcRatio-lme4](figures/normalizedConcRatio-lme4-3.png)![plot of chunk normalizedConcRatio-lme4](figures/normalizedConcRatio-lme4-4.png)

Mixed effects model using the **nlme** package.


|term                         | estimate| std.error| statistic| p.value|
|:----------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                  |   155.30|      3.84|     40.45|  0.0000|
|studyArmPlacebo              |   -20.65|      5.17|     -3.99|  0.0003|
|visitMonth3                  |     2.29|      5.12|      0.45|  0.6581|
|visitMonth12                 |    12.99|      5.00|      2.60|  0.0139|
|studyArmPlacebo:visitMonth3  |    -3.01|      7.09|     -0.42|  0.6739|
|studyArmPlacebo:visitMonth12 |   -14.34|      6.91|     -2.07|  0.0459|

```
## Linear mixed-effects model fit by REML
##  Data: df 
##        AIC      BIC    logLik
##   434.8007 454.3131 -207.4003
## 
## Random effects:
##  Formula: ~1 | patientID
##         (Intercept)
## StdDev:    3.869342
## 
##  Formula: ~1 | visitMonth %in% patientID
##         (Intercept) Residual
## StdDev:    10.29691 3.439829
## 
## Correlation Structure: AR(1)
##  Formula: ~1 | patientID/visitMonth 
##  Parameter estimate(s):
## Phi 
##   0 
## Fixed effects: normalizedConcRatio ~ studyArm * visitMonth 
##                                  Value Std.Error DF  t-value p-value
## (Intercept)                  155.29638  3.839251 33 40.44966  0.0000
## studyArmPlacebo              -20.64606  5.174099 33 -3.99027  0.0003
## visitMonth3                    2.28511  5.117698 33  0.44651  0.6581
## visitMonth12                  12.98775  5.000699 33  2.59719  0.0139
## studyArmPlacebo:visitMonth3   -3.00959  7.088158 33 -0.42459  0.6739
## studyArmPlacebo:visitMonth12 -14.34077  6.914091 33 -2.07414  0.0459
##  Correlation: 
##                              (Intr) stdyAP vstMn3 vstM12 sAP:M3
## studyArmPlacebo              -0.741                            
## visitMonth3                  -0.666  0.495                     
## visitMonth12                 -0.690  0.517  0.512              
## studyArmPlacebo:visitMonth3   0.481 -0.649 -0.722 -0.369       
## studyArmPlacebo:visitMonth12  0.499 -0.673 -0.370 -0.726  0.485
## 
## Standardized Within-Group Residuals:
##         Min          Q1         Med          Q3         Max 
## -0.56926116 -0.19442183 -0.01991562  0.24862441  0.62079739 
## 
## Number of Observations: 58
## Number of Groups: 
##                 patientID visitMonth %in% patientID 
##                        20                        58
```

![plot of chunk normalizedConcRatio-nlme](figures/normalizedConcRatio-nlme-1.png)![plot of chunk normalizedConcRatio-nlme](figures/normalizedConcRatio-nlme-2.png)![plot of chunk normalizedConcRatio-nlme](figures/normalizedConcRatio-nlme-3.png)![plot of chunk normalizedConcRatio-nlme](figures/normalizedConcRatio-nlme-4.png)


## Normalized concentration GSH

![figures/lineplotNormalizedConcGSH.png](figures/lineplotNormalizedConcGSH.png)



Mixed effects model using the **lme4** package.


|term                         | estimate| std.error| statistic|group     |
|:----------------------------|--------:|---------:|---------:|:---------|
|(Intercept)                  |   127.81|      9.18|     13.92|fixed     |
|studyArmPlacebo              |    -6.28|     12.34|     -0.51|fixed     |
|visitMonth3                  |    -9.74|     11.06|     -0.88|fixed     |
|visitMonth12                 |     4.84|     10.84|      0.45|fixed     |
|studyArmPlacebo:visitMonth3  |    20.22|     15.36|      1.32|fixed     |
|studyArmPlacebo:visitMonth12 |     6.54|     15.01|      0.44|fixed     |
|sd_(Intercept).patientID     |    14.68|        NA|        NA|patientID |
|sd_Observation.Residual      |    23.46|        NA|        NA|Residual  |

```
## Linear mixed model fit by REML ['lmerMod']
## Formula: normalizedConcGSH ~ studyArm * visitMonth + (1 | patientID)
##    Data: df
## 
## REML criterion at convergence: 502.9
## 
## Scaled residuals: 
##      Min       1Q   Median       3Q      Max 
## -1.91355 -0.57401  0.00879  0.43321  2.32305 
## 
## Random effects:
##  Groups    Name        Variance Std.Dev.
##  patientID (Intercept) 215.5    14.68   
##  Residual              550.4    23.46   
## Number of obs: 58, groups:  patientID, 20
## 
## Fixed effects:
##                              Estimate Std. Error t value
## (Intercept)                   127.808      9.184  13.916
## studyArmPlacebo                -6.278     12.339  -0.509
## visitMonth3                    -9.741     11.059  -0.881
## visitMonth12                    4.842     10.836   0.447
## studyArmPlacebo:visitMonth3    20.222     15.360   1.316
## studyArmPlacebo:visitMonth12    6.538     15.007   0.436
## 
## Correlation of Fixed Effects:
##             (Intr) stdyAP vstMn3 vstM12 sAP:M3
## stdyArmPlcb -0.739                            
## visitMonth3 -0.602  0.448                     
## visitMnth12 -0.634  0.483  0.510              
## stdyArmP:M3  0.434 -0.588 -0.720 -0.366       
## stdyArP:M12  0.455 -0.616 -0.368 -0.728  0.480
```

```
## $patientID
```

![plot of chunk normalizedConcGSH-lme4](figures/normalizedConcGSH-lme4-1.png)
![plot of chunk normalizedConcGSH-lme4](figures/normalizedConcGSH-lme4-2.png)![plot of chunk normalizedConcGSH-lme4](figures/normalizedConcGSH-lme4-3.png)![plot of chunk normalizedConcGSH-lme4](figures/normalizedConcGSH-lme4-4.png)

Mixed effects model using the **nlme** package.


|term                         | estimate| std.error| statistic| p.value|
|:----------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                  |   127.81|      9.18|     13.92|  0.0000|
|studyArmPlacebo              |    -6.28|     12.34|     -0.51|  0.6143|
|visitMonth3                  |    -9.74|     11.06|     -0.88|  0.3848|
|visitMonth12                 |     4.84|     10.84|      0.45|  0.6579|
|studyArmPlacebo:visitMonth3  |    20.22|     15.36|      1.32|  0.1971|
|studyArmPlacebo:visitMonth12 |     6.54|     15.01|      0.44|  0.6659|

```
## Linear mixed-effects model fit by REML
##  Data: df 
##        AIC      BIC    logLik
##   522.9283 542.4407 -251.4641
## 
## Random effects:
##  Formula: ~1 | patientID
##         (Intercept)
## StdDev:    14.67971
## 
##  Formula: ~1 | visitMonth %in% patientID
##         (Intercept) Residual
## StdDev:    21.87972 8.465757
## 
## Correlation Structure: AR(1)
##  Formula: ~1 | patientID/visitMonth 
##  Parameter estimate(s):
## Phi 
##   0 
## Fixed effects: normalizedConcGSH ~ studyArm * visitMonth 
##                                  Value Std.Error DF   t-value p-value
## (Intercept)                  127.80760  9.184201 33 13.916029  0.0000
## studyArmPlacebo               -6.27833 12.338916 33 -0.508823  0.6143
## visitMonth3                   -9.74082 11.059349 33 -0.880777  0.3848
## visitMonth12                   4.84189 10.836250 33  0.446823  0.6579
## studyArmPlacebo:visitMonth3   20.22194 15.360464 33  1.316493  0.1971
## studyArmPlacebo:visitMonth12   6.53845 15.007012 33  0.435693  0.6659
##  Correlation: 
##                              (Intr) stdyAP vstMn3 vstM12 sAP:M3
## studyArmPlacebo              -0.739                            
## visitMonth3                  -0.602  0.448                     
## visitMonth12                 -0.634  0.483  0.510              
## studyArmPlacebo:visitMonth3   0.434 -0.588 -0.720 -0.366       
## studyArmPlacebo:visitMonth12  0.455 -0.616 -0.368 -0.728  0.480
## 
## Standardized Within-Group Residuals:
##          Min           Q1          Med           Q3          Max 
## -0.690509071 -0.207131458  0.003173197  0.156324523  0.838280113 
## 
## Number of Observations: 58
## Number of Groups: 
##                 patientID visitMonth %in% patientID 
##                        20                        58
```

![plot of chunk normalizedConcGSH-nlme](figures/normalizedConcGSH-nlme-1.png)![plot of chunk normalizedConcGSH-nlme](figures/normalizedConcGSH-nlme-2.png)![plot of chunk normalizedConcGSH-nlme](figures/normalizedConcGSH-nlme-3.png)![plot of chunk normalizedConcGSH-nlme](figures/normalizedConcGSH-nlme-4.png)


## Normalized concentration GSSG

![figures/lineplotNormalizedConcGSSG.png](figures/lineplotNormalizedConcGSSG.png)



Mixed effects model using the **lme4** package.


|term                         | estimate| std.error| statistic|group     |
|:----------------------------|--------:|---------:|---------:|:---------|
|(Intercept)                  |     0.83|      0.07|     12.19|fixed     |
|studyArmPlacebo              |     0.08|      0.09|      0.90|fixed     |
|visitMonth3                  |    -0.07|      0.08|     -0.90|fixed     |
|visitMonth12                 |    -0.04|      0.08|     -0.52|fixed     |
|studyArmPlacebo:visitMonth3  |     0.15|      0.11|      1.32|fixed     |
|studyArmPlacebo:visitMonth12 |     0.13|      0.11|      1.12|fixed     |
|sd_(Intercept).patientID     |     0.11|        NA|        NA|patientID |
|sd_Observation.Residual      |     0.17|        NA|        NA|Residual  |

```
## Linear mixed model fit by REML ['lmerMod']
## Formula: normalizedConcGSSG ~ studyArm * visitMonth + (1 | patientID)
##    Data: df
## 
## REML criterion at convergence: -7.1
## 
## Scaled residuals: 
##     Min      1Q  Median      3Q     Max 
## -1.7631 -0.5947  0.0578  0.4788  2.6768 
## 
## Random effects:
##  Groups    Name        Variance Std.Dev.
##  patientID (Intercept) 0.01141  0.1068  
##  Residual              0.03055  0.1748  
## Number of obs: 58, groups:  patientID, 20
## 
## Fixed effects:
##                              Estimate Std. Error t value
## (Intercept)                   0.82904    0.06801  12.190
## studyArmPlacebo               0.08238    0.09139   0.901
## visitMonth3                  -0.07445    0.08240  -0.904
## visitMonth12                 -0.04205    0.08073  -0.521
## studyArmPlacebo:visitMonth3   0.15070    0.11443   1.317
## studyArmPlacebo:visitMonth12  0.12535    0.11179   1.121
## 
## Correlation of Fixed Effects:
##             (Intr) stdyAP vstMn3 vstM12 sAP:M3
## stdyArmPlcb -0.739                            
## visitMonth3 -0.606  0.451                     
## visitMnth12 -0.637  0.485  0.510              
## stdyArmP:M3  0.437 -0.591 -0.720 -0.366       
## stdyArP:M12  0.458 -0.619 -0.369 -0.727  0.480
```

```
## $patientID
```

![plot of chunk normalizedConcGSSG-lme4](figures/normalizedConcGSSG-lme4-1.png)
![plot of chunk normalizedConcGSSG-lme4](figures/normalizedConcGSSG-lme4-2.png)![plot of chunk normalizedConcGSSG-lme4](figures/normalizedConcGSSG-lme4-3.png)![plot of chunk normalizedConcGSSG-lme4](figures/normalizedConcGSSG-lme4-4.png)

Mixed effects model using the **nlme** package.


|term                         | estimate| std.error| statistic| p.value|
|:----------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                  |     0.83|      0.07|     12.19|  0.0000|
|studyArmPlacebo              |     0.08|      0.09|      0.90|  0.3739|
|visitMonth3                  |    -0.07|      0.08|     -0.90|  0.3728|
|visitMonth12                 |    -0.04|      0.08|     -0.52|  0.6059|
|studyArmPlacebo:visitMonth3  |     0.15|      0.11|      1.32|  0.1969|
|studyArmPlacebo:visitMonth12 |     0.13|      0.11|      1.12|  0.2703|

```
## Linear mixed-effects model fit by REML
##  Data: df 
##        AIC      BIC   logLik
##   12.94192 32.45436 3.529039
## 
## Random effects:
##  Formula: ~1 | patientID
##         (Intercept)
## StdDev:   0.1068296
## 
##  Formula: ~1 | visitMonth %in% patientID
##         (Intercept)  Residual
## StdDev:   0.1631421 0.0627639
## 
## Correlation Structure: AR(1)
##  Formula: ~1 | patientID/visitMonth 
##  Parameter estimate(s):
## Phi 
##   0 
## Fixed effects: normalizedConcGSSG ~ studyArm * visitMonth 
##                                   Value  Std.Error DF   t-value p-value
## (Intercept)                   0.8290378 0.06800693 33 12.190490  0.0000
## studyArmPlacebo               0.0823790 0.09139115 33  0.901389  0.3739
## visitMonth3                  -0.0744497 0.08240097 33 -0.903505  0.3728
## visitMonth12                 -0.0420507 0.08072781 33 -0.520895  0.6059
## studyArmPlacebo:visitMonth3   0.1507045 0.11443206 33  1.316978  0.1969
## studyArmPlacebo:visitMonth12  0.1253526 0.11179203 33  1.121301  0.2703
##  Correlation: 
##                              (Intr) stdyAP vstMn3 vstM12 sAP:M3
## studyArmPlacebo              -0.739                            
## visitMonth3                  -0.606  0.451                     
## visitMonth12                 -0.637  0.485  0.510              
## studyArmPlacebo:visitMonth3   0.437 -0.591 -0.720 -0.366       
## studyArmPlacebo:visitMonth12  0.458 -0.619 -0.369 -0.727  0.480
## 
## Standardized Within-Group Residuals:
##         Min          Q1         Med          Q3         Max 
## -0.63307395 -0.21354564  0.02075229  0.17191976  0.96112891 
## 
## Number of Observations: 58
## Number of Groups: 
##                 patientID visitMonth %in% patientID 
##                        20                        58
```

![plot of chunk normalizedConcGSSG-nlme](figures/normalizedConcGSSG-nlme-1.png)![plot of chunk normalizedConcGSSG-nlme](figures/normalizedConcGSSG-nlme-2.png)![plot of chunk normalizedConcGSSG-nlme](figures/normalizedConcGSSG-nlme-3.png)![plot of chunk normalizedConcGSSG-nlme](figures/normalizedConcGSSG-nlme-4.png)
