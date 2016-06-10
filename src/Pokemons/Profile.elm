module Pokemons.Profile exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href, src)
import Pokemons.Models exposing (..)
import Pokemons.Messages exposing (..)

view : Pokemon -> Html.Html Msg
view model =
  div []
    [ nav model
    , form model
    ]

nav : Pokemon -> Html.Html Msg
nav model =
  div [ class "clearfix mb2 white bg-black p1" ]
      []

form : Pokemon -> Html.Html Msg
form pokemon =
   div [ class "m3" ]
       [ h1 [] [ text pokemon.name ]
       , formCatched pokemon
       ]

formCatched : Pokemon -> Html.Html Msg
formCatched pokemon =
  div
     [ class "clearfix py1"
     ]
     [ div [ class "col col-6" ] [ img [src pokemon.pokemonImage][]]
     , div [ class "col col-6" ]
         [ span [ class "h2 bold" ] [text (toString pokemon.description) ]
         ]
      ]
