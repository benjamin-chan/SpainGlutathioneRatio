---
title: "Glutathione ratios as the mechanism of action of lipoic acid in progressive multiple sclerosis (PI: Rebecca Spain)"
date: "2018-04-12"
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
## Classes 'tbl_df', 'tbl' and 'data.frame':	20 obs. of  8 variables:
##  $ patientID          : Factor w/ 20 levels "118","119","120",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ studyArm           : Factor w/ 2 levels "LA","Placebo": 1 2 2 2 2 1 2 1 1 2 ...
##  $ concRatioM0        : num  134 126 135 128 152 ...
##  $ concRatioM12       : num  166 131 144 135 129 ...
##  $ pctChangeConcRatio : num  23.39 4.4 6.78 5.2 -15.41 ...
##  $ brainAtrophy       : num  0.358 -2.026 -1.544 0.534 -0.679 ...
##  $ wholeBrainVol      : num  1389025 1437526 1385963 1393046 1413702 ...
##  $ wholeBrainVolScaled: num [1:20, 1] -0.652 0.142 -0.702 -0.586 -0.248 ...
##   ..- attr(*, "scaled:center")= num 1428831
##   ..- attr(*, "scaled:scale")= num 61028
```



|patientID |studyArm | concRatioM0| concRatioM12| pctChangeConcRatio| brainAtrophy| wholeBrainVol| wholeBrainVolScaled|
|:---------|:--------|-----------:|------------:|------------------:|------------:|-------------:|-------------------:|
|118       |LA       |      134.39|       165.82|              23.39|         0.36|       1389025|         -0.65225435|
|124       |LA       |      168.90|       171.58|               1.59|         0.80|       1403817|         -0.40987661|
|129       |LA       |      171.36|       175.25|               2.27|        -1.46|       1394722|         -0.55890808|
|130       |LA       |      148.02|       176.26|              19.08|         0.20|       1465597|          0.60244636|
|132       |LA       |      139.21|       165.67|              19.01|        -1.55|       1442353|          0.22157254|
|134       |LA       |      140.53|       176.27|              25.44|         0.60|       1494836|          1.08157144|
|140       |LA       |      166.15|       147.36|             -11.31|        -1.11|       1432413|          0.05869458|
|149       |LA       |      157.75|       160.44|               1.71|         0.07|       1548241|          1.95665694|
|151       |LA       |      170.28|       166.27|              -2.36|        -0.16|       1463387|          0.56623855|
|119       |Placebo  |      125.56|       131.09|               4.40|        -2.03|       1437526|          0.14247847|
|120       |Placebo  |      134.69|       143.82|               6.78|        -1.54|       1385963|         -0.70243336|
|122       |Placebo  |      127.89|       134.53|               5.20|         0.53|       1393046|         -0.58637150|
|123       |Placebo  |      152.45|       128.95|             -15.41|        -0.68|       1413702|         -0.24790021|
|125       |Placebo  |      126.19|       128.79|               2.06|        -1.12|       1398976|         -0.48919566|
|131       |Placebo  |      124.82|       125.19|               0.29|        -1.75|       1583152|          2.52871095|
|135       |Placebo  |      155.24|       148.21|              -4.52|        -0.27|       1460338|          0.51628125|
|139       |Placebo  |      140.65|       141.52|               0.62|        -2.17|       1393658|         -0.57634163|
|143       |Placebo  |      125.84|       176.13|              39.96|        -1.74|       1339494|         -1.46386607|
|145       |Placebo  |      122.08|       132.14|               8.25|        -2.01|       1355211|         -1.20633292|
|153       |Placebo  |      146.84|       120.52|             -17.93|        -1.22|       1381158|         -0.78117069|



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


```
## Note: uncertainty of the random effects parameters are not taken into account for confidence intervals.
```



|group   |  x| predicted| conf.low| conf.high|
|:-------|--:|---------:|--------:|---------:|
|LA      |  0|  155.1758| 146.8258|  163.5257|
|LA      |  3|  157.4609| 149.1109|  165.8108|
|LA      | 12|  167.2139| 158.8640|  175.5639|
|Placebo |  0|  134.7490| 126.3991|  143.0989|
|Placebo |  3|  133.9797| 125.6297|  142.3296|
|Placebo | 12|  137.3535| 129.0036|  145.7035|

```
## Note: uncertainty of the random effects parameters are not taken into account for confidence intervals.
```

Details (not shown).



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

Details (not shown).



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

Details (not shown).



Mixed effects model using the **nlme** package.

*Not executed.*
The `lme4::lmer()` function is good enough.




## Interpretation





### Normalized concentration ratio

* Normalized concentration ratio was significantly different between placebo and LA
  * Difference between placebo and LA at baseline visit was -20.4 (p-value = 0.0023)
  * Difference between placebo and LA at 3-month visit was -23.5 (p-value = 0.0011)
  * Difference between placebo and LA at 12-month visit was -29.9 (p-value = 6.1 &times; 10<sup>-5</sup>)
  * Difference between placebo and LA at baseline visit was not significantly different compared to month 3 or month 12 visits (i.e., difference between placebo and LA was significant at **all visits**)
  * Global difference between placebo and LA was -24.5 (p-value = 1.3 &times; 10<sup>-6</sup>)
* Normalized concentration ratio was not significantly different between visits, either within the placebo group or LA group
  * Among LA: difference between 3-month visit and baseline was 2.29 (p-value = 0.7)
  * Among LA: difference between 12-month visit and baseline was 12 (p-value = 0.051)
  * Among placebo: difference between 3-month visit and baseline was -0.769 (p-value = 0.89)
  * Among placebo: difference between 12-month visit and baseline was 2.6 (p-value = 0.63)
* The differences in normalized concentration ratio from baseline were not significantly different between LA and placebo
  * Baseline to 3-months: -3.05 (p-value = 0.71)
  * Baseline to 12-months: -9.43 (p-value = 0.25)

![figures/predictedNormalizedConcRatio.png](figures/predictedNormalizedConcRatio.png)


### Normalized GSH concentration

* Normalized GSH concentration was not significantly different between study arm or visits


### Normalized GSSG concentration

* Normalized GSSG concentration was not significantly different between study arm or visits



# Aim 2

The model for Aim 2 will be a linear regression model.

The model is

$$
y_{\text{% brain atrophy}, i} =
\beta_0
+ \beta_1 x_{\text{%}\Delta\text{GSH:GSSG}, i}
+ e_{i}
$$


## 24-month brain atrophy

![figures/boxplotBrainAtrophy.png](figures/boxplotBrainAtrophy.png)



![figures/scatterplotBrainAtrophy.png](figures/scatterploBrainAtrophy.png)





Linear model.


```
## 
## Call:
## lm(formula = brainAtrophy ~ pctChangeConcRatio, data = df2)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -1.3330 -0.8445 -0.2278  0.9139  1.6401 
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)   
## (Intercept)        -0.845579   0.243916  -3.467  0.00275 **
## pctChangeConcRatio  0.006138   0.016436   0.373  0.71316   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.015 on 18 degrees of freedom
## Multiple R-squared:  0.007689,	Adjusted R-squared:  -0.04744 
## F-statistic: 0.1395 on 1 and 18 DF,  p-value: 0.7132
```

```
## 
## Call:
## lm(formula = brainAtrophy ~ pctChangeConcRatio + studyArm, data = df2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.28391 -0.73332  0.04088  0.57735  1.81193 
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)  
## (Intercept)        -0.232099   0.324069  -0.716   0.4836  
## pctChangeConcRatio -0.001996   0.014784  -0.135   0.8942  
## studyArmPlacebo    -1.035179   0.410478  -2.522   0.0219 *
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
## lm(formula = brainAtrophy ~ pctChangeConcRatio + studyArm + pctChangeConcRatio:studyArm, 
##     data = df2)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -1.5167 -0.5468  0.1300  0.3598  1.8464 
## 
## Coefficients:
##                                    Estimate Std. Error t value Pr(>|t|)  
## (Intercept)                        -0.43090    0.35922  -1.200   0.2478  
## pctChangeConcRatio                  0.02071    0.02372   0.873   0.3957  
## studyArmPlacebo                    -0.79917    0.44921  -1.779   0.0942 .
## pctChangeConcRatio:studyArmPlacebo -0.03649    0.03008  -1.213   0.2427  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8791 on 16 degrees of freedom
## Multiple R-squared:  0.3387,	Adjusted R-squared:  0.2147 
## F-statistic: 2.731 on 3 and 16 DF,  p-value: 0.07818
```



|term                               | estimate| std.error| statistic| p.value|
|:----------------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                        |    -0.43|      0.36|     -1.20|  0.2478|
|pctChangeConcRatio                 |     0.02|      0.02|      0.87|  0.3957|
|studyArmPlacebo                    |    -0.80|      0.45|     -1.78|  0.0942|
|pctChangeConcRatio:studyArmPlacebo |    -0.04|      0.03|     -1.21|  0.2427|

Details (not shown).





## Interpretation



* Percent brain atrophy was not significantly associated with GSH:GSSG concentration change
  * $\hat{\beta}$ of 0.00614 (p-value = 0.713)
  * Correlation coefficient = 0.0877
  * GSH:GSSG concentration change explains 0.769% of the variation in brain atrophy

* The association was still not significant after adjusting for study arm
  * $\hat{\beta}$ of -0.002 (p-value = 0.894)
  * Partial correlation coefficient = -0.0327
  * GSH:GSSG concentration change explains 0.107% of the variation in brain atrophy after adjusting for study arm



