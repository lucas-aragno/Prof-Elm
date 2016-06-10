module Pokemons.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Task
import Pokemons.Models exposing (PokemonId, Pokemon)
import Pokemons.Messages exposing (..)

fetchAll: Cmd Msg
fetchAll =
  Http.get collectionDecoder fetchAllUrl
    |> Task.perform FetchAllFail FetchAllDone

fetchAllUrl : String
fetchAllUrl =
  "http://localhost:4000/pokemons"

collectionDecoder : Decode.Decoder (List Pokemon)
collectionDecoder =
  Decode.list memberDecoder

memberDecoder : Decode.Decoder Pokemon
memberDecoder =
  Decode.object5 Pokemon
    ("id" := Decode.int)
    ("name" := Decode.string)
    ("pokemonType" := Decode.string)
    ("pokemonImage" := Decode.string)
    ("description" := Decode.string)
