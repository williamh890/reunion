module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)


---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }



---- MODEL ----


type alias Model =
    { attendance : Int }


init : ( Model, Cmd Msg )
init =
    ( { attendance = 0 }, Cmd.none )



---- UPDATE ----


type Msg
    = Increment


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | attendance = model.attendance + 1 }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Reed Family Reunion 2018" ]
        , div []
            [ text ("Tunrout " ++ (toString model.attendance) ++ " family members. ")
            , button [ onClick Increment ] [ text "register attendance" ]
            ]
        , h2 [] [ text "Register" ]
        , h2 [] [ text "Post" ]
        ]
