module Models exposing (..)


import Pokemons.Models exposing (Pokemon)


type alias Model =
  { pokemons : List Pokemon
  }


initialModel : Model
initialModel =
  { pokemons = [ Pokemon 1 "Chikorita" "Grass" ]
  }
