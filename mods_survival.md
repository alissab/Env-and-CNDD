---
title: "Brown et al. Survival models"
author: "Alissa Brown"
date: "August 2020"
output:
  html_document:
    keep_md: true
---





Starting with 5m spatial scale: Run survival models for each environmental covariate, perform model selection, summarize results of best-performing model. Repeat for 10m, 15m, and 20m scales. Then evaluate variograms of best-performing models to check for spatial autocorrelation.

### GAP MEASURE at 5m scale




                df        AIC   delta_AIC
-------------  ---  ---------  ----------
gap.null         4   3981.997   1.2866938
gap.tot.add5     5   3983.237   2.5258704
gap.sep.add5     6   3982.251   1.5402191
gap.tot.int5     6   3980.711   0.0000000
gap.sep.int5     8   3980.738   0.0275189

<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Gap measure at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Sapling survival</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Odds Ratios</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">5.917025</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">4.118500&nbsp;&ndash;&nbsp;8.500956</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.008012</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.925219&nbsp;&ndash;&nbsp;1.098213</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.855</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.920570</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.852860&nbsp;&ndash;&nbsp;0.993656</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.034</strong></td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">4277</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.002 / 0.153</td>
</tr>

</table>

<br>
<br>

### SOIL ORGANIC MATTER at 5m scale




                df        AIC   delta_AIC
-------------  ---  ---------  ----------
org.null         4   3962.326    0.000000
org.tot.add5     5   3964.061    1.734843
org.sep.add5     6   3963.559    1.232610
org.tot.int5     6   3965.367    3.041022
org.sep.int5     8   3966.382    4.056350

<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Soil organic matter at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Sapling survival</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Odds Ratios</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">5.993556</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">4.188635&nbsp;&ndash;&nbsp;8.576234</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.001142</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.918909&nbsp;&ndash;&nbsp;1.090735</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.979</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Organic</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.824501</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.763722&nbsp;&ndash;&nbsp;0.890118</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">4277</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.010 / 0.155</td>
</tr>

</table>

<br>
<br>

### CATIONS at 5m scale




                    df        AIC   delta_AIC
-----------------  ---  ---------  ----------
cations.null         4   3958.259    0.000000
cations.tot.add5     5   3959.897    1.637609
cations.sep.add5     6   3959.427    1.167976
cations.tot.int5     6   3961.842    3.582480
cations.sep.int5     8   3963.271    5.011868

<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Soil cations at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Sapling survival</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Odds Ratios</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">5.916603</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">4.120123&nbsp;&ndash;&nbsp;8.496396</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.001167</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.918751&nbsp;&ndash;&nbsp;1.090977</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.979</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Cations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.237817</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.144492&nbsp;&ndash;&nbsp;1.338753</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">4277</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.012 / 0.161</td>
</tr>

</table>

<br>
<br>

### CURVATURE at 5m scale




                 df        AIC   delta_AIC
--------------  ---  ---------  ----------
curv.null         4   3986.411   0.7926563
curv.tot.add5     5   3987.896   2.2770540
curv.sep.add5     6   3987.103   1.4845368
curv.tot.int5     6   3985.619   0.0000000
curv.sep.int5     8   3986.041   0.4224457

<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Curvature at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Sapling survival</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Odds Ratios</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">5.863947</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">4.074304&nbsp;&ndash;&nbsp;8.439693</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.014549</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.931355&nbsp;&ndash;&nbsp;1.105175</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.741</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Curvature</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.993650</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.917899&nbsp;&ndash;&nbsp;1.075653</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.875</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">4277</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.000 / 0.153</td>
</tr>

</table>

<br>
<br>

### SLOPE at 5m scale




                  df        AIC   delta_AIC
---------------  ---  ---------  ----------
slope.null         4   3985.265    4.270355
slope.tot.add5     5   3986.689    5.694555
slope.sep.add5     6   3986.009    5.014067
slope.tot.int5     6   3985.534    4.539151
slope.sep.int5     8   3980.995    0.000000

<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Slope at 5m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Sapling survival</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Odds Ratios</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">5.951998</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">4.146529&nbsp;&ndash;&nbsp;8.543598</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.017457</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.933785&nbsp;&ndash;&nbsp;1.108627</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.693</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.963918</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.891148&nbsp;&ndash;&nbsp;1.042631</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.359</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.026618</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.948052&nbsp;&ndash;&nbsp;1.111695</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.518</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA at 5m</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.981043</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.890047&nbsp;&ndash;&nbsp;1.081342</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.700</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Het BA * slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.082453</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.996652&nbsp;&ndash;&nbsp;1.175640</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.060</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Con BA * slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.899737</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.801964&nbsp;&ndash;&nbsp;1.009430</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.072</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">4277</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.006 / 0.155</td>
</tr>

</table>

<br>
<br>
<br>
<br>

### GAP MEASURE at 10m scale




                 df        AIC   delta_AIC
--------------  ---  ---------  ----------
gap.null          4   3981.997    1.382018
gap.tot.add10     5   3981.830    1.214422
gap.sep.add10     6   3980.615    0.000000
gap.tot.int10     6   3983.618    3.002486
gap.sep.int10     8   3981.836    1.220715

<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Gap measure at 10m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Sapling survival</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Odds Ratios</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">5.917025</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">4.118500&nbsp;&ndash;&nbsp;8.500956</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.008012</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.925219&nbsp;&ndash;&nbsp;1.098213</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.855</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Gap</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.920570</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.852860&nbsp;&ndash;&nbsp;0.993656</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.034</strong></td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">4277</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.002 / 0.153</td>
</tr>

</table>

<br>
<br>

### SOIL ORGANIC MATTER at 10m scale




                 df        AIC   delta_AIC
--------------  ---  ---------  ----------
org.null          4   3962.326   0.0000000
org.tot.add10     5   3963.783   1.4575913
org.sep.add10     6   3963.201   0.8749531
org.tot.int10     6   3965.257   2.9306237
org.sep.int10     8   3966.512   4.1860166

<br>
<br>

### CATIONS at 10m scale




                     df        AIC   delta_AIC
------------------  ---  ---------  ----------
cations.null          4   3958.259   0.3500255
cations.tot.add10     5   3959.256   1.3465110
cations.sep.add10     6   3957.909   0.0000000
cations.tot.int10     6   3960.793   2.8843007
cations.sep.int10     8   3960.719   2.8096100

<br>
<br>

### CURVATURE at 10m scale




                  df        AIC   delta_AIC
---------------  ---  ---------  ----------
curv.null          4   3986.411   1.5429185
curv.tot.add10     5   3986.875   2.0069161
curv.sep.add10     6   3985.776   0.9071305
curv.tot.int10     6   3984.869   0.0000000
curv.sep.int10     8   3985.812   0.9433158

<br>
<br>

### SLOPE at 10m scale




                   df        AIC   delta_AIC
----------------  ---  ---------  ----------
slope.null          4   3985.265   0.7290073
slope.tot.add10     5   3985.603   1.0672754
slope.sep.add10     6   3984.536   0.0000000
slope.tot.int10     6   3987.039   2.5034028
slope.sep.int10     8   3985.995   1.4590499

<table style="border-collapse:collapse; border:none;">
<caption style="font-weight: bold; text-align:left;">Slope at 10m scale</caption>
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Sapling survival</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Odds Ratios</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">(Intercept)</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">5.875603</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">4.085012&nbsp;&ndash;&nbsp;8.451067</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Diameter</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">1.015121</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.931902&nbsp;&ndash;&nbsp;1.105770</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.731</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Slope</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.958096</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.886759&nbsp;&ndash;&nbsp;1.035170</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.278</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N <sub>species</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">30</td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">4277</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.001 / 0.153</td>
</tr>

</table>

<br>
<br>
<br>
<br>

### GAP MEASURE at 15m scale




                 df        AIC   delta_AIC
--------------  ---  ---------  ----------
gap.null          4   3981.997    0.000000
gap.tot.add15     5   3983.657    1.659761
gap.sep.add15     6   3984.892    2.894588
gap.tot.int15     6   3984.991    2.993498
gap.sep.int15     8   3987.288    5.290498

<br>
<br>

### SOIL ORGANIC MATTER at 15m scale




                 df        AIC   delta_AIC
--------------  ---  ---------  ----------
org.null          4   3962.326    0.000000
org.tot.add15     5   3964.278    1.951692
org.sep.add15     6   3965.795    3.468799
org.tot.int15     6   3966.258    3.931808
org.sep.int15     8   3968.758    6.431924

<br>
<br>

### CATIONS at 15m scale




                     df        AIC   delta_AIC
------------------  ---  ---------  ----------
cations.null          4   3958.259    0.000000
cations.tot.add15     5   3960.255    1.995667
cations.sep.add15     6   3961.442    3.183323
cations.tot.int15     6   3961.349    3.090129
cations.sep.int15     8   3964.567    6.308277

<br>
<br>

### CURVATURE at 15m scale




                  df        AIC   delta_AIC
---------------  ---  ---------  ----------
curv.null          4   3986.411    1.425303
curv.tot.add15     5   3988.331    3.344560
curv.sep.add15     6   3989.699    4.713251
curv.tot.int15     6   3984.986    0.000000
curv.sep.int15     8   3987.941    2.954698

<br>
<br>

### SLOPE at 15m scale




                   df        AIC   delta_AIC
----------------  ---  ---------  ----------
slope.null          4   3985.265    0.000000
slope.tot.add15     5   3987.118    1.852809
slope.sep.add15     6   3988.477    3.212340
slope.tot.int15     6   3986.840    1.574465
slope.sep.int15     8   3986.910    1.645057

<br>
<br>
<br>
<br>

### GAP MEASURE at 20m scale




                 df        AIC   delta_AIC
--------------  ---  ---------  ----------
gap.null          4   3981.997    0.000000
gap.tot.add20     5   3983.127    1.129194
gap.sep.add20     6   3984.916    2.918660
gap.tot.int20     6   3983.971    1.973496
gap.sep.int20     8   3987.666    5.668533

<br>
<br>

### SOIL ORGANIC MATTER at 20m scale




                 df        AIC   delta_AIC
--------------  ---  ---------  ----------
org.null          4   3962.326    0.000000
org.tot.add20     5   3964.323    1.997064
org.sep.add20     6   3966.207    3.881474
org.tot.int20     6   3965.691    3.364901
org.sep.int20     8   3968.975    6.649462

<br>
<br>

### CATIONS at 20m scale




                     df        AIC   delta_AIC
------------------  ---  ---------  ----------
cations.null          4   3958.259    0.000000
cations.tot.add20     5   3960.160    1.900441
cations.sep.add20     6   3961.880    3.620626
cations.tot.int20     6   3961.734    3.474375
cations.sep.int20     8   3965.416    7.156550

<br>
<br>

### CURVATURE at 20m scale




                  df        AIC   delta_AIC
---------------  ---  ---------  ----------
curv.null          4   3986.411    0.000000
curv.tot.add20     5   3987.759    1.347627
curv.sep.add20     6   3989.580    3.168061
curv.tot.int20     6   3988.061    1.649369
curv.sep.int20     8   3991.019    4.607257

<br>
<br>

### SLOPE at 20m scale




                   df        AIC   delta_AIC
----------------  ---  ---------  ----------
slope.null          4   3985.265    1.452492
slope.tot.add20     5   3986.409    2.596427
slope.sep.add20     6   3988.229    4.416248
slope.tot.int20     6   3983.813    0.000000
slope.sep.int20     8   3986.159    2.346830

<br>
<br>
<br>
<br>

TESTING FOR SPATIAL AUTOCORRELATION

![](mods_survival_files/figure-html/unnamed-chunk-49-1.png)<!-- -->![](mods_survival_files/figure-html/unnamed-chunk-49-2.png)<!-- -->![](mods_survival_files/figure-html/unnamed-chunk-49-3.png)<!-- -->![](mods_survival_files/figure-html/unnamed-chunk-49-4.png)<!-- -->![](mods_survival_files/figure-html/unnamed-chunk-49-5.png)<!-- -->![](mods_survival_files/figure-html/unnamed-chunk-49-6.png)<!-- -->

