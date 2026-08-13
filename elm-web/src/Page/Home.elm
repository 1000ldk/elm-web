module Page.Home exposing (home,Model, Msg, init)

import Browser
import Html exposing (..)
import Html.Attributes exposing (href)
import Url exposing (Url)
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


home : Html Msg
home = 
    div[]
       [ h1 [] [ text "1000LDK Blog"]
       , ul []
           [ li [] [a[href "/post/1"][ text "最初の記事"]]
           , li [] [a[href "/post/2"][ text "2番目の記事"]]
           , li [] [a[href "/post/3"][ text "3番目の記事"]]
           ]
        ]




