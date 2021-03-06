#==================================================================================================
# BOXPLOT WITH METHOD
#' @title Plot boxplot with a specified method .
#' @name box_jitter
#' @author Frederic 2015 (AMI)

#' @description \code{Boxplot.jitter} 
#' Plot boxplot with jitter given climate object
#' 
#' @param data_list list. 
#' 
#' @param data.variable type character. It can be for any data time period
#'  
#' @examples
#' ClimateObj <- climate( data_tables = list( data ), data_time_periods = list("yearly") )
#' Default data_time_periods: "yearly"
#' # where "data" is a data.frame containing the desired data to be plotted.
#' climateObj$box_jitter(var = c("Strt1","Strt2"), plot_jitter = TRUE, names = c("Strt1","Strt2" ))
#' @return return boxplot
#' 

climate$methods(box_jitter = function(data_list = list(), var,  names = c(), method = "jitter",jitter = 0.1, time_period = yearly_label, connect.mean = FALSE,
                                       horizontal = FALSE, plot_jitter = FALSE, ylab = "Day number for planting", add = TRUE, colpoints = "red", na.rm = TRUE,connect.median = FALSE,
                                       plot.sd = FALSE, lty = 1, col.sd = "blue", main = c(data_name,"Start of the rain"), varwidth = FALSE, outline = TRUE, show.names = TRUE){
  
  #required variable
  data_list = add_to_data_info_required_variable_list(data_list, list(var))
  # data time period is daily
  data_list = add_to_data_info_time_period( data_list, time_period )
  climate_data_objs = get_climate_data_objects( data_list )
  
  for( data_obj in climate_data_objs ) {
    
    data_name = data_obj$get_meta( data_name_label )
    
    # get the column(s) of interest for the plot.
#     interest_var = list()
#     for(i in 1:length(var)){
#       interest_var[[i]] <- data_obj$getvname(var[[i]]) 
#     }
    
    if (!is.list(var)){
      interest_var = list(var)
    }
    
    for(i in 1:length(var)){
      interest_var[[i]] <- data_obj$getvname(var[[i]]) 
    }

    # access data for analysis
    curr_data_list = data_obj$get_data_for_analysis( data_list )
    
    for( curr_data in curr_data_list ) {
      
     dat <- subset(curr_data, select = as.character(interest_var))
                    
      boxplot(  dat, names = names, horizontal = horizontal, varwidth = varwidth, outline = outline, na.rm = na.rm, ylab =ylab,  main =  main, show.names = show.names )
      if( plot_jitter == TRUE){
      stripchart( dat , method = method, jitter = jitter, vertical = !(horizontal), add = add, col = colpoints )
      }
      if( connect.mean == TRUE ){
      lines( sapply(  dat, na.rm = na.rm, mean) )
      }      
      if( connect.median == TRUE) {
        lines(  sapply( dat, na.rm = na.rm, median) )
      }
      #if a line for the standard deviation is required 
      if( plot.sd == TRUE){
        #store the mean and standard values in different variables
        m =  sapply( dat, na.rm = na.rm, mean)
        s =  sapply( dat, na.rm = na.rm, sd)
        # counter of sd from the mean
        i = 1
        abline( h = m + (i * s), lty = lty, col = col.sd )
        
      }
    }
    
  }
}
)