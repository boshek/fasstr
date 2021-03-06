% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fill_missing_dates.R
\name{fill_missing_dates}
\alias{fill_missing_dates}
\title{Fill dates of missing flow values with NA}
\usage{
fill_missing_dates(flowdata = NULL, HYDAT = NULL, water_year = FALSE,
  water_year_start = 10)
}
\arguments{
\item{flowdata}{Data frame. A data frame of daily mean flow data that includes two columns: a 'Date' column with dates formatted 
YYYY-MM-DD, and a numeric 'Value' column with the corresponding daily mean flow values in units of cubic metres per second. 
Not required if \code{HYDAT} argument is used.}

\item{HYDAT}{Character. Seven digit Water Survey of Canada station number (e.g. \code{"08NM116"}) of which to extract daily streamflow 
data from a HYDAT database. \href{https://github.com/ropensci/tidyhydat}{Installation} of the \code{tidyhydat} package and a HYDAT 
database are required. Not required if \code{flowdata} argument is used.}

\item{water_year}{Logical. Use water years to group flow data instead of calendar years. Water years are designated
by the year in which they end. Default \code{FALSE}.}

\item{water_year_start}{Integer. Month indicating the start of the water year. Used if \code{water_year=TRUE}. Default \code{10}.}
}
\value{
A data frame of the original flowdata or HYDAT data with additional rows of filled values of missing dates with NA
}
\description{
Adds rows of dates with missing flow values to a streamflow dataset with daily flow values of NA. Missing dates will 
   be filled in gaps between data and compeltely fill the first and last years (calendar or water year if selected).
}
\examples{
\dontrun{

fill_missing_dates(flowdata = flowdata)

fill_missing_dates(HYDAT = "08NM116", water_year = TRUE, water_year_start = 8)

}
}
