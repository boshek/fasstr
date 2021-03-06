% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_daily_cumulative_stats.R
\name{plot_daily_cumulative_stats}
\alias{plot_daily_cumulative_stats}
\title{Plot cumulative daily flow statistics}
\usage{
plot_daily_cumulative_stats(flowdata = NULL, HYDAT = NULL,
  basin_area = NA, water_year = FALSE, water_year_start = 10,
  start_year = NULL, end_year = NULL, exclude_years = NULL,
  use_yield = FALSE, log_discharge = FALSE, station_name = NA,
  write_plot = FALSE, write_imgtype = "pdf", write_imgsize = c(4, 8.5),
  write_dir = ".")
}
\arguments{
\item{flowdata}{Data frame. A data frame of daily mean flow data that includes two columns: a 'Date' column with dates formatted 
YYYY-MM-DD, and a numeric 'Value' column with the corresponding daily mean flow values in units of cubic metres per second. 
Not required if \code{HYDAT} argument is used.}

\item{HYDAT}{Character. A seven digit Water Survey of Canada station number (e.g. \code{"08NM116"}) of which to extract daily streamflow 
data from a HYDAT database. \href{https://github.com/ropensci/tidyhydat}{Installation} of the \code{tidyhydat} package and a HYDAT 
database are required. Not required if \code{flowdata} argument is used.}

\item{basin_area}{Numeric. The upstream drainage basin area (in sq. km) of the station. Used to calculate runoff yields (mm)
or middle ('center') of the rolling n-day group of observations. Default \code{'right'}.}

\item{water_year}{Logical. Use water years to group flow data instead of calendar years. Water years are designated
by the year in which they end. Default \code{FALSE}.}

\item{water_year_start}{Integer. Month indicating the start of the water year. Used if \code{water_year=TRUE}. Default \code{10}.}

\item{start_year}{Integer. First year to consider for analysis. Leave blank if all years are required.}

\item{end_year}{Integer. Last year to consider for analysis. Leave blank if all years are required.}

\item{exclude_years}{Integer. Single year or vector of years to exclude from analysis. Leave blank if all years are required.}

\item{use_yield}{Logical. Use runoff yield for total flows instead of total volume. \code{basin_area} required. Default \code{FALSE}.}

\item{log_discharge}{Logical. Place the discharge axis (Y) on log scale. Default \code{FALSE}.}

\item{station_name}{Character. Name of hydrometric station or stream that will be used to create file names. Leave blank if not writing
files or if \code{HYDAT} is used or a column in \code{flowdata} called 'STATION_NUMBER' contains a WSC station number, as the name
will be the \code{HYDAT} value provided in the argument or column. Setting the station name will replace the HYDAT station number.}

\item{write_plot}{Logical. Write the plot to specified directory. Default \code{FALSE}.}

\item{write_imgtype}{Character. One of "pdf","png","jpeg","tiff", or "bmp" image types to write the plot as. Default \code{"pdf"}.}

\item{write_imgsize}{Numeric. Height and width, respectively, of saved plot. Default \code{c(5,11)}.}

\item{write_dir}{Character. Directory folder name of where to write tables and plots. If directory does not exist, it will be created.
Default is the working directory.}
}
\value{
A list of ggplot2 objects, the first the daily cumulative statistics plot containing the listed plots below, and the sebsequent 
   plots for each year of data provided containing the first plot plus the daily cumulative flow data for each year. Default units in
   cubic metres, millimetres if use_yield and basin_area provided.
  \item{Mean}{daily cumulative mean}
  \item{Median}{daily cumulative median}
  \item{Min-5 Percentile Range}{a ribbon showing the range of data between the daily cumulative minimum and 5th percentile}
  \item{5-25 Percentiles Range}{a ribbon showing the range of data between the daily cumulative 5th and 25th percentiles}
  \item{25-75 Percentiles Range}{a ribbon showing the range of data between the daily cumulative 25th and 75th percentiles}
  \item{75-95 Percentiles Range}{a ribbon showing the range of data between the daily cumulative 75th and 95th percentiles}
  \item{95 Percentile-Max Range}{a ribbon showing the range of data between the daily cumulative 95th percentile and the maximum}
  \item{'Year' Flows}{(on annual plots) the daily cumulative flows for the designated year}
}
\description{
Plot cumulative daily flow statistics for each day of the year of daily flow values from a streamflow dataset. 
   Calculates the statistics from all daily discharge values from all years, unless specified. Defaults to volumetric cumulative 
   flows, can use \code{use_yield} and \code{basin_area} to convert to runoff yield.
}
\examples{
\dontrun{

plot_daily_cumulative_stats(flowdata = flowdata, station_name = "MissionCreek", write_table = TRUE)

plot_daily_cumulative_stats(HYDAT = "08NM116", water_year = TRUE, water_year_start = 8)

}
}
