#' @importFrom roperators "%+%" "%ni%"
#' @importFrom stats setNames
choose_model <- function(model){

  # take only first model
  model          <- model[1]

  if(length(model) <= 0){
    stop("model is of length 0 and needs to be length 1",
         call. = FALSE)
  }

  # model defaults/names
  # !! default_models is declared in constants.R !!
  model_names    <- names(default_models)

  default_models <- setNames(object = "https://tfhub.dev/google/" %+% default_models,
                             nm     = model_names)

  # check whether model is IN model defaults
  if(model %in% model_names){
    model <- default_models[model]
  } else if(model %ni% default_models){
    warning(model, " model is not one of the built-in models: ",
            paste(model_names, collapse = ", "), ". ",
            "Overriding the defaults is allowed, but may or may not work! ",
            "You're on your own from here on, cowboy! Godspeed!",
            call. = FALSE)
  } # END ifelse STATEMENT

  return(model[1])
}
