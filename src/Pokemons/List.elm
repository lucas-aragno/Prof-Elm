module Pokemon.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pokemons.Messages exposing (..)
import Pokemons.Models exposing (Pokemon)


view : List Pokemon -> Html Msg
view pokemons =
  div []
    [ nav pokemons
    , list pokemons
    ]

nav : List Pokemons -> Html Msg
nav pokemons =
  div [ class "clearfix mb2 white bg-black" ]
      [ div [ class "left p2" ] [text "Pokemons"] ]

list : List Pokemons -> Html Msg
list pokemons =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Type" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map pokemonRow players)
            ]
        ]

pokemonRow : Pokemon -> Html Msg
pokemonRow pokemon =
    tr []
        [ td [] [ text (toString pokemon.id) ]
        , td [] [ text pokemon.name ]
        , td [] [ text (toString pokemon.type) ]
        , td []
            []
        ]
