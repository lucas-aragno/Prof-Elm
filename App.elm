module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.App
import Widget

-- MODEL


type alias AppModel =
    { widgetModel : Widget.Model
    }



initialModel : AppModel
initialModel =
    { widgetModel = Widget.initialModel
    }




init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- MESSAGES


type Msg
    = WidgetMsg Widget.Msg



-- VIEW



view : AppModel -> Html Msg
view model =
    div []
        [ Html.App.map WidgetMsg (Widget.view model.widgetModel)
        ]



-- UPDATE



update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        WidgetMsg subMsg ->
            let
                ( updatedWidgetModel, widgetCmd ) =
                    Widget.update subMsg model.widgetModel
            in
                ( {model | widgetModel = updatedWidgetModel }, Cmd.map WidgetMsg widgetCmd )



-- SUBSCRIPTIONS



subscriptions : AppModel -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
