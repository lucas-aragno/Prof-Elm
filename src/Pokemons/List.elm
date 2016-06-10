module Pokemons.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, src, style, href)
import Pokemons.Messages exposing (..)
import Pokemons.Models exposing (Pokemon)
import String exposing (concat)


view : List Pokemon -> Html Msg
view pokemons =
  div []
    [ nav pokemons
    , list pokemons
    ]

nav : List Pokemon -> Html Msg
nav pokemons =
  div [ class "clearfix mb2 white bg-black" ]
      [ div [ class "left p2" ] [text "Starter Pokemons"] ]

list : List Pokemon -> Html Msg
list pokemons =
    div []
        [ table [ class "mx-auto", style [("table-layout", "fixed")]]
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Type" ]
                    , th [] [ text "Image" ]
                    ]
                ]
            , tbody [] (List.map pokemonRow pokemons)
            ]
        ]


pokemonRow : Pokemon -> Html Msg
pokemonRow pokemon =
    tr []
        [ td [ style [("width", "15%"), ("text-align", "center")] ] [ a [ href (concat["http://localhost:3000/#pokemons/",(toString pokemon.id)]) ] [text (toString pokemon.id)] ]
        , td [ style [("width", "15%"), ("text-align", "center")] ] [ text pokemon.name ]
        , td [ style [("width", "15%"), ("text-align", "center")] ] [ text pokemon.pokemonType ]
        , td [ style [("width", "33%")] ] [ img [ src pokemon.pokemonImage ] [] ]
        , td []
            []
        ]
