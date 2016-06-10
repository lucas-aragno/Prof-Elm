module Main exposing (..)

import Html.App
import Messages exposing (Msg(..))
import Navigation
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Pokemons.Commands exposing(fetchAll)
import Routing exposing (Route)

init : Result String Route -> ( Model, Cmd Msg )
init result =
  let
    currentRoute =
      Routing.routeFromResult result
  in
    (initialModel currentRoute, Cmd.map PokemonsMsg fetchAll )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


urlUpdate : Result String Route -> Model -> ( Model, Cmd Msg )
urlUpdate result model =
    let
        currentRoute =
            Routing.routeFromResult result
    in
        ( { model | route = currentRoute }, Cmd.none )



-- MAIN

main : Program Never
main =
    Navigation.program Routing.parser
        { init = init
        , view = view
        , update = update
        , urlUpdate = urlUpdate
        , subscriptions = subscriptions
        }
