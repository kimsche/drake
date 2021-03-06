% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cache.R
\name{this_cache}
\alias{this_cache}
\title{Get the cache at the exact file path specified.}
\usage{
this_cache(path = drake::default_cache_path(), force = FALSE,
  verbose = drake::default_verbose(), fetch_cache = NULL,
  console_log_file = NULL)
}
\arguments{
\item{path}{file path of the cache}

\item{force}{logical, whether to load the cache
despite any back compatibility issues with the
running version of drake.}

\item{verbose}{logical or numeric, control printing to the console.
Use \code{pkgconfig} to set the default value of \code{verbose}
for your R session:
for example, \code{pkgconfig::set_config("drake::verbose" = 2)}.
\describe{
\item{0 or \code{FALSE}:}{print nothing.}
\item{1 or \code{TRUE}:}{print only targets to build.}
\item{2:}{in addition, print checks and cache info.}
\item{3:}{in addition, print any potentially missing items.}
\item{4:}{in addition, print imports. Full verbosity.}
}}

\item{fetch_cache}{character vector containing lines of code.
The purpose of this code is to fetch the \code{storr} cache
with a command like \code{\link[=storr_rds]{storr_rds()}} or \code{\link[=storr_dbi]{storr_dbi()}},
but customized. This feature is experimental. It will turn out
to be necessary if you are using both custom non-RDS caches
and distributed parallelism (\code{parallelism = "future_lapply"}
or \code{"Makefile"}) because the distributed R sessions
need to know how to load the cache.}

\item{console_log_file}{character scalar or \code{NULL}.
If \code{NULL}, console output will be printed
to the R console using \code{message()}.
Otherwise, \code{console_log_file} should be the name of a flat file.
Console output will be appended to that file.}
}
\value{
A drake/storr cache at the specified path, if it exists.
}
\description{
This function does not apply to
in-memory caches such as \code{storr_environment()}.
}
\examples{
\dontrun{
test_with_dir("Quarantine side effects.", {
clean(destroy = TRUE)
try(x <- this_cache(), silent = FALSE) # The cache does not exist yet.
load_mtcars_example() # Get the code with drake_example("mtcars").
make(my_plan) # Run the project, build the targets.
y <- this_cache() # Now, there is a cache.
z <- this_cache(".drake") # Same as above.
manual <- new_cache("manual_cache") # Make a new cache.
manual2 <- get_cache("manual_cache") # Get the new cache.
})
}
}
