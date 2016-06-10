module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Pokemons.Update

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    PokemonsMsg subMsg ->
      let
        ( updatedPokemons, cmd ) =
          Pokemons.Update.update subMsg model.pokemons
      in
        ( { model | pokemons = updatedPokemons }, Cmd.map PokemonsMsg cmd )
