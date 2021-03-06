% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/rules.r
\name{tau_add_css_rule}
\alias{tau_add_css_rule}
\title{Add a CSS rule to the rendered htmlwidget}
\usage{
tau_add_css_rule(tau, rule, warn = TRUE)
}
\arguments{
\item{tau}{taucharts object}

\item{rule}{character vector of CSS rule(s) to add to the widget DOM}

\item{warn}{show warnings for global CSS rules? (default: \code{TRUE})}
}
\value{
taucharts htmlwidget object
}
\description{
This function will add a CSS rule to a widget-created
DOM stylesheet. \code{rule} should be a valid CSS rule as you
would enter in a \code{<style>...</style>} block. No checking is done
to ensure validity.
}
\details{
Use \code{\{\{ID\}\}} (followed by a space) to target the CSS rule
just to the widget vs the whole DOM.

Vectorized over \code{rule}
}
\note{
This is for expert use only. You need to know quite a bit about the visualization
      and target DOM to effectively use this function. CSS rules without the \code{\{\{ID\}\}}
      are applied to the entire DOM.
}
\examples{
# change the default white tooltip to black

if (interactive()) {
make_black_tooltip <- function(tau) {
 tau \%>\%
  tau_add_css_rule(
   ".graphical-report__tooltip__gray-text { color: white; font-weight: bold; }") \%>\%
  tau_add_css_rule(
   ".graphical-report__tooltip__list__elem:first-child {color:white;font-weight:bold;}") \%>\%
  tau_add_css_rule(
   ".graphical-report__tooltip__exclude { color: white; }") \%>\%
  tau_add_css_rule(
    paste0(c(".graphical-report__tooltip__exclude:hover { color: #65717f; ",
             "background: linear-gradient(to right, rgba(255, 255, 255, 0) 100\%, ",
             "rgba(235, 238, 241, 0.9) 0\%); }"), collapse="\\n")) \%>\%
 tau_add_css_rule(".graphical-report__tooltip { background: black; color: white; }")
}

tauchart(mtcars) \%>\%
  tau_point("wt", "mpg", color="cyl") \%>\%
  tau_color_manual(c("blue", "maroon", "black")) \%>\%
  tau_tooltip() \%>\%
  make_black_tooltip()
}
}

