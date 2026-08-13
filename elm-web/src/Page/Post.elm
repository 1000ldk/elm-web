module Page.Post exposing (viewPost, Msg)

import Browser
import Html exposing (..)
import Url exposing (Url)
import Html.Attributes exposing (href)
import Browser.Navigation as Nav
import Route exposing (Route(..))

type alias Model =
     {
        key : Nav.Key
        ,route : Route
     }

type Msg 
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url

init : () -> Url -> Nav.Key -> (Model , Cmd Msg)
init _ url key =
    ( { key = key, route = Route.parseUrl url }, Cmd.none)

viewPost : Int -> Html Msg
viewPost id =
    div []
        [ a[href "/"][ text "←　一覧に戻る"]
        , h1 [] [text ("記事"++ String.fromInt id)]
        , p[] [ text "ここに本文が入ります"]
        ]