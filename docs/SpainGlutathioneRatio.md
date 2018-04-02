---
title: "Glutathione ratios as the mechanism of action of lipoic acid in progressive multiple sclerosis (PI: Rebecca Spain)"
date: "2018-04-02"
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



| patientID | visitMonth |studyArm | normalizedConcGSH | normalizedConcGSSG | normalizedConcRatio |
|:---------:|:----------:|:--------|:-----------------:|:------------------:|:-------------------:|
|    118    |     0      |LA       |      125.06       |        0.93        |       134.39        |
|    118    |     3      |LA       |      100.76       |        0.64        |       157.79        |
|    118    |     12     |LA       |      137.35       |        0.83        |       165.82        |
|    124    |     0      |LA       |      127.61       |        0.76        |       168.90        |
|    124    |     3      |LA       |       86.82       |        0.51        |       169.44        |
|    124    |     12     |LA       |      109.10       |        0.64        |       171.58        |
|    129    |     0      |LA       |      175.84       |        1.03        |       171.36        |
|    129    |     3      |LA       |      134.91       |        0.96        |       140.36        |
|    129    |     12     |LA       |      120.29       |        0.69        |       175.25        |
|    130    |     0      |LA       |      102.18       |        0.69        |       148.02        |
|    130    |     3      |LA       |      142.32       |        0.94        |       151.86        |
|    130    |     12     |LA       |      170.98       |        0.97        |       176.26        |
|    132    |     0      |LA       |      164.86       |        1.18        |       139.21        |
|    132    |     3      |LA       |      159.88       |        0.95        |       168.87        |
|    132    |     12     |LA       |      156.80       |        0.95        |       165.67        |
|    134    |     0      |LA       |      121.36       |        0.86        |       140.53        |
|    134    |     3      |LA       |      117.52       |        0.68        |       173.03        |
|    134    |     12     |LA       |      166.19       |        0.94        |       176.27        |
|    140    |     0      |LA       |      135.54       |        0.82        |       166.15        |
|    140    |     3      |LA       |      123.01       |        0.81        |       152.21        |
|    140    |     12     |LA       |      145.25       |        0.99        |       147.36        |
|    149    |     0      |LA       |      111.48       |        0.71        |       157.75        |
|    149    |     3      |LA       |      120.45       |        0.84        |       143.15        |
|    149    |     12     |LA       |      133.68       |        0.83        |       160.44        |
|    151    |     0      |LA       |      101.74       |        0.60        |       170.28        |
|    151    |     3      |LA       |       92.33       |        0.58        |       160.44        |
|    151    |     12     |LA       |      108.97       |        0.66        |       166.27        |
|    119    |     0      |Placebo  |       86.95       |        0.69        |       125.56        |
|    119    |     3      |Placebo  |      171.00       |        1.29        |       132.47        |
|    119    |     12     |Placebo  |      185.79       |        1.42        |       131.09        |
|    120    |     0      |Placebo  |      108.99       |        0.81        |       134.69        |
|    120    |     12     |Placebo  |      144.20       |        1.00        |       143.82        |
|    122    |     0      |Placebo  |      124.43       |        0.97        |       127.89        |
|    122    |     12     |Placebo  |      126.22       |        0.94        |       134.53        |
|    123    |     0      |Placebo  |       96.34       |        0.63        |       152.45        |
|    123    |     3      |Placebo  |      131.28       |        1.00        |       131.92        |
|    123    |     12     |Placebo  |      110.30       |        0.86        |       128.95        |
|    125    |     0      |Placebo  |       93.27       |        0.74        |       126.19        |
|    125    |     3      |Placebo  |       91.82       |        0.64        |       143.24        |
|    125    |     12     |Placebo  |      116.12       |        0.90        |       128.79        |
|    131    |     0      |Placebo  |      183.91       |        1.47        |       124.82        |
|    131    |     3      |Placebo  |      129.58       |        1.02        |       126.79        |
|    131    |     12     |Placebo  |      116.74       |        0.93        |       125.19        |
|    135    |     0      |Placebo  |      109.98       |        0.71        |       155.24        |
|    135    |     3      |Placebo  |      133.95       |        0.83        |       160.95        |
|    135    |     12     |Placebo  |      143.38       |        0.97        |       148.21        |
|    139    |     0      |Placebo  |      162.97       |        1.16        |       140.65        |
|    139    |     3      |Placebo  |      156.30       |        1.14        |       137.41        |
|    139    |     12     |Placebo  |      161.13       |        1.14        |       141.52        |
|    143    |     0      |Placebo  |      143.55       |        1.14        |       125.84        |
|    143    |     3      |Placebo  |      169.13       |        1.33        |       127.29        |
|    143    |     12     |Placebo  |       97.65       |        0.55        |       176.13        |
|    145    |     0      |Placebo  |      110.28       |        0.90        |       122.08        |
|    145    |     3      |Placebo  |       97.01       |        0.78        |       123.97        |
|    145    |     12     |Placebo  |      109.46       |        0.83        |       132.14        |
|    153    |     0      |Placebo  |      100.72       |        0.69        |       146.84        |
|    153    |     3      |Placebo  |       93.73       |        0.77        |       121.86        |
|    153    |     12     |Placebo  |       96.02       |        0.80        |       120.52        |

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

The model for Aim 1 will be a random intercept linear model.
Estimation will use the *lme4* package.


```
## 
## To cite lme4 in publications use:
## 
##   Douglas Bates, Martin Maechler, Ben Bolker, Steve Walker (2015).
##   Fitting Linear Mixed-Effects Models Using lme4. Journal of
##   Statistical Software, 67(1), 1-48. doi:10.18637/jss.v067.i01.
## 
## A BibTeX entry for LaTeX users is
## 
##   @Article{,
##     title = {Fitting Linear Mixed-Effects Models Using {lme4}},
##     author = {Douglas Bates and Martin M{\"a}chler and Ben Bolker and Steve Walker},
##     journal = {Journal of Statistical Software},
##     year = {2015},
##     volume = {67},
##     number = {1},
##     pages = {1--48},
##     doi = {10.18637/jss.v067.i01},
##   }
```

The model is

$$
\begin{align*}
y_{i j} = & \beta_0 \\
          & + \beta_1 x_{\text{placebo}, i} + \beta_2 x_{\text{month 3}, i} + \beta_3 x_{\text{month 12}, i} \\
          & + \beta_4 x_{\text{placebo}, i} x_{\text{month 3}, i} + \beta_5 x_{\text{placebo}, i} x_{\text{month 12}, i} \\
          & + u_j + e_{i j} \\
\end{align*}
$$

where 
$u_j$ is the random intercept component for each study subject $j$, and 
$e_{i j}$ is the random error.


## Normalized GSH:GSSG concentration ratio

![figures/lineplotNormalizedConcRatio.png](figures/lineplotNormalizedConcRatio.png)



![figures/plotNormalizedConcSlope.png](figures/plotNormalizedConcSlope.png)



Mixed effects model using the **lme4** package.


|term                         | estimate| std.error| statistic| df| pvalue|
|:----------------------------|--------:|---------:|---------:|--:|------:|
|(Intercept)                  |   155.18|      4.26|     36.42| 34| 0.0000|
|studyArmPlacebo              |   -20.43|      5.74|     -3.56| 18| 0.0023|
|visitMonth3                  |     2.29|      5.94|      0.38| 34| 0.7027|
|visitMonth12                 |    12.04|      5.94|      2.03| 34| 0.0505|
|studyArmPlacebo:visitMonth3  |    -3.05|      8.21|     -0.37| 34| 0.7121|
|studyArmPlacebo:visitMonth12 |    -9.43|      8.01|     -1.18| 34| 0.2469|

Details.


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

*Not executed.*
The `lme4::lmer()` function is good enough.




## Normalized concentration GSH

![figures/lineplotNormalizedConcGSH.png](figures/lineplotNormalizedConcGSH.png)



Mixed effects model using the **lme4** package.


|term                         | estimate| std.error| statistic| df| pvalue|
|:----------------------------|--------:|---------:|---------:|--:|------:|
|(Intercept)                  |   129.52|      9.15|     14.15| 34| 0.0000|
|studyArmPlacebo              |    -9.39|     12.34|     -0.76| 18| 0.4565|
|visitMonth3                  |    -9.74|     10.99|     -0.89| 34| 0.3818|
|visitMonth12                 |     9.21|     10.99|      0.84| 34| 0.4078|
|studyArmPlacebo:visitMonth3  |    20.22|     15.27|      1.32| 34| 0.1942|
|studyArmPlacebo:visitMonth12 |    -1.43|     14.82|     -0.10| 34| 0.9235|

Details.


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

*Not executed.*
The `lme4::lmer()` function is good enough.




## Normalized concentration GSSG

![figures/lineplotNormalizedConcGSSG.png](figures/lineplotNormalizedConcGSSG.png)



Mixed effects model using the **lme4** package.


|term                         | estimate| std.error| statistic| df| pvalue|
|:----------------------------|--------:|---------:|---------:|--:|------:|
|(Intercept)                  |     0.84|      0.07|     12.07| 34| 0.0000|
|studyArmPlacebo              |     0.06|      0.09|      0.64| 18| 0.5288|
|visitMonth3                  |    -0.07|      0.09|     -0.85| 34| 0.4033|
|visitMonth12                 |    -0.01|      0.09|     -0.11| 34| 0.9137|
|studyArmPlacebo:visitMonth3  |     0.15|      0.12|      1.24| 34| 0.2232|
|studyArmPlacebo:visitMonth12 |     0.05|      0.12|      0.40| 34| 0.6915|

Details.


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

*Not executed.*
The `lme4::lmer()` function is good enough.




## Interpretation



* Normalized concentration ratio was significantly different between placebo and LA
  * Difference between placebo and LA at baseline visit was -20.4 (p-value = 0.0023)
  * Difference between placebo and LA at 3-month visit was -23.5 (p-value = 0.0011)
  * Difference between placebo and LA at 12-month visit was -29.9 (p-value = 6.1 &times; 10<sup>-5</sup>)
  * Difference between placebo and LA at baseline visit was not significantly different compared to month 3 or month 12 visits (i.e., difference between placebo and LA was significant at **all visits**)
  * Global difference between placebo and LA was -24.5 (p-value = 1.3 &times; 10<sup>-6</sup>)
*  Normalized concentration ratio was not significantly different between visits, either within the placebo group or LA group
*  Normalized GSH concentration was not significantly different between study arm or visits
*  Normalized GSSG concentration was not significantly different between study arm or visits



# Aim 2

The model for Aim 2 will be a linear regression model.

The model is

$$
y_{i} =
\beta_0
+ \beta_1 x_{\text{placebo}, i}
+ e_{i}
$$


## 24-month brain atrophy

![figures/scatterplotMatrixBrainAtrophy.png](figures/scatterplotMatrixBrainAtrophy.png)



Linear model.


```
## 
## Call:
## lm(formula = brainAtrophy ~ studyArm, data = df2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.30438 -0.74248  0.07256  0.59716  1.80694 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)  
## (Intercept)      -0.2496     0.2889  -0.864   0.3990  
## studyArmPlacebo  -1.0231     0.3895  -2.627   0.0171 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8666 on 18 degrees of freedom
## Multiple R-squared:  0.2771,	Adjusted R-squared:  0.2369 
## F-statistic: 6.899 on 1 and 18 DF,  p-value: 0.01711
```

```
## 
## Call:
## lm(formula = brainAtrophy ~ studyArm + pctChangeConcRatio, data = df2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.28391 -0.73332  0.04088  0.57735  1.81193 
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)  
## (Intercept)        -0.232099   0.324069  -0.716   0.4836  
## studyArmPlacebo    -1.035179   0.410478  -2.522   0.0219 *
## pctChangeConcRatio -0.001996   0.014784  -0.135   0.8942  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8913 on 17 degrees of freedom
## Multiple R-squared:  0.2779,	Adjusted R-squared:  0.1929 
## F-statistic:  3.27 on 2 and 17 DF,  p-value: 0.06285
```

```
## 
## Call:
## lm(formula = brainAtrophy ~ studyArm + pctChangeConcRatio + concRatioM0, 
##     data = df2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.33150 -0.65546  0.01787  0.56680  1.85827 
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)
## (Intercept)        -1.690900   3.885431  -0.435    0.669
## studyArmPlacebo    -0.812243   0.726248  -1.118    0.280
## pctChangeConcRatio  0.004305   0.022578   0.191    0.851
## concRatioM0         0.009045   0.024003   0.377    0.711
## 
## Residual standard error: 0.9146 on 16 degrees of freedom
## Multiple R-squared:  0.2842,	Adjusted R-squared:   0.15 
## F-statistic: 2.118 on 3 and 16 DF,  p-value: 0.1382
```

```
## 
## Call:
## lm(formula = brainAtrophy ~ studyArm + pctChangeConcRatio + invConcRatioM0, 
##     data = df2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.34758 -0.60897  0.00814  0.54426  1.88351 
## 
## Coefficients:
##                      Estimate Std. Error t value Pr(>|t|)
## (Intercept)         1.451e+00  3.111e+00   0.466    0.647
## studyArmPlacebo    -7.167e-01  7.200e-01  -0.995    0.334
## pctChangeConcRatio  6.947e-03  2.232e-02   0.311    0.760
## invConcRatioM0     -2.711e+02  4.982e+02  -0.544    0.594
## 
## Residual standard error: 0.9103 on 16 degrees of freedom
## Multiple R-squared:  0.291,	Adjusted R-squared:  0.158 
## F-statistic: 2.189 on 3 and 16 DF,  p-value: 0.1291
```

```
## 
## Call:
## lm(formula = brainAtrophy ~ studyArm + concRatioM0, data = df2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.30458 -0.67572 -0.00435  0.55146  1.84576 
## 
## Coefficients:
##                  Estimate Std. Error t value Pr(>|t|)  
## (Intercept)     -1.127281   2.448976  -0.460    0.651  
## studyArmPlacebo -0.907550   0.511691  -1.774    0.094 .
## concRatioM0      0.005656   0.015666   0.361    0.723  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8883 on 17 degrees of freedom
## Multiple R-squared:  0.2826,	Adjusted R-squared:  0.1982 
## F-statistic: 3.348 on 2 and 17 DF,  p-value: 0.05944
```

```
## 
## Call:
## lm(formula = brainAtrophy ~ studyArm + invConcRatioM0, data = df2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.31699 -0.63864 -0.02853  0.55657  1.86130 
## 
## Coefficients:
##                  Estimate Std. Error t value Pr(>|t|)
## (Intercept)        0.7701     2.1519   0.358    0.725
## studyArmPlacebo   -0.8701     0.5107  -1.704    0.107
## invConcRatioM0  -156.9111   328.0185  -0.478    0.638
## 
## Residual standard error: 0.8858 on 17 degrees of freedom
## Multiple R-squared:  0.2867,	Adjusted R-squared:  0.2028 
## F-statistic: 3.416 on 2 and 17 DF,  p-value: 0.05661
```


|term            | estimate| std.error| statistic| p.value|
|:---------------|--------:|---------:|---------:|-------:|
|(Intercept)     |     0.77|      2.15|      0.36|    0.72|
|studyArmPlacebo |    -0.87|      0.51|     -1.70|    0.11|
|invConcRatioM0  |  -156.91|    328.02|     -0.48|    0.64|

![plot of chunk brainAtrophyDiagnostics](figures/brainAtrophyDiagnostics-1.png)![plot of chunk brainAtrophyDiagnostics](figures/brainAtrophyDiagnostics-2.png)![plot of chunk brainAtrophyDiagnostics](figures/brainAtrophyDiagnostics-3.png)![plot of chunk brainAtrophyDiagnostics](figures/brainAtrophyDiagnostics-4.png)![plot of chunk brainAtrophyDiagnostics](figures/brainAtrophyDiagnostics-5.png)![plot of chunk brainAtrophyDiagnostics](figures/brainAtrophyDiagnostics-6.png)


## Interpretation



