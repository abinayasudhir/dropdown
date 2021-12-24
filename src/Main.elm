module Main exposing (..)

import Browser
import Home.State exposing (init, update)
import Home.Types exposing (Model, Msg(..))
import Home.View exposing (view)
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
