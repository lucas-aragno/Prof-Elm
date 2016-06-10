module Pokemons.Models exposing (..)

type alias PokemonId =
  Int

type alias Pokemon =
  { id : PokemonId
  , name : String
  , pokemonType: String
  , pokemonImage: String
  , catched: Bool
  }

new : Pokemon
new  =
  { id = 0
  , name = ""
  , pokemonType = ""
  , pokemonImage = ""
  , catched = False
  }
