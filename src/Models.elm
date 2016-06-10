module Models exposing (..)


import Pokemons.Models exposing (Pokemon)
import Routing

type alias Model =
  { pokemons : List Pokemon,
    route : Routing.Route
  }


initialModel : Routing.Route -> Model
initialModel route =
  { pokemons = []
  , route = route
  }
