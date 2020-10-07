setClass("Vegetable",slots=list(season="character",grow_time="numeric"));
# Vegetable is an abstract class so we don't intend to actually create
# any

#' Get the bite sound for the approprite vegetable
#'
#' @param vegetable the vegetable object
#' @return a string representing the sound made by biting into the veggie
#' @export
#' @examples
#' get_bite_sound(new("Carrot")) # -> "crunch"
get_bite_sound <- function(object) UseMethod("get_bite_sound");

setClass("Carrot",contains="Vegetable");
setClass("Tomato",contains="Vegetable");

setMethod("get_bite_sound",c(object="Carrot"), function(object){
    "crunch"
})

setMethod("get_bite_sound",c(object="Tomato"), function(object){
    "squish"
});
