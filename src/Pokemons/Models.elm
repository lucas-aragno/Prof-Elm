module Pokemons.Models exposing (..)

type alias PokemonId =
  Int

type alias Pokemon =
  { id : PokemonId
  , name : String
  , type : String
  }

new : Pokemon
new  =
  { id = 0
  , name = ""
  , type = ""
}
