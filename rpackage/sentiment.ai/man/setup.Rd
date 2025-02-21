% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/init_and_install.R
\name{install_sentiment.ai}
\alias{install_sentiment.ai}
\alias{init_sentiment.ai}
\alias{check_sentiment.ai}
\title{Install and Setup sentiment.ai Algorithm}
\usage{
install_sentiment.ai(
  envname = "r-sentiment-ai",
  method = c("auto", "virtualenv", "conda"),
  gpu = FALSE,
  python_version = "3.7.10",
  modules = list(numpy = "1.19.5", sentencepiece = "0.1.95", tensorflow = "2.4.1",
    tensorflow_hub = "0.12.0", `tensorflow-text` = "2.4.3"),
  fresh_install = TRUE,
  restart_session = TRUE,
  ...
)

init_sentiment.ai(
  model = c("en.large", "multi.large", "en", "multi"),
  envname = "r-sentiment-ai"
)

check_sentiment.ai(...)
}
\arguments{
\item{envname}{The name, or full path, of the environment in which Python
packages are to be installed. When \code{NULL} (the default), the active
environment as set by the \code{RETICULATE_PYTHON_ENV} variable will be used;
if that is unset, then the \code{r-reticulate} environment will be used.}

\item{method}{Installation method. By default, "auto" automatically finds a
method that will work in the local environment. Change the default to
force a specific installation method. Note that the "virtualenv"
method may not available on Windows due to a tensorflow issue. Note
also that since this command runs without privilege the "system"
method is available only on Windows.}

\item{gpu}{Whether GPU should be enabled when installing TensorFlow}

\item{python_version}{The requested Python version. Ignored when attempting
to install with a Python virtual environment.}

\item{modules}{A list of modules needed for installing tensorflow. See
details for more information. Only change this argument if you know
what you are doing!}

\item{fresh_install}{Whether to create the Python environment prior to
installing the modules or to install everything in an existing
environment (if one exists). Only change this argument if you know what
you are doing! If the environment does not already exist, will create
the environment first.}

\item{restart_session}{Whether to restart the R session after finishing
installation. Only works on Rstudio.}

\item{...}{Additional arguments passed to \code{\link[reticulate:conda-tools]{conda_install()}}
or \code{\link[reticulate:virtualenv-tools]{virtualenv_install()}}.}

\item{model}{path to tensorflow hub embedding model. default is both universal
sentence encoder en (default) and multi.}
}
\value{
NULL this function simply installs the required python dependencies and default scoring models and pre-calculated embedding vectors.

python function to embed text can be returned, but is not necessary.
\code{embed_text()} does this for you.

NULL this function checks if \code{init_sentiment.ai()} has been called
successfully, if not, it is called.
}
\description{
Install and Setup sentiment.ai Algorithm
}
\details{
Sets up environment specific for sentiment.ai. The packages that it currently
needs are as follows:\tabular{lc}{
   Module \tab Version \cr
   python \tab 3.7.10 \cr
   numpy \tab 1.19.5 \cr
   tensorflow \tab 2.4.1 \cr
   tensorflow_hub \tab 0.12.0 \cr
   tensorflow-text \tab 2.4.3 \cr
   sentencepiece \tab 0.1.95 \cr
}


Please do not change these unless you know what you are doing.

Note that it installs with like \code{tensorflow::install_tensorflow} and
\code{pip = TRUE}
}
\note{
Setting environments with \code{reticulate} is notoriously difficult. If the
RETICULATE_PYTHON environment is set, then reticulate will not let you change
the Python binary used (or the Python environment) using \code{use_condaenv}
\strong{or} \code{use_virtualenv}. This environment can be accidentally set in
the following ways:
\enumerate{
\item If RETICULATE_PYTHON is in your .Renviron file or bash/zsh rc files. This is
the most obvious place that this environment will be set.
\item Using Project Options or Global Options under "Python>Python Interpreter".
If this is set, then reticulate will almost always use this version of Python
and will not let you change.
\item If you have already loaded reticulate and have run \code{py_config}. Once a Python
version/environment is instantiated, you will not be able to change it and
will have to restart R.
\item If you are in \strong{any} project, at all! Currently (as of \code{reticulate} version
1.22), every project automatically sets the RETICULATE_PYTHON environment
variable, either through the Global or Project Options or by using heuristics.
If you are in an RStudio project, you \strong{must} update Global/Project Options
with the specific version/environment of Python that you want to use, or
you will not be able to change it!
}

Manually setting the environment variable to NULL (using
\code{Sys.unsetenv("RETICULATE_PYTHON")}, updating your Project/Global options going
Tools>Project Options or Tools>Global Options and then select Python in the
left menu bar and click the "Select" button to manually set the Python
interpreter, and/or restarting your R session \strong{might} fix the problem.

We know this is a pain, and we would like to fix this for you, but we are
dependent on the RStudio/reticulate team to update how they determine the
allowable Python versions/environments.
}
\examples{
\dontrun{
install_sentiment.ai(envname = "r-sentiment-ai",
                     method  = "conda",
                     python_version = "3.7.10")
init_sentiment.ai(model   = "en.large",
                  envname = "r-sentiment-ai")
check_sentiment.ai()

# if you run into an issue, follow the instructions/see the note and retry!
}
}
