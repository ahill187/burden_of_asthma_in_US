source('./R/helper_functions.R')
source('./R/TabItemDash.R')
source('./R/utils.R')
library(R6)



TabItemDashPaper <- R6Class(
    "TabItemDashPaper",
    inherit = TabItemDash,
    public = list(

        #Fields
        valueBoxNumber = 4,
        valueBoxWidths = c(4,4,4,12), # widths, max = 12
        valueBoxOutputIds = NULL,
        outputIds = c(),

        # Constructor
        initialize = function(
            title,
            inputId,
            tabNumber,
            valueBoxNumber,
            valueBoxWidths
        ){
            super$initialize(title, inputId, tabNumber)
            self$valueBoxNumber = valueBoxNumber
            self$valueBoxWidths = valueBoxWidths
            self$makeId("valueBoxOutput", "valueBoxOutputIds", self$valueBoxNumber)
        },

        # Override
        tabItem = function(){
            shinydashboard2::tabItem(
                tabName = self$inputId,
                    lapply(1:self$valueBoxNumber, function(i){
                        boxId = self$valueBoxOutputIds[i]
                        self$outputIds = c(self$outputIds, boxId)
                        valueBoxOutput(boxId, self$valueBoxWidths[i])
                    }))}
    )
)
