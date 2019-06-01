source('./R/helper_functions.R')
source('./R/utils.R')
library(R6)



ValueBoxOutputBrick <- R6Class(
    "ValueBoxOutputBrick",
    public = list(
        #Fields
        valueBoxNumber = NULL,
        # Constructor
        initialize = function(valueBoxNumber){
            self$valueBoxNumber = valueBoxNumber
        },

        getRegionId = function(layerRegionId){
            layerRegionId = strsplit(layerRegionId, "_")
            regionId = as.numeric(layerRegionId[[1]][4])
            return(regionId)
        },

        getLayerId = function(layerRegionId){
            layerRegionId = strsplit(layerRegionId, "_")
            layerId = as.numeric(layerRegionId[[1]][2])
            return(layerId)
        },

        getValue = function(layerValueData, prefix, regionId){
            if (layerValueData[regionId] == 0 ||
                layerValueData[regionId] == "No data") {
                return("No data")
            } else {
                return(paste(prefix, layerValueData))
            }
        },

        getSubtitle = function(boxIndex, subtitles, regionName) {
            if (boxIndex == self$valueBoxNumber) {
                subtitle = subtitles[boxIndex]
                return(paste(subtitle, regionName))
            } else{
                return(subtitles[boxIndex])
            }
        }
    )
)
