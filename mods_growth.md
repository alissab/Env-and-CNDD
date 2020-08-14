---
title: "Brown et al. Growth models"
author: "Alissa Brown"
date: "August 2020"
output:
  html_document:
    keep_md: true
---





Starting with 5m spatial scale: Run growth models for each environmental covariate, perform model selection, summarize results of best-performing model. Repeat for 10m, 15m, and 20m scales. Then evaluate variograms of best-performing models to check for spatial autocorrelation.

### GAP MEASURE at 5m scale




                df         AIC   delta_AIC
-------------  ---  ----------  ----------
gap.null         5   -8431.954   21.856733
gap.tot.add5     6   -8442.271   11.539254
gap.sep.add5     7   -8451.016    2.794397
gap.tot.int5     7   -8447.003    6.807526
gap.sep.int5     9   -8453.810    0.000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Gap measure at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.096961</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.084090&nbsp;&ndash;&nbsp;0.109832</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004344</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006928&nbsp;&ndash;&nbsp;-0.001760</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.003788</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.001365&nbsp;&ndash;&nbsp;0.006211</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.002</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004736</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007142&nbsp;&ndash;&nbsp;-0.002329</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004667</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007251&nbsp;&ndash;&nbsp;-0.002082</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA * Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002307</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000561&nbsp;&ndash;&nbsp;0.004052</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.010</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA * Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000483</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002080&nbsp;&ndash;&nbsp;0.003046</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.712</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.015 / 0.165</td>
</tr>

</table>

<br>
<br>

### SOIL ORGANIC MATTER at 5m scale




                df         AIC   delta_AIC
-------------  ---  ----------  ----------
org.null         5   -8421.508   22.601796
org.tot.add5     6   -8430.184   13.925808
org.sep.add5     7   -8439.303    4.806599
org.tot.int5     7   -8437.517    6.592523
org.sep.int5     9   -8444.109    0.000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Soil organic matter at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.097843</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.084888&nbsp;&ndash;&nbsp;0.110799</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004549</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007136&nbsp;&ndash;&nbsp;-0.001962</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.001300</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003665&nbsp;&ndash;&nbsp;0.001066</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.282</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004040</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006389&nbsp;&ndash;&nbsp;-0.001690</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004624</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007172&nbsp;&ndash;&nbsp;-0.002076</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA * Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003721</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006179&nbsp;&ndash;&nbsp;-0.001263</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.003</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA * Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.000251</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002733&nbsp;&ndash;&nbsp;0.002232</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.843</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.013 / 0.165</td>
</tr>

</table>

<br>
<br>

### SOIL CATIONS 5m scale




                    df         AIC    delta_AIC
-----------------  ---  ----------  -----------
cations.null         5   -8422.129   17.9095951
cations.tot.add5     6   -8430.964    9.0751755
cations.sep.add5     7   -8440.039    0.0000000
cations.tot.int5     7   -8431.793    8.2459738
cations.sep.int5     9   -8439.117    0.9219897



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Cations at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.097676</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.084705&nbsp;&ndash;&nbsp;0.110646</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004656</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007242&nbsp;&ndash;&nbsp;-0.002069</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Cations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.001674</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.000711&nbsp;&ndash;&nbsp;0.004059</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.169</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003750</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006093&nbsp;&ndash;&nbsp;-0.001407</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.002</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004688</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007232&nbsp;&ndash;&nbsp;-0.002144</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.011 / 0.164</td>
</tr>

</table>

<br>
<br>

### CURVATURE at 5m scale




                 df         AIC   delta_AIC
--------------  ---  ----------  ----------
curv.null         5   -8425.894   19.921258
curv.tot.add5     6   -8434.660   11.155061
curv.sep.add5     7   -8443.586    2.229121
curv.tot.int5     7   -8438.100    7.714582
curv.sep.int5     9   -8445.815    0.000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Curvature at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098213</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085212&nbsp;&ndash;&nbsp;0.111214</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004558</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007141&nbsp;&ndash;&nbsp;-0.001974</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Curv</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.003047</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000668&nbsp;&ndash;&nbsp;0.005427</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.012</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003729</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006069&nbsp;&ndash;&nbsp;-0.001390</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.002</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004974</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007658&nbsp;&ndash;&nbsp;-0.002290</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA * Curv</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002536</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004609&nbsp;&ndash;&nbsp;-0.000464</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.016</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA * Curv</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.000718</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002582&nbsp;&ndash;&nbsp;0.001145</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.450</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.013 / 0.166</td>
</tr>

</table>

<br>
<br>

### SLOPE at 5m scale




                  df         AIC   delta_AIC
---------------  ---  ----------  ----------
slope.null         5   -8425.174   18.521520
slope.tot.add5     6   -8434.438    9.257120
slope.sep.add5     7   -8443.695    0.000000
slope.tot.int5     7   -8434.569    9.126283
slope.sep.int5     9   -8442.469    1.225951



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">slope at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.097750</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.084726&nbsp;&ndash;&nbsp;0.110774</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004606</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007191&nbsp;&ndash;&nbsp;-0.002022</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002812</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000474&nbsp;&ndash;&nbsp;0.005150</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.018</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003829</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006172&nbsp;&ndash;&nbsp;-0.001486</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004728</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007271&nbsp;&ndash;&nbsp;-0.002186</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.012 / 0.166</td>
</tr>

</table>

<br>
<br>
<br>
<br>

### GAP MEASURE at 10m scale




                 df         AIC   delta_AIC
--------------  ---  ----------  ----------
gap.null          5   -8431.954    28.63443
gap.tot.add10     6   -8441.208    19.38002
gap.sep.add10     7   -8454.179     6.40890
gap.tot.int10     7   -8447.585    13.00256
gap.sep.int10     9   -8460.588     0.00000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Gap measure at 10m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.097091</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.084427&nbsp;&ndash;&nbsp;0.109755</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004374</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006957&nbsp;&ndash;&nbsp;-0.001791</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.003457</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.001004&nbsp;&ndash;&nbsp;0.005909</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.006</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004666</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007111&nbsp;&ndash;&nbsp;-0.002221</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006980</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.010169&nbsp;&ndash;&nbsp;-0.003791</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA * Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002920</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000851&nbsp;&ndash;&nbsp;0.004988</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.006</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA * Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002092</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000151&nbsp;&ndash;&nbsp;0.004032</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.035</strong></td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.021 / 0.165</td>
</tr>

</table>

<br>
<br>

### SOIL ORGANIC MATTER at 10m scale




                 df         AIC   delta_AIC
--------------  ---  ----------  ----------
org.null          5   -8421.508   21.401161
org.tot.add10     6   -8429.092   13.817187
org.sep.add10     7   -8442.909    0.000000
org.tot.int10     7   -8430.103   12.805625
org.sep.int10     9   -8441.792    1.116782



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Soil organic matter at 10m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098042</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085323&nbsp;&ndash;&nbsp;0.110760</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004620</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007209&nbsp;&ndash;&nbsp;-0.002030</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.001362</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003733&nbsp;&ndash;&nbsp;0.001008</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.260</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003579</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005958&nbsp;&ndash;&nbsp;-0.001200</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.003</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007094</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.010292&nbsp;&ndash;&nbsp;-0.003896</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.016 / 0.161</td>
</tr>

</table>

<br>
<br>

### CATIONS 10m scale




                     df         AIC   delta_AIC
------------------  ---  ----------  ----------
cations.null          5   -8422.129   21.727665
cations.tot.add10     6   -8429.733   14.124396
cations.sep.add10     7   -8443.857    0.000000
cations.tot.int10     7   -8428.983   14.874064
cations.sep.int10     9   -8441.387    2.470003



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Cations at 10m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.097938</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085202&nbsp;&ndash;&nbsp;0.110673</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004600</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007187&nbsp;&ndash;&nbsp;-0.002012</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Cations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.001812</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.000572&nbsp;&ndash;&nbsp;0.004197</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.136</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003587</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005965&nbsp;&ndash;&nbsp;-0.001209</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.003</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007156</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.010354&nbsp;&ndash;&nbsp;-0.003959</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.016 / 0.162</td>
</tr>

</table>

<br>
<br>

### CURVATURE at 10m scale




                  df         AIC   delta_AIC
---------------  ---  ----------  ----------
curv.null          5   -8425.894   21.032016
curv.tot.add10     6   -8433.138   13.788086
curv.sep.add10     7   -8446.926    0.000000
curv.tot.int10     7   -8432.912   14.013873
curv.sep.int10     9   -8444.917    2.009233



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Curvature at 10m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098826</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.086153&nbsp;&ndash;&nbsp;0.111500</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004524</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007109&nbsp;&ndash;&nbsp;-0.001939</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Curv</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002780</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000408&nbsp;&ndash;&nbsp;0.005151</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.022</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003511</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005885&nbsp;&ndash;&nbsp;-0.001137</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.004</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007069</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.010264&nbsp;&ndash;&nbsp;-0.003874</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.016 / 0.161</td>
</tr>

</table>

<br>
<br>

### SLOPE MEASURE at 10m scale




                   df         AIC    delta_AIC
----------------  ---  ----------  -----------
slope.null          5   -8425.174   22.0609932
slope.tot.add10     6   -8432.853   14.3822126
slope.sep.add10     7   -8446.919    0.3162352
slope.tot.int10     7   -8435.159   12.0761392
slope.sep.int10     9   -8447.235    0.0000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Slope measure at 10m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.097998</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085206&nbsp;&ndash;&nbsp;0.110790</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004548</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007133&nbsp;&ndash;&nbsp;-0.001962</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002741</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000405&nbsp;&ndash;&nbsp;0.005076</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.021</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003597</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005972&nbsp;&ndash;&nbsp;-0.001222</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.003</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 10m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007145</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.010343&nbsp;&ndash;&nbsp;-0.003948</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.016 / 0.164</td>
</tr>

</table>

<br>
<br>
<br>
<br>

### GAP MEASURE at 15m scale




                 df         AIC   delta_AIC
--------------  ---  ----------  ----------
gap.null          5   -8431.954   11.720773
gap.tot.add15     6   -8436.273    7.401347
gap.sep.add15     7   -8443.674    0.000000
gap.tot.int15     7   -8434.992    8.682085
gap.sep.int15     9   -8441.295    2.379466



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Gap measure at 15m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.097669</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.084866&nbsp;&ndash;&nbsp;0.110473</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004432</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007031&nbsp;&ndash;&nbsp;-0.001833</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.004300</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.001909&nbsp;&ndash;&nbsp;0.006691</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002817</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005276&nbsp;&ndash;&nbsp;-0.000358</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.025</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006553</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.010200&nbsp;&ndash;&nbsp;-0.002905</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.015 / 0.163</td>
</tr>

</table>

<br>
<br>

### SOIL ORGANIC MATTER at 15m scale




                 df         AIC   delta_AIC
--------------  ---  ----------  ----------
org.null          5   -8421.508   20.115775
org.tot.add15     6   -8424.568   17.055388
org.sep.add15     7   -8432.681    8.942478
org.tot.int15     7   -8435.223    6.399977
org.sep.int15     9   -8441.623    0.000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Soil organic matter at 15m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.097746</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.084947&nbsp;&ndash;&nbsp;0.110546</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004496</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007099&nbsp;&ndash;&nbsp;-0.001893</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.001500</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003872&nbsp;&ndash;&nbsp;0.000873</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.215</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002150</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004611&nbsp;&ndash;&nbsp;0.000311</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.087</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006670</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.010368&nbsp;&ndash;&nbsp;-0.002971</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA * Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004240</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006556&nbsp;&ndash;&nbsp;-0.001923</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA * Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.001481</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004094&nbsp;&ndash;&nbsp;0.001132</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.267</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.016 / 0.164</td>
</tr>

</table>

<br>
<br>

### CATIONS 15m scale




                     df         AIC   delta_AIC
------------------  ---  ----------  ----------
cations.null          5   -8422.129   17.177508
cations.tot.add15     6   -8425.231   14.075891
cations.sep.add15     7   -8433.630    5.677204
cations.tot.int15     7   -8430.500    8.806589
cations.sep.int15     9   -8439.307    0.000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Cations at 15m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098010</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085251&nbsp;&ndash;&nbsp;0.110768</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004621</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007223&nbsp;&ndash;&nbsp;-0.002018</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Cations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.001769</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.000622&nbsp;&ndash;&nbsp;0.004161</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.147</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002311</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004767&nbsp;&ndash;&nbsp;0.000145</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.065</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.008354</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.012575&nbsp;&ndash;&nbsp;-0.004133</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA * Cations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.003394</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000906&nbsp;&ndash;&nbsp;0.005882</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.008</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA * Cations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.003290</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000236&nbsp;&ndash;&nbsp;0.006343</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.035</strong></td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.018 / 0.164</td>
</tr>

</table>

<br>
<br>

### CURVATURE at 15m scale




                  df         AIC   delta_AIC
---------------  ---  ----------  ----------
curv.null          5   -8425.894   10.521450
curv.tot.add15     6   -8428.582    7.833175
curv.sep.add15     7   -8436.415    0.000000
curv.tot.int15     7   -8427.882    8.533547
curv.sep.int15     9   -8433.898    2.517505



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Curvature at 15m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098982</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.086252&nbsp;&ndash;&nbsp;0.111711</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004621</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007220&nbsp;&ndash;&nbsp;-0.002022</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Curv</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002749</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000373&nbsp;&ndash;&nbsp;0.005125</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.023</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002377</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004827&nbsp;&ndash;&nbsp;0.000072</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.057</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006544</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.010192&nbsp;&ndash;&nbsp;-0.002895</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.014 / 0.159</td>
</tr>

</table>

<br>
<br>

### SLOPE MEASURE at 15m scale




                   df         AIC   delta_AIC
----------------  ---  ----------  ----------
slope.null          5   -8425.174   14.597939
slope.tot.add15     6   -8428.345   11.426459
slope.sep.add15     7   -8436.442    3.330042
slope.tot.int15     7   -8431.903    7.868625
slope.sep.int15     9   -8439.772    0.000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">slope measure at 15m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098054</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085144&nbsp;&ndash;&nbsp;0.110965</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004523</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007122&nbsp;&ndash;&nbsp;-0.001924</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002862</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000520&nbsp;&ndash;&nbsp;0.005205</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.017</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002463</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004914&nbsp;&ndash;&nbsp;-0.000013</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.049</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 15m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006805</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.010459&nbsp;&ndash;&nbsp;-0.003151</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA * Slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002745</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000491&nbsp;&ndash;&nbsp;0.004998</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.017</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA * Slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.000820</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003580&nbsp;&ndash;&nbsp;0.001940</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.560</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.016 / 0.166</td>
</tr>

</table>

<br>
<br>
<br>
<br>

### GAP MEASURE at 20m scale




                 df         AIC   delta_AIC
--------------  ---  ----------  ----------
gap.null          5   -8431.954    8.792525
gap.tot.add20     6   -8436.112    4.634385
gap.sep.add20     7   -8440.746    0.000000
gap.tot.int20     7   -8434.130    6.615594
gap.sep.int20     9   -8438.682    2.063831



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Gap measure at 20m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098125</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085339&nbsp;&ndash;&nbsp;0.110910</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004515</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007118&nbsp;&ndash;&nbsp;-0.001912</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.004212</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.001831&nbsp;&ndash;&nbsp;0.006594</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003143</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005741&nbsp;&ndash;&nbsp;-0.000544</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.018</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006932</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.011312&nbsp;&ndash;&nbsp;-0.002553</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.002</strong></td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.015 / 0.162</td>
</tr>

</table>

<br>
<br>

### SOIL ORGANIC MATTER at 20m scale




                 df         AIC   delta_AIC
--------------  ---  ----------  ----------
org.null          5   -8421.508   13.134271
org.tot.add20     6   -8425.800    8.842250
org.sep.add20     7   -8430.555    4.086436
org.tot.int20     7   -8431.649    2.993077
org.sep.int20     9   -8434.642    0.000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Soil organic matter at 20m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098035</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085272&nbsp;&ndash;&nbsp;0.110797</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004765</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007371&nbsp;&ndash;&nbsp;-0.002159</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.001789</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004181&nbsp;&ndash;&nbsp;0.000603</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.143</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003035</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005660&nbsp;&ndash;&nbsp;-0.000411</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.023</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006857</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.011246&nbsp;&ndash;&nbsp;-0.002469</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.002</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA * Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003692</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006281&nbsp;&ndash;&nbsp;-0.001103</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.005</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA * Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.000866</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003559&nbsp;&ndash;&nbsp;0.001828</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.529</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.015 / 0.161</td>
</tr>

</table>

<br>
<br>

### CATIONS 20m scale




                     df         AIC   delta_AIC
------------------  ---  ----------  ----------
cations.null          5   -8422.129   9.5493055
cations.tot.add20     6   -8426.392   5.2866747
cations.sep.add20     7   -8431.438   0.2411213
cations.tot.int20     7   -8427.425   4.2533460
cations.sep.int20     9   -8431.679   0.0000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Cations at 20m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098545</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085765&nbsp;&ndash;&nbsp;0.111326</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004819</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007423&nbsp;&ndash;&nbsp;-0.002215</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Cations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002015</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.000386&nbsp;&ndash;&nbsp;0.004416</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.100</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003199</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005814&nbsp;&ndash;&nbsp;-0.000583</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.017</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007134</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.011523&nbsp;&ndash;&nbsp;-0.002744</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.001</strong></td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.014 / 0.160</td>
</tr>

</table>

<br>
<br>

### CURVATURE at 20m scale




                  df         AIC   delta_AIC
---------------  ---  ----------  ----------
curv.null          5   -8425.894    7.881079
curv.tot.add20     6   -8429.476    4.298595
curv.sep.add20     7   -8433.775    0.000000
curv.tot.int20     7   -8427.720    6.055126
curv.sep.int20     9   -8430.067    3.707826



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Curvature at 20m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.099337</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.086608&nbsp;&ndash;&nbsp;0.112065</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004734</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007336&nbsp;&ndash;&nbsp;-0.002132</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Curv</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002723</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000344&nbsp;&ndash;&nbsp;0.005101</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.025</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.002990</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005590&nbsp;&ndash;&nbsp;-0.000391</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.024</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.006727</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.011110&nbsp;&ndash;&nbsp;-0.002344</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.003</strong></td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.014 / 0.158</td>
</tr>

</table>

<br>
<br>

### SLOPE MEASURE at 20m scale




                   df         AIC   delta_AIC
----------------  ---  ----------  ----------
slope.null          5   -8425.174   9.4144826
slope.tot.add20     6   -8429.211   5.3772732
slope.sep.add20     7   -8434.140   0.4487028
slope.tot.int20     7   -8428.670   5.9183697
slope.sep.int20     9   -8434.588   0.0000000



<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Slope measure at 20m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Log(sapling growth)</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.098602</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.085761&nbsp;&ndash;&nbsp;0.111442</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.004756</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007358&nbsp;&ndash;&nbsp;-0.002154</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.002781</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.000439&nbsp;&ndash;&nbsp;0.005123</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.020</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.003115</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.005717&nbsp;&ndash;&nbsp;-0.000512</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.019</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 20m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.007053</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.011441&nbsp;&ndash;&nbsp;-0.002665</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.002</strong></td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">3387</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.014 / 0.162</td>
</tr>

</table>

<br>
<br>
<br>
<br>


### TESTING FOR SPATIAL AUTOCORRELATION

![](mods_growth_files/figure-html/unnamed-chunk-82-1.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-2.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-3.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-4.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-5.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-6.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-7.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-8.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-9.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-10.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-11.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-12.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-13.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-14.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-15.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-16.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-17.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-18.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-19.png)<!-- -->![](mods_growth_files/figure-html/unnamed-chunk-82-20.png)<!-- -->

