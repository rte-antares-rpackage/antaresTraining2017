library(antaresRead)

library(antaresProcessing)
library(antaresViz)
library(data.table)
library(rpart)
library(rpart.plot)
library(magrittr)
library(manipulateWidget)

#antaresRead ===========

myPath<-"E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030"
setSimulationPath(myPath, "20170830-1049eco-reference")

myData<-readAntares(
  areas = "all", 
  links="all", 
  clusters = "all", 
  linkCapacity = TRUE,
  mustRun = TRUE,
  showProgress = FALSE
)

myConData<-removeVirtualAreas(
  x=myData,
  storageFlexibility = getAreas(select = c("pum", "tur", "z_dsr", "y_mul"))
)

#54 Compute the number of areas without virtual areas
length(getAreas(exclude = getAreas(select = c("z_dsr", "y_mul", "pum", "tur"))))

virtuarAreas<-getAreas(select = c("z_dsr", "y_mul", "pum", "tur"))
realAreas<-getAreas(exclude = virtuarAreas)

#105 Compute the number of links without virtual areas
length(getLinks(areas = realAreas, exclude = virtuarAreas))


# 19 Compute the number of areas with unsupplied energy 

length(unique(myConData$areas[`UNSP. ENRG`>0]$area))

# 24 Compute the number of areas with unsupplied energy 

length(unique(myConData$areas[`SPIL. ENRG`>0]$area))

# 24 Compute the number of areas with unsupplied energy 

length(unique(myConData$links[`CONG. PROB +`>0]$link))

# ES Compute the sum of the spilled energy by area

myConData$areas[, sumSpilled:=sum(`SPIL. ENRG`), by=area]
unique(myConData$areas[order(sumSpilled, decreasing = TRUE),.(area, sumSpilled),])

myConData$areas[, sumUnspilled:=sum(`UNSP. ENRG`), by=area]
unique(myConData$areas[order(sumUnspilled, decreasing = TRUE),.(area, sumUnspilled),])


# rpart =====
#myMergeDataSelect<-myMergeData[, .SD, .SDcols= names(myMergeData) %like% IdAndVar & !names(myMergeData) %like% NoVar]

onlyAreaNoFar<-c("fr", "es", "pt", "ch", "itn", "itcn", "be", "gb", "ni", "ie", "nl", "de", "nos", "pl", "cz")
unique(myConData$areas[area %in% onlyAreaNoFar]$area)

mySubset<-subset(myConData, areas=onlyAreaNoFar)
myMergeSubset<-mergeAllAntaresData(mySubset)

myRpart<-rpart(`UNSP. ENRG_fr`~. - `UNSP. ENRG_std_fr` - `OV. COST_fr` - `UNSP. ENRG_max_fr` - `MAX MRG_fr` - `MAX MRG_min_fr` - `MAX MRG_std_fr`, data=myMergeSubset[`UNSP. ENRG_fr`>0])
rpart.plot(myRpart)

modRpart(myMergeSubset[, .SD, .SDcols= names(myMergeSubset) %like% c("fr", "de", "gb", "pl", "be", "nl") ])


# plot, plotMap, prodStack, exchangesStack  ======
myConData$areas[`UNSP. ENRG`>400 & area=="fr", ] %>% View

res<-myConData$areas[`UNSP. ENRG`>400 & area=="fr", ]$time[1]

myConData$areas[ area=="fr",  ] %>% View

# get the first time Id where unsuplied energy > 400MW for Fr

for(i in 1:50){
  myDataFr<-readAntares(areas = "fr", mcYears = i, showProgress = FALSE)
  if(!is.na(myDataFr[`UNSP. ENRG`>400 & area=="fr", ]$time[1])){
    print(paste0("mcYear :", i))
    print(paste0("time :", myDataFr[`UNSP. ENRG`>400 & area=="fr", ]$time[1]))
    print(paste0("day :", myDataFr[`UNSP. ENRG`>400 & area=="fr", ]$day[1]))
    break()    
  }
}

# mcYear 4 time "2018-01-05 18:00:00 UTC"

# use prodStack for this id 
prodStack(myDataFr, dateRange=c("2018-01-01 00:00:00", "2018-01-07 23:00:00"), interactive = FALSE, area="fr")

myDataFr<-readAntares(areas = "fr", mcYears = 4, showProgress = FALSE, links = "all", linkCapacity = TRUE)
exchangesStack(myDataFr, dateRange=c("2018-01-01 00:00:00", "2018-01-07 23:00:00"), interactive = FALSE, area="fr")


#with consolidate data 

myDataFr<-readAntares(links = getLinks(areas = c("z_dsr450", "y_mul", "pum", "tur", "fr")), areas = getAreas(select = c("z_dsr450", "y_mul", "pum", "tur", "fr")), mcYears = 4, linkCapacity = TRUE)

myConDataFr<-removeVirtualAreas(
  x=myDataFr,
  storageFlexibility = getAreas(select = c("pum", "tur")),
  newCols = FALSE, 
  reassignCosts = TRUE
)


myConDataFr<-removeVirtualAreas(
  x=myConDataFr,
  production = getAreas(select = c("z_dsr", "y_mul")),
  newCols = FALSE, 
  reassignCosts = TRUE
)

unique(myConDataFr$links$link)


myConDataFr<-removeVirtualAreas(
  x=myDataFr,
  storageFlexibility = getAreas(select = c("pum", "tur")),
  production = getAreas(select = c("z_dsr", "y_mul")),
  newCols = FALSE, 
  reassignCosts = TRUE
)

prodStack(myConDataFr, dateRange=c("2018-01-01 00:00:00", "2018-01-07 23:00:00"), interactive = FALSE, area="fr")

prodStack(myDataFr, dateRange=c("2018-01-01 00:00:00", "2018-01-07 23:00:00"), interactive = FALSE, area="fr")


exchangesStack(myConDataFr, dateRange=c("2018-01-01 00:00:00", "2018-01-07 23:00:00"), interactive = FALSE, area="fr")

plot(myConDataFr$areas, dateRange=c("2018-01-01 00:00:00", "2018-01-07 23:00:00"), interactive = FALSE, elements="fr", variable="MRG. PRICE", mcYear=4, type="ts")



## plotMap and mapLayout ======

mlTyndp<-"E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030"

#mlTyndp<-mapLayout(readLayout())
#plotMapLayout(mlTyndp)
#save(mlTyndp, file = "E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030\\user\\mlTyndp2017.rda")
#saveRDS(mlTyndp, file = "E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030\\user\\mlTyndp2017.rds")
#saveRDS(mlTyndp, file = "E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030\\user\\mlTyndp2017_V2.rds")


myPath<-"E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030"
opts<-setSimulationPath(myPath, "20170830-1049eco-reference")

mlTyndp<-readRDS(file = "E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030\\user\\layout\\mapLayoutTyndp.rds")

myDataEurope<-readAntares(links = "all", areas = "all", linkCapacity = TRUE, clusters = "all")

myConDataEurope<-removeVirtualAreas(
  x=myDataEurope,
  storageFlexibility = getAreas(select = c("pum", "tur","z_dsr", "y_mul")),
  newCols = FALSE, 
  reassignCosts = TRUE
)

myConDataEurope<-removeVirtualAreas(
  x=myDataEurope,
  storageFlexibility = getAreas(select = c("pum", "tur")),
  production = getAreas(select = c("z_dsr", "y_mul")),
  newCols = FALSE, 
  reassignCosts = TRUE
)

myConDataEurope<-removeVirtualAreas(
  x=myDataEurope,
  production = "z_dsr110",
  newCols = TRUE
)

myConDataEurope$areas[area=="fr"] %>% View("fr_con")
plotMap(myDataEurope, mlTyndp, interactive = TRUE)


myConDataEurope<-removeVirtualAreas(
  x=myDataEurope,
  storageFlexibility = getAreas(select = c("pum", "tur")),
  newCols = FALSE, 
  reassignCosts = TRUE
)


myConDataEurope<-removeVirtualAreas(
  x=myConDataEurope,
  production = getAreas(select = c("z_dsr", "y_mul")),
  newCols = FALSE, 
  reassignCosts = TRUE
)

resGen<-showAliases(names="generation")
resRen<-showAliases(names="renewable")
vecGen<-as.vector(resGen$select)
vecRen<-as.vector(resRen$select)
vecGen <- strsplit(vecGen,", ",fixed=TRUE)[[1]]
vecRen <- strsplit(vecRen,", ",fixed=TRUE)[[1]]

varPlotMap<-c(vecGen, vecRen)

addLoadFactorLink(myConDataEurope)

myConDataEurope$links
resOptions<-plotMapOptions(areaDefaultCol = "red", linkDefaultCol = "red")

linkColorScaleOpts<-colorScaleOptions(
  breaks = 1, 
  domain = NULL, 
  negCol = "#00FF00", 
  zeroCol = "#FFFF00", 
  posCol = "#FF0000", 
  naCol = "#EEEEEE",
  zeroTol = NULL, 
  colors = NULL, 
  levels = c(0,1)
)


areaColorScaleOpts<-colorScaleOptions(
  breaks = c(5000, 70000, 80000),
  colors = c("#00FFFF", "#B7FFFF", "#FFFF00"), 
  domain = 1:100000, 
  zeroTol = 1
)

resOptions<-plotMapOptions(
  areaColorScaleOpts=areaColorScaleOpts,
  linkColorScaleOpts = linkColorScaleOpts, 
  areaDefaultCol = "#00FFFF"
)

resOptions<-plotMapOptions(areaDefaultCol = "red", linkDefaultCol = "orange")
plotMap(
 myConDataEurope, 
  mlTyndp, 
  interactive = TRUE,
  colAreaVar="WIND", 
  colLinkVar="congestion",
  sizeLinkVar="FLOW LIN.",
  popupAreaVars = c(varPlotMap, "LOAD", "DTG MRG", "MAX MRG", "UNSP. ENRG" , "SPIL. ENRG"),
  options = resOptions
)


plotMap(
  myConDataEurope, 
  mlTyndp, 
  interactive = FALSE,
  colAreaVar="WIND", 
  options = resOptions
)


resOptions<-plotMapOptions(areaDefaultCol = "red", linkDefaultCol = "orange")

myConDataEurope$areas[area=="es" & timeId==115] %>% View



plotMap(
  myConDataEurope, 
  mlTyndp, 
  .updateBtn = TRUE, 
  .updateBtnInit=TRUE
)


### check plotMap  link color ======

linkColorScaleOpts<-colorScaleOptions(breaks = 1, domain = NULL, negCol = "#00FF00",
                                      zeroCol = "#FFFF00", posCol = "#FF0000", naCol = "#EEEEEE",
                                      zeroTol = NULL, colors = NULL, levels = c(0,1))


areaColorScaleOpts<-colorScaleOptions(
  breaks = c(5000, 70000, 80000),
  colors = c("#00FFFF", "#B7FFFF", "#FFFF00"),
  negCol="#000000", 
  posCol="#00FF00")

resOptions<-plotMapOptions(linkColorScaleOpts = linkColorScaleOpts)

plotMap(
  subset(myConDataEurope, timeIds = 115), 
  mlTyndp, 
  colAreaVar="LOAD", 
  colLinkVar="congestion",
  options = resOptions, 
  areaChartType="pie", 
  sizeMiniPlot = TRUE, 
  sizeAreaVars=varPlotMap,
  interactive = FALSE
)

CopymlTyndp<-mlTyndp

myDataEurope

myConDataEurope

CopymlTyndp$map<-NULL

plotMap(
  myDataEurope, 
  CopymlTyndp, 
  interactive = FALSE
)

??colorScaleOptions



### wirte H5 ====== 
setSimulationPath(myPath, 3)
writeAntaresH5(
  path="E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030\\writeH5",
  allData = FALSE,
  misc = TRUE, 
  thermalAvailabilities = FALSE,
  hydroStorageMaxPower = TRUE, 
  reserve = TRUE,
  linkCapacity = TRUE,
  mustRun = TRUE, 
  writeAllSimulations = TRUE,
  writeMcAll = TRUE,
  nbCores=1,
  removeVirtualAreas=TRUE,
  storageFlexibility=getAreas(select = c("pum", "tur", "z_dsr", "y_mul")),
  newCols = FALSE,
  overwrite = TRUE, 
  timeSteps = "hourly"
)


## KO 
writeAntaresH5(
  path="E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030\\writeH5",
  timeSteps = "hourly", 
  overwrite = TRUE, 
  removeVirtualAreas=TRUE,
  storageFlexibility=getAreas(select = c("pum", "tur")),
  production = getAreas(select = c("z_dsr", "y_mul"))
)

## OK 
writeAntaresH5(
  path="E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030\\writeH5",
  timeSteps = "hourly", 
  overwrite = TRUE, 
  removeVirtualAreas=TRUE,
  storageFlexibility=getAreas(select = c("pum", "tur"))
)

#KO 
setSimulationPath(myPath, 3)
writeAntaresH5(
  path="E:\\ANTARES\\Exemple_antares\\2_exemple_etudes_importantes\\TYNDP\\ST2030\\ST2030\\writeH5",
  timeSteps = "hourly", 
  overwrite = TRUE, 
  removeVirtualAreas=TRUE,
  production = getAreas(select = c("z_dsr", "y_mul")), 
  writeMcAll = FALSE, 
  newCols = FALSE
)
