module Main exposing (..)

import Html exposing (beginnerProgram, button, div, text)
import Html.Events exposing (onClick)


type Msg
    = AddClusterElement ClusterElement


type ClusterElement
    = AnyElement


type alias Model =
    List ClusterElement


initialModel : Model
initialModel =
    []


main : Program Never Model Msg
main =
    beginnerProgram { model = initialModel, view = view, update = update }


view : Model -> Html.Html Msg
view model =
    div []
        [ button [ onClick (AddClusterElement AnyElement) ] [ text "Add element" ]
        , div [] [ text (toString model) ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddClusterElement elementToAdd ->
            List.concat [ model, [ elementToAdd ] ]
