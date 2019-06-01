source('./R/helper_functions.R')
source('./R/utils.R')
library(R6)



ValueBoxSet <- R6Class(
    "ValueBoxSet",
    public = list(
        #Fields
        valueBoxNumber = NULL,
        # Constructor
        initialize = function(valueBoxNumber){
            self$valueBoxNumber = valueBoxNumber
        },

        #' @param boxIndex integer: the index of the value box
        getSubTitles = function(boxIndex){
            if (boxIndex == self$valueBoxNumber) {
                subtitle = subtitles[box]
                subtitle = paste(subtitle, regionName)
            } else{
                subtitle = subtitles[box]
            }
        }
    )
)
