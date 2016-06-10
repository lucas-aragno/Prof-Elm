module View exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Pokemons.List
import Pokemons.Profile
import Pokemons.Models exposing (PokemonId)
import Routing exposing (Route(..))

view : Model -> Html Msg
view model =
  div []
    [ page model ]


page : Model -> Html Msg
page model =
  case model.route of
    PokemonsRoute ->
      Html.App.map PokemonsMsg (Pokemons.List.view model.pokemons)
    PokemonRoute id ->
      pokemonEditPage model id
    NotFoundRoute ->
      notFoundView

pokemonEditPage : Model -> PokemonId -> Html Msg
pokemonEditPage model pokemonId =
  let
    maybePokemon =
      model.pokemons
        |> List.filter (\pokemon -> pokemon.id == pokemonId)
        |> List.head
  in
    case maybePokemon of
      Just pokemon ->
        Html.App.map PokemonsMsg (Pokemons.Profile.view pokemon)
      Nothing ->
        notFoundView

notFoundView : Html Msg
notFoundView =
  div []
    [ text "Not Found"
    ]
