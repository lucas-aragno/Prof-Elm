module Pokemons.Update exposing (..)


import Pokemons.Messages exposing (Msg(..))
import Pokemons.Models exposing (Pokemon)


update : Msg -> List Pokemon -> ( List Pokemon, Cmd Msg )
update action pokemons =
  case action of
    FetchAllDone newPokemons ->
      ( newPokemons, Cmd.none )
    FetchAllFail error ->
      ( pokemons, Cmd.none )
