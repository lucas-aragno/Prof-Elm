module Routing exposing (..)

import String
import Navigation
import UrlParser exposing (..)
import Pokemons.Models exposing (PokemonId)

type Route
  = PokemonsRoute
  | PokemonRoute PokemonId
  | NotFoundRoute

matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ format PokemonsRoute (s "")
    , format PokemonRoute (s "pokemons" </> int)
    , format PokemonsRoute (s "pokemons")
    ]

hashParser : Navigation.Location -> Result String Route
hashParser location =
  location.hash
  |> String.dropLeft 1
  |> parse identity matchers

parser : Navigation.Parser (Result String Route)
parser =
  Navigation.makeParser hashParser

routeFromResult : Result String Route -> Route
routeFromResult result =
  case result of
    Ok route ->
      route

    Err string ->
      NotFoundRoute
