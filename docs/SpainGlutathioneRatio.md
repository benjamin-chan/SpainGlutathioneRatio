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

Double-check data from `patientID == 143`.


| sampleID|patientID |visitMonth |studyArm | brainAtrophy| normalizedConcGSH| normalizedConcGSSG| normalizedConcStdEGSH| normalizedConcStdEGSSG| normalizedConcRatio|
|--------:|:---------|:----------|:--------|------------:|-----------------:|------------------:|---------------------:|----------------------:|-------------------:|
|       44|143       |0          |Placebo  |     -1.74343|         143.55248|          1.1407128|             3.1716859|              0.2932400|            125.8445|
|       45|143       |3          |Placebo  |           NA|         169.12581|          1.3286383|             1.1624269|              0.3331352|            127.2926|
|       46|143       |12         |Placebo  |           NA|          97.65062|          0.5544174|             0.4302695|              0.1872683|            176.1319|


## Create analytic data frames for each aim

Aim 1


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

Aim 2


```
## Classes 'tbl_df', 'tbl' and 'data.frame':	20 obs. of  6 variables:
##  $ patientID         : Factor w/ 20 levels "118","119","120",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ studyArm          : Factor w/ 2 levels "LA","Placebo": 1 2 2 2 2 1 2 1 1 2 ...
##  $ concRatioM0       : num  134 126 135 128 152 ...
##  $ concRatioM12      : num  166 131 144 135 129 ...
##  $ pctChangeConcRatio: num  23.39 4.4 6.78 5.2 -15.41 ...
##  $ brainAtrophy      : num  0.358 -2.026 -1.544 0.534 -0.679 ...
```



|patientID |studyArm | concRatioM0| concRatioM12| pctChangeConcRatio| brainAtrophy|
|:---------|:--------|-----------:|------------:|------------------:|------------:|
|118       |LA       |      134.39|       165.82|              23.39|         0.36|
|124       |LA       |      168.90|       171.58|               1.59|         0.80|
|129       |LA       |      171.36|       175.25|               2.27|        -1.46|
|130       |LA       |      148.02|       176.26|              19.08|         0.20|
|132       |LA       |      139.21|       165.67|              19.01|        -1.55|
|134       |LA       |      140.53|       176.27|              25.44|         0.60|
|140       |LA       |      166.15|       147.36|             -11.31|        -1.11|
|149       |LA       |      157.75|       160.44|               1.71|         0.07|
|151       |LA       |      170.28|       166.27|              -2.36|        -0.16|
|119       |Placebo  |      125.56|       131.09|               4.40|        -2.03|
|120       |Placebo  |      134.69|       143.82|               6.78|        -1.54|
|122       |Placebo  |      127.89|       134.53|               5.20|         0.53|
|123       |Placebo  |      152.45|       128.95|             -15.41|        -0.68|
|125       |Placebo  |      126.19|       128.79|               2.06|        -1.12|
|131       |Placebo  |      124.82|       125.19|               0.29|        -1.75|
|135       |Placebo  |      155.24|       148.21|              -4.52|        -0.27|
|139       |Placebo  |      140.65|       141.52|               0.62|        -2.17|
|143       |Placebo  |      125.84|       176.13|              39.96|        -1.74|
|145       |Placebo  |      122.08|       132.14|               8.25|        -2.01|
|153       |Placebo  |      146.84|       120.52|             -17.93|        -1.22|
# Aim 1


## Normalized GSH:GSSG concentration ratio

![figures/lineplotNormalizedConcRatio.png](figures/lineplotNormalizedConcRatio.png)



Mixed effects model using the **lme4** package.


|term                         | estimate| std.error| statistic|group     |
|:----------------------------|--------:|---------:|---------:|:---------|
|(Intercept)                  |   155.18|      4.26|     36.42|fixed     |
|studyArmPlacebo              |   -20.43|      5.74|     -3.56|fixed     |
|visitMonth3                  |     2.29|      5.94|      0.38|fixed     |
|visitMonth12                 |    12.04|      5.94|      2.03|fixed     |
|studyArmPlacebo:visitMonth3  |    -3.05|      8.21|     -0.37|fixed     |
|studyArmPlacebo:visitMonth12 |    -9.43|      8.01|     -1.18|fixed     |
|sd_(Intercept).patientID     |     2.17|        NA|        NA|patientID |
|sd_Observation.Residual      |    12.60|        NA|        NA|Residual  |

```
## Linear mixed model fit by REML ['lmerMod']
## Formula: normalizedConcRatio ~ studyArm * visitMonth + (1 | patientID)
##    Data: df1
## 
## REML criterion at convergence: 426.1
## 
## Scaled residuals: 
##     Min      1Q  Median      3Q     Max 
## -1.6030 -0.6777 -0.1108  0.7190  3.0286 
## 
## Random effects:
##  Groups    Name        Variance Std.Dev.
##  patientID (Intercept)   4.705   2.169  
##  Residual              158.643  12.595  
## Number of obs: 58, groups:  patientID, 20
## 
## Fixed effects:
##                              Estimate Std. Error t value
## (Intercept)                   155.176      4.260   36.42
## studyArmPlacebo               -20.427      5.745   -3.56
## visitMonth3                     2.285      5.937    0.38
## visitMonth12                   12.038      5.937    2.03
## studyArmPlacebo:visitMonth3    -3.054      8.209   -0.37
## studyArmPlacebo:visitMonth12   -9.434      8.006   -1.18
## 
## Correlation of Fixed Effects:
##             (Intr) stdyAP vstMn3 vstM12 sAP:M3
## stdyArmPlcb -0.742                            
## visitMonth3 -0.697  0.517                     
## visitMnth12 -0.697  0.517  0.500              
## stdyArmP:M3  0.504 -0.680 -0.723 -0.362       
## stdyArP:M12  0.517 -0.697 -0.371 -0.742  0.488
```

```
## $patientID
```

![plot of chunk normalizedConcRatio-lme4](figures/normalizedConcRatio-lme4-1.png)
![plot of chunk normalizedConcRatio-lme4](figures/normalizedConcRatio-lme4-2.png)![plot of chunk normalizedConcRatio-lme4](figures/normalizedConcRatio-lme4-3.png)![plot of chunk normalizedConcRatio-lme4](figures/normalizedConcRatio-lme4-4.png)

Mixed effects model using the **nlme** package.


|term                         | estimate| std.error| statistic| p.value|
|:----------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                  |   155.18|      4.26|     36.42|  0.0000|
|studyArmPlacebo              |   -20.43|      5.74|     -3.56|  0.0023|
|visitMonth3                  |     2.29|      5.94|      0.38|  0.7027|
|visitMonth12                 |    12.04|      5.94|      2.03|  0.0505|
|studyArmPlacebo:visitMonth3  |    -3.05|      8.21|     -0.37|  0.7121|
|studyArmPlacebo:visitMonth12 |    -9.43|      8.01|     -1.18|  0.2469|

```
## Linear mixed-effects model fit by REML
##  Data: df1 
##        AIC      BIC    logLik
##   446.0993 465.6117 -213.0497
## 
## Random effects:
##  Formula: ~1 | patientID
##         (Intercept)
## StdDev:    2.169122
## 
##  Formula: ~1 | visitMonth %in% patientID
##         (Intercept) Residual
## StdDev:      12.213 3.079787
## 
## Correlation Structure: AR(1)
##  Formula: ~1 | patientID/visitMonth 
##  Parameter estimate(s):
## Phi 
##   0 
## Fixed effects: normalizedConcRatio ~ studyArm * visitMonth 
##                                  Value Std.Error DF  t-value p-value
## (Intercept)                  155.17576  4.260250 34 36.42409  0.0000
## studyArmPlacebo              -20.42675  5.744521 18 -3.55587  0.0023
## visitMonth3                    2.28511  5.937499 34  0.38486  0.7027
## visitMonth12                  12.03819  5.937499 34  2.02749  0.0505
## studyArmPlacebo:visitMonth3   -3.05445  8.209300 34 -0.37207  0.7121
## studyArmPlacebo:visitMonth12  -9.43367  8.006122 34 -1.17831  0.2469
##  Correlation: 
##                              (Intr) stdyAP vstMn3 vstM12 sAP:M3
## studyArmPlacebo              -0.742                            
## visitMonth3                  -0.697  0.517                     
## visitMonth12                 -0.697  0.517  0.500              
## studyArmPlacebo:visitMonth3   0.504 -0.680 -0.723 -0.362       
## studyArmPlacebo:visitMonth12  0.517 -0.697 -0.371 -0.742  0.488
## 
## Standardized Within-Group Residuals:
##        Min         Q1        Med         Q3        Max 
## -0.3919609 -0.1657127 -0.0270804  0.1758109  0.7405603 
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
|(Intercept)                  |   129.52|      9.15|     14.15|fixed     |
|studyArmPlacebo              |    -9.39|     12.34|     -0.76|fixed     |
|visitMonth3                  |    -9.74|     10.99|     -0.89|fixed     |
|visitMonth12                 |     9.21|     10.99|      0.84|fixed     |
|studyArmPlacebo:visitMonth3  |    20.22|     15.27|      1.32|fixed     |
|studyArmPlacebo:visitMonth12 |    -1.43|     14.82|     -0.10|fixed     |
|sd_(Intercept).patientID     |    14.49|        NA|        NA|patientID |
|sd_Observation.Residual      |    23.32|        NA|        NA|Residual  |

```
## Linear mixed model fit by REML ['lmerMod']
## Formula: normalizedConcGSH ~ studyArm * visitMonth + (1 | patientID)
##    Data: df1
## 
## REML criterion at convergence: 502.1
## 
## Scaled residuals: 
##      Min       1Q   Median       3Q      Max 
## -1.92185 -0.59053  0.00861  0.55097  2.33953 
## 
## Random effects:
##  Groups    Name        Variance Std.Dev.
##  patientID (Intercept) 209.8    14.49   
##  Residual              543.8    23.32   
## Number of obs: 58, groups:  patientID, 20
## 
## Fixed effects:
##                              Estimate Std. Error t value
## (Intercept)                   129.519      9.151  14.154
## studyArmPlacebo                -9.390     12.339  -0.761
## visitMonth3                    -9.741     10.993  -0.886
## visitMonth12                    9.214     10.993   0.838
## studyArmPlacebo:visitMonth3    20.222     15.268   1.324
## studyArmPlacebo:visitMonth12   -1.434     14.823  -0.097
## 
## Correlation of Fixed Effects:
##             (Intr) stdyAP vstMn3 vstM12 sAP:M3
## stdyArmPlcb -0.742                            
## visitMonth3 -0.601  0.445                     
## visitMnth12 -0.601  0.445  0.500              
## stdyArmP:M3  0.432 -0.583 -0.720 -0.360       
## stdyArP:M12  0.445 -0.601 -0.371 -0.742  0.485
```

```
## $patientID
```

![plot of chunk normalizedConcGSH-lme4](figures/normalizedConcGSH-lme4-1.png)
![plot of chunk normalizedConcGSH-lme4](figures/normalizedConcGSH-lme4-2.png)![plot of chunk normalizedConcGSH-lme4](figures/normalizedConcGSH-lme4-3.png)![plot of chunk normalizedConcGSH-lme4](figures/normalizedConcGSH-lme4-4.png)

Mixed effects model using the **nlme** package.


|term                         | estimate| std.error| statistic| p.value|
|:----------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                  |   129.52|      9.15|     14.15|  0.0000|
|studyArmPlacebo              |    -9.39|     12.34|     -0.76|  0.4565|
|visitMonth3                  |    -9.74|     10.99|     -0.89|  0.3818|
|visitMonth12                 |     9.21|     10.99|      0.84|  0.4078|
|studyArmPlacebo:visitMonth3  |    20.22|     15.27|      1.32|  0.1942|
|studyArmPlacebo:visitMonth12 |    -1.43|     14.82|     -0.10|  0.9235|

```
## Linear mixed-effects model fit by REML
##  Data: df1 
##        AIC      BIC    logLik
##   522.1304 541.6428 -251.0652
## 
## Random effects:
##  Formula: ~1 | patientID
##         (Intercept)
## StdDev:    14.48532
## 
##  Formula: ~1 | visitMonth %in% patientID
##         (Intercept) Residual
## StdDev:    21.75406 8.401907
## 
## Correlation Structure: AR(1)
##  Formula: ~1 | patientID/visitMonth 
##  Parameter estimate(s):
## Phi 
##   0 
## Fixed effects: normalizedConcGSH ~ studyArm * visitMonth 
##                                  Value Std.Error DF   t-value p-value
## (Intercept)                  129.51924   9.15093 34 14.153670  0.0000
## studyArmPlacebo               -9.39040  12.33911 18 -0.761027  0.4565
## visitMonth3                   -9.74082  10.99324 34 -0.886074  0.3818
## visitMonth12                   9.21357  10.99324 34  0.838112  0.4078
## studyArmPlacebo:visitMonth3   20.22153  15.26791 34  1.324447  0.1942
## studyArmPlacebo:visitMonth12  -1.43372  14.82329 34 -0.096721  0.9235
##  Correlation: 
##                              (Intr) stdyAP vstMn3 vstM12 sAP:M3
## studyArmPlacebo              -0.742                            
## visitMonth3                  -0.601  0.445                     
## visitMonth12                 -0.601  0.445  0.500              
## studyArmPlacebo:visitMonth3   0.432 -0.583 -0.720 -0.360       
## studyArmPlacebo:visitMonth12  0.445 -0.601 -0.371 -0.742  0.485
## 
## Standardized Within-Group Residuals:
##          Min           Q1          Med           Q3          Max 
## -0.692412274 -0.212757447  0.003101933  0.198505154  0.842895260 
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
|(Intercept)                  |     0.84|      0.07|     12.07|fixed     |
|studyArmPlacebo              |     0.06|      0.09|      0.64|fixed     |
|visitMonth3                  |    -0.07|      0.09|     -0.85|fixed     |
|visitMonth12                 |    -0.01|      0.09|     -0.11|fixed     |
|studyArmPlacebo:visitMonth3  |     0.15|      0.12|      1.24|fixed     |
|studyArmPlacebo:visitMonth12 |     0.05|      0.12|      0.40|fixed     |
|sd_(Intercept).patientID     |     0.09|        NA|        NA|patientID |
|sd_Observation.Residual      |     0.19|        NA|        NA|Residual  |

```
## Linear mixed model fit by REML ['lmerMod']
## Formula: normalizedConcGSSG ~ studyArm * visitMonth + (1 | patientID)
##    Data: df1
## 
## REML criterion at convergence: -3.5
## 
## Scaled residuals: 
##      Min       1Q   Median       3Q      Max 
## -2.22112 -0.61397 -0.01473  0.50159  2.59400 
## 
## Random effects:
##  Groups    Name        Variance Std.Dev.
##  patientID (Intercept) 0.008865 0.09415 
##  Residual              0.034820 0.18660 
## Number of obs: 58, groups:  patientID, 20
## 
## Fixed effects:
##                               Estimate Std. Error t value
## (Intercept)                   0.841158   0.069670  12.074
## studyArmPlacebo               0.060342   0.093943   0.642
## visitMonth3                  -0.074450   0.087964  -0.846
## visitMonth12                 -0.009601   0.087964  -0.109
## studyArmPlacebo:visitMonth3   0.151395   0.122027   1.241
## studyArmPlacebo:visitMonth12  0.047468   0.118611   0.400
## 
## Correlation of Fixed Effects:
##             (Intr) stdyAP vstMn3 vstM12 sAP:M3
## stdyArmPlcb -0.742                            
## visitMonth3 -0.631  0.468                     
## visitMnth12 -0.631  0.468  0.500              
## stdyArmP:M3  0.455 -0.614 -0.721 -0.360       
## stdyArP:M12  0.468 -0.631 -0.371 -0.742  0.486
```

```
## $patientID
```

![plot of chunk normalizedConcGSSG-lme4](figures/normalizedConcGSSG-lme4-1.png)
![plot of chunk normalizedConcGSSG-lme4](figures/normalizedConcGSSG-lme4-2.png)![plot of chunk normalizedConcGSSG-lme4](figures/normalizedConcGSSG-lme4-3.png)![plot of chunk normalizedConcGSSG-lme4](figures/normalizedConcGSSG-lme4-4.png)

Mixed effects model using the **nlme** package.


|term                         | estimate| std.error| statistic| p.value|
|:----------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                  |     0.84|      0.07|     12.07|  0.0000|
|studyArmPlacebo              |     0.06|      0.09|      0.64|  0.5288|
|visitMonth3                  |    -0.07|      0.09|     -0.85|  0.4033|
|visitMonth12                 |    -0.01|      0.09|     -0.11|  0.9137|
|studyArmPlacebo:visitMonth3  |     0.15|      0.12|      1.24|  0.2232|
|studyArmPlacebo:visitMonth12 |     0.05|      0.12|      0.40|  0.6915|

```
## Linear mixed-effects model fit by REML
##  Data: df1 
##        AIC     BIC   logLik
##   16.46336 35.9758 1.768319
## 
## Random effects:
##  Formula: ~1 | patientID
##         (Intercept)
## StdDev:  0.09415466
## 
##  Formula: ~1 | visitMonth %in% patientID
##         (Intercept)   Residual
## StdDev:    0.175161 0.06433062
## 
## Correlation Structure: AR(1)
##  Formula: ~1 | patientID/visitMonth 
##  Parameter estimate(s):
## Phi 
##   0 
## Fixed effects: normalizedConcGSSG ~ studyArm * visitMonth 
##                                   Value  Std.Error DF   t-value p-value
## (Intercept)                   0.8411584 0.06966977 34 12.073506  0.0000
## studyArmPlacebo               0.0603417 0.09394270 18  0.642324  0.5288
## visitMonth3                  -0.0744497 0.08796437 34 -0.846362  0.4033
## visitMonth12                 -0.0096006 0.08796437 34 -0.109142  0.9137
## studyArmPlacebo:visitMonth3   0.1513947 0.12202746 34  1.240661  0.2232
## studyArmPlacebo:visitMonth12  0.0474676 0.11861114 34  0.400196  0.6915
##  Correlation: 
##                              (Intr) stdyAP vstMn3 vstM12 sAP:M3
## studyArmPlacebo              -0.742                            
## visitMonth3                  -0.631  0.468                     
## visitMonth12                 -0.631  0.468  0.500              
## studyArmPlacebo:visitMonth3   0.455 -0.614 -0.721 -0.360       
## studyArmPlacebo:visitMonth12  0.468 -0.631 -0.371 -0.742  0.486
## 
## Standardized Within-Group Residuals:
##          Min           Q1          Med           Q3          Max 
## -0.765731854 -0.211667787 -0.005078626  0.172921662  0.894283472 
## 
## Number of Observations: 58
## Number of Groups: 
##                 patientID visitMonth %in% patientID 
##                        20                        58
```

![plot of chunk normalizedConcGSSG-nlme](figures/normalizedConcGSSG-nlme-1.png)![plot of chunk normalizedConcGSSG-nlme](figures/normalizedConcGSSG-nlme-2.png)![plot of chunk normalizedConcGSSG-nlme](figures/normalizedConcGSSG-nlme-3.png)![plot of chunk normalizedConcGSSG-nlme](figures/normalizedConcGSSG-nlme-4.png)
