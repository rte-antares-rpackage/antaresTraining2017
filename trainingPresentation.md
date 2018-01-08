Training packages R / ANTARES
================================================
css: antaresTraining2017.css
author: Jalal-Edine Zawam
date: 29-11-2017
autosize: true

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 
-->

Agenda
========================================================
<br>
<br>
<br>

>1. appAntaresViz
>1. R and RStudio
>2. antaresRead
>3. antaresProcessing
>4. antaresViz





appAntaresViz
========================================================
title: false
type: first-title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 
-->

appAntaresViz

Lets try appAntaresViz
========================================================
type: antaresViz
title: false

Lets try appAntaresViz


antaresViz is great but why I should learn R ? 
========================================================
type: text-slide

. antaresViz is designed to respond to general request but not for all requests. For particular studies we need particular representations. 

. You have a lot of available function in antaresPackages, it will be a lost of time (and money ?) to recode them in python, VBA, perl or any other scripting language. 

. If you learn R you will be able to use scripts from ANTARES users and you will also be able to provide scripts to other. You can propose your ideas on github.  

. You be able to use a lot of statical packages (10 thousand on CRAN) : kmeans, rpart, caret, FactoMineR etc.

. Today you will learn a few things form R, if you want to learn more about R and DataScience, ***RTE can propose you others training***. 

What is R?
========================================================
type: text-slide

- R is a scientific development software specialized in calculation and statistical analysis

- R is an open source project

- R is a cross-platform software (linux, mac, windows ...) like ANTARES

- R is a language.


Creating objects and assigning values in R
========================================================
type: code-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 
-->

You can type an expression without assigning its value to an object


```r
(10 + 9) * 8
```

```
[1] 152
```

An object can be created with the operator assign <-

```r
firstObject <- 15 ;firstObject
```

```
[1] 15
```

After this assignment, the object "firstObject" contains the value 15. Another assignment to the same object will change the content.

```r
firstObject <- 3+rnorm(n=1) ;firstObject
```

```
[1] 1.727134
```


Objects and memory in R
========================================================
type: code-slide

List object in memory 

```r
ls()
```

```
[1] "firstObject"
```

```r
A<-34;ls()
```

```
[1] "A"           "firstObject"
```

Remove objects from memory

```r
ls();rm(A)
```

```
[1] "A"           "firstObject"
```

```r
ls()
```

```
[1] "firstObject"
```

<div class="footer"></div>

What is RStudio?
========================================================
type: text-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 
-->

<br>

RStudio is an integrated development environment (IDE) for R. It includes a console, syntax-highlighting editor that supports direct code execution, as well as tools for plotting, history, debugging and workspace management. 


antaresRead
========================================================
title: false
type: first-title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 
-->

antaresRead


Install the package "antaresRead"
========================================================
type: code-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 
-->

Like any other package...

```r
install.packages("antaresRead")
```

Major functions 
<table class="table table-striped table-hover table-condensed table-responsive" style="font-size: 40px; margin-left: auto; margin-right: auto;">
<thead><tr>
<th style="text-align:left;">   </th>
   <th style="text-align:left;"> functions </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> setSimulationPath </td>
   <td style="text-align:left;"> Set Path to an ANTARES simulation </td>
  </tr>
<tr>
<td style="text-align:left;"> readAntares </td>
   <td style="text-align:left;"> Read the data of an ANTARES simulation </td>
  </tr>
<tr>
<td style="text-align:left;"> removeVirtualAreas </td>
   <td style="text-align:left;"> Remove virtual areas </td>
  </tr>
<tr>
<td style="text-align:left;"> showAliases </td>
   <td style="text-align:left;"> Show aliases for variables </td>
  </tr>
<tr>
<td style="text-align:left;"> getAreas, getLinks, getDistricts </td>
   <td style="text-align:left;"> Select and exclude areas, distructs and links </td>
  </tr>
<tr>
<td style="text-align:left;"> readClusterDesc </td>
   <td style="text-align:left;"> Import clusters Description </td>
  </tr>
<tr>
<td style="text-align:left;"> readInputTS </td>
   <td style="text-align:left;"> Read Input Time Series </td>
  </tr>
</tbody>
</table>

get help

```r
## ??namePackage::function
??antaresRead::readAntares
```

<div class="footer"></div>

First step : set your simulation path and read the data
========================================================
type: code-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 
-->


```r
myPath<-"E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030"
setSimulationPath(myPath, "20170830-1049eco-reference")
```

```
Antares project 'TYNDP2018 PEMS ST2030' (E:/ANTARES/Exemple_antares/2_exemple_etudes_importantes/TYNDP/ST2030/ST2030)
Simulation 'Reference'
Mode Economy

Content:
 - synthesis: TRUE
 - year by year: TRUE
 - MC Scenarios: FALSE
 - Number of areas: 73
 - Number of districts: 0
 - Number of links: 210
 - Number of Monte-Carlo years: 34
```

```r
suppressWarnings(
  myData<-readAntares(
  areas = "all", 
  links="all", 
  clusters = "all", 
  linkCapacity = TRUE,
  mustRun = TRUE,
  showProgress = FALSE
)
)
```

<div class="footer"></div>

Consolidated data : Remove your virtual areas and correct the initial data
========================================================
type: first-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 
-->

What does this function ? 

```r
??antaresRead::removeVirtualAreas
```



```r
myConData<-removeVirtualAreas(
   x=myData,
   storageFlexibility = getAreas(select = c("pum", "tur")),
   production = getAreas(select = c("z_dsr", "y_mul"))
 )
```

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

TODO TD1

-->

getAreas and getLinks
========================================================
type: title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

***exercise*** :

- Compute the number of areas without virtual areas

- Compute the number of links without virtual areas

***get help***: 

```r
??antaresRead::getAreas
??antaresRead::getLinks
```

Data.table
========================================================
type: title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

- DT[<span style="color:blue"> i </span>,  <span style="color:green">  j </span>, <span style="color:red">  by </span>]

- subset rows using <span style="color:blue"> i </span>

- then calculate <span style="color:green"> j </span>

- grouped <span style="color:red"> by  </span>

You can learn the basics about data.table with the  [vignette.](https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html)

You can also found the cheat sheet [here.](https://www.r-bloggers.com/the-data-table-cheat-sheet/)


antaresDataList : List of date.tables
========================================================
type: title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->
- readAntares return a list of data.tables. 

- Data.table is a list of vector with equal length. 

***exercise*** :

- Compute the number of areas with unsupplied energy 

- Compute the number of areas with spilled energy

- Compute the number of links with congestion 



antaresDataList : use data.table
========================================================
type: title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

***exercise*** :

- Compute the sum of the spilled energy by area and order the result by the spilled energy

- Compute the sum of the unsupplied energy by area and order the result by the unsupplied energy


Explain the result for unsupplied energy in France: with rpart or others statical packages FactoMineR, kmeans
========================================================
type: explainTheResult

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->


Explain the result for unsupplied energy in France without some variables
========================================================
type: explainTheResult2

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

Explain the result with some plots
========================================================
title:no
type:first-title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

Explain the result with some plots


antaresViz : prodStack, exchangesStack and plot
========================================================
type: title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

***exercise*** :

- Get the first year and the first date where there is more than 700MW of unsupplied energy in France and use prodStack to visualize the production stack for this week.  

- Visualise the evolution of the echanges between France and other countries with exchangesStack. 

- Plot the price for this week.

antaresViz : plotMap
========================================================
type: title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

***exercise*** :

- For the date mentioned before represend the mix of production in Europe and represend the echanges between areas.  



antaresProcessing
========================================================
title: false
type: second-title-slide

<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 
-->

antaresProcessing

antaresProcessing
========================================================
type: code-slide

***Major functions***

<table class="table table-striped table-hover table-condensed table-responsive" style="font-size: 40px; margin-left: auto; margin-right: auto;">
<thead><tr>
<th style="text-align:left;">   </th>
   <th style="text-align:left;"> functions </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> Surplus, surplusClusters, surplusSectors </td>
   <td style="text-align:left;"> Compute economic surplus </td>
  </tr>
<tr>
<td style="text-align:left;"> addDownwardMargin, addUpwardMargin </td>
   <td style="text-align:left;"> Add downward and upward margins of areas </td>
  </tr>
<tr>
<td style="text-align:left;"> addExportAndImport </td>
   <td style="text-align:left;"> Add export and import of areas or districts </td>
  </tr>
<tr>
<td style="text-align:left;"> addNetLoad </td>
   <td style="text-align:left;"> Add net load of areas </td>
  </tr>
<tr>
<td style="text-align:left;"> compare </td>
   <td style="text-align:left;"> Compare two antaresDataTable </td>
  </tr>
<tr>
<td style="text-align:left;"> Modulation </td>
   <td style="text-align:left;"> Compute the modulation of cluster units </td>
  </tr>
</tbody>
</table>

<div class="footer"></div>

Upward margin
========================================================
type: code-slide


<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

***exercise*** :

- Compute the upward margin for the all simulations and represent it in a map for the dates mentioned before. 


You can propose new features or report bugs on github
========================================================
type: github 
title: no


<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

<a href="https://github.com/rte-antares-rpackage">You can propose new features or report bugs on github</a>

Thanks
========================================================
title: no
type: thanks


<!---
This is a comment, it will not be included in this presentation. 

You can write your notes here. 

You can use the r function lenght. 
-->

Thanks you for your attention, don't forget R is great and you can call us anytime if you need help. 
