module Pokemons.Messages exposing (..)

import Http
import Pokemons.Models exposing (PokemonId, Pokemon)

type Msg
  = FetchAllDone (List Pokemon)
  | FetchAllFail Http.Error
