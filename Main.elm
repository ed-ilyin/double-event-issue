module Main exposing (..)

import Html exposing (Html, node)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (property)
import Html.Events exposing (on)
import Json.Decode exposing (succeed)
import Json.Encode exposing (bool, string)


main : Program Never
main =
    beginnerProgram { model = model, view = view, update = update }


type alias Model =
    String


model : Model
model =
    "Value changed!"


type Msg
    = Log


update : Msg -> Model -> Model
update msg model =
    case msg of
        Log ->
            Debug.log "update" model


view : Model -> Html Msg
view model =
    node "paper-input"
        [ string "Type and check console" |> property "label"
        , bool True |> property "autofocus"
        , succeed Log |> on "value-changed"
        ]
        []
