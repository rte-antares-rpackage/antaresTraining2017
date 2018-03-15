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

Unsupplied energy scenario / Data
========================================================
type: text-slide

<!---
TODO rajouter une image de l'aplication
-->

***exercise/import data*** : 
<small>
- Run antaresVizualisation

- Select the folder "dataTyndp"

- Select the simulation "20170830-1049eco-reference.h5"

- Click on "Set Simulation"

- Imports all areas and links 

- Click on "Validate & import data"

- Click on "Launch Analysis"

- Click on "tsPlot"

- Click on "H5request"

- Import mcYear 4 

</small>

<div class="footer"></div>

Unsupplied energy scenario / tsPlot
========================================================
type: text-slide


***exercise*** :in the tab "tsPlot" and "type : monotone/times series/heat map" 
- Find the country who have the most of unsupplied energy for the mcYear 4 between "France", "Germany", "Belgium", "Netherlands", "Portugal", "Austria" and "Great Britain"
- For this country, which month have the most of unsupplied energy
- Find the date when the maximum of unsupplied energy is reached, in the following we will refers to this country by <span style="color:red;">Mystery</span> and the date by <span style="color:red;">Ttime</span>
- Why there is unsupplied energy for this year in <span style="color:red;">Mystery</span>? --> We will see this thanks to **prodStack**

Unsupplied energy scenario / prodStack
========================================================
type: text-slide


***exercise*** : in the tab "prodStack" 
- Import mcYear 4 and 12
- Plot the prodStack for <span style="color:red;">Mystery</span> and for the week containing <span style="color:red;">Ttime</span> for the year 4
- Find the amount of wind production and import/export 
- Change the parameter mcYear to **12** and find the amount of wind production and import/export 
- Does <span style="color:red;">Mystery</span> import or export for the year **12** ?
- To whom <span style="color:red;">Mystery</span> is importing or exporting for the year 12 ? --> We will see this thanks to **exchangesStack**

Unsupplied energy scenario / exchangesStack
========================================================
type: text-slide

***exercise*** : 
in the tab "exchangesStack": 
- Import mcYear 4 and 12
- Change the "area" to <span style="color:red;">Mystery</span>
- For the year 12, to whom <span style="color:red;">Mystery</span> is importing or exporting ? 
- For the year 4, to whom <span style="color:red;">Mystery</span> is importing or exporting ? 
- For <span style="color:red;">Ttime</span> and the year 4, are there null flows between this country and others ? if yes, why ? --> We will see this thanks to **plotMap**

Unsupplied energy scenario / plotMap - Layout
========================================================
type: text-slide

***exercise/import data*** : in the tab "plotMap/Current Layout":
- import the file "dataTyndp/mapLayoutTyndp.RDS" with the button "Browse...""

Unsupplied energy scenario / Map 
========================================================
type: text-slide

***exercise/import data*** : in the tab "plotMap/Map":
<small>
- Import mcYear 4 and 12 and change the parameter mcYear to 4
- Change the parameter DateRange for the day containing <span style="color:red;">Ttime</span>
- In the tab "Areas", change the parameter "color"" to "LOAD"
- Click on update 
- In the tab "Areas", change the parameter "Size" to "H. ROR", "PSP", "MISC. NDG", "WIND", "SOLAR", "NUCLEAR", "LIGNITE", "GAS", "COAL", "OIL", "MIX. FUEL", "MISC. DTG", "H. STOR"
- Click on update 
</small>

<div class="footer"></div>

Unsupplied energy scenario / Map with miniplots
========================================================
type: text-slide

***exercise/import data*** : in the tab "plotMap/Map":
- In the tab "Areas/miniPlot", change the parameter "areaCharType" to "pie chart", click on update 
- In the tab "Areas/miniPlot", check the box "sizeMiniPlot", click on update 
- In the tab "Areas", change the parameter "Popup" to "UNSP. ENRG", "SPIL. ENRG", "DTG MRG", "AVL DTG", "MAX MRG", "MRG. PRICE", "BALANCE", click on update 
- Click on one pie chart

Unsupplied energy scenario / Map for links
========================================================
type: text-slide

***exercise/import data*** : in the tab "plotMap/Map":

- In the tab "Links", change the parameter "Color" to "CONG. PROP +"
- Click on update 
- In the tab "Links", change the parameter "Width" to "FLOW LIN."
- Click on update 
- Click on one link  
- In the tab "Links", change the parameter "Popup" to "CONG. PROP -", "MARG. COST"
- Click on update 
- Click on one link  

Unsupplied energy scenario / Questions
========================================================
type: text-slide

***exercise*** : in the tab "plotMap/Map":

- On the map, click on play and pause when you reach <span style="color:red;">Ttime</span>
- Is <span style="color:red;">Mystery</span> imports or exports? to whom ? 
- Are there null flows between <span style="color:red;">Mystery</span> and others ? if yes, why ? 
- Are there links not congestionned between Netherlands and others countries ? why ? 
- Change the parameter mcYear to 12
- Click on update
- Is <span style="color:red;">Mystery</span> imports or exports? to whom and why ? 
- It's better to compare the two maps in one screen --> We will see this thanks to **Data/compare**

Unsupplied energy scenario / Compare
========================================================
type: text-slide

***exercise/import data*** : in the tab "Data":
- Add **mcYear** in the parameter "plotMap" 
- Click on "Launch Analysis"
- Go to the tab "plotMap/Map"

Unsupplied energy scenario / Compare plotMap
========================================================
type: toBig

***exercise/import data*** : in the tab "plotMap/Map":<small>
- Import mcYear 4 and 12
- Reconfigure the maps with the previous parameters (Areas, color, size, popup etc.) in one step
- Click on the first graph and choose the mcYear 4 
- Click on the second graph and choose the mcYear 12 
- Click on the update button 
- Change the parameter DateRange for the day containing <span style="color:red;">Ttime</span>
- Click on play on one map and pause when you reach <span style="color:red;">Ttime</span> 
- At <span style="color:red;">Ttime</span> , which is the most important production in Germany for year 4 and for year 12 ?
- Same question for Great Britain<small>
- *The future is unpredictable so we try several scenarios to have an idea about the possible futures and increase the chance to make a good decision (more thermal capacities, more renewable energy etc.) --> We will see this thanks to* **Data - scenarios**</small>
</small>
<div class="footer"></div>

Unsupplied energy scenario / Data - scenarios
========================================================
type: text-slide

***exercise/import data*** : in the tab "Data":
<small>
- Click in the tab "Import Data"
- Select the simulation "20170112-1832eco-pascontraintenbmax.h5"
- Click on "Set simulation"
- Imports all areas and links 
- Click on "Validate & import data"
- Come back to the tab "Import Data"
- Select a new simulation "201710118-0902eco-aveccontraintenbmax.h5"
- Click on "Set simulation"
- Imports all areas and links
- Click on "Validate & import data"
- delete "mcYear" in the parameter "plotMap"
- Click on "Launch Analysis"
</small>
<div class="footer"></div>

Unsupplied energy scenario / Data - scenarios - tsPlot
========================================================
type: text-slide

***exercise*** : In the tab "tsPlot":
- Import mcYear 4 
- Change DateRange to contain the all year
- Plot the nuclear monotone for France, Germany and Great Britain 
- Are there differences between scenarios ? if yes, why ? 
- Plot the nuclear density for France for the all year
- Are there differences between scenarios ? 
- Plot the nuclear heatmap for France
- For which month there is the most differences between scenarios ? 


antaresViz is great but why I should learn R ? 
========================================================
type: text-slide

. antaresViz is designed to respond to general request but not for all requests. For particular studies we need particular representations. 

. You have a lot of available function in antaresPackages, it will be a lost of time (and money ?) to recode them in python, VBA, perl or any other scripting language. 

. If you learn R you will be able to use scripts from ANTARES users and you will also be able to provide scripts to other. You can propose your ideas on github.  

. You be able to use a lot of statical packages (10 thousand on CRAN) : kmeans, rpart, caret, FactoMineR etc.

<small>
*Today you will learn a few things form R, if you want to learn more about R and DataScience*, ***RTE can propose you others training***. 
</small>
<div class="footer"></div>

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
[1] 2.543397
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