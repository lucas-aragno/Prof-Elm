module Models exposing (..)


import Pokemons.Models exposing (Pokemon)


type alias Model =
  { pokemons : List Pokemon
  }


initialModel : Model
initialModel =
  { pokemons = [ Pokemon 1 "Chikorita" "Grass" "http://cdn.bulbagarden.net/upload/thumb/b/bf/152Chikorita.png/250px-152Chikorita.png"]
  }
