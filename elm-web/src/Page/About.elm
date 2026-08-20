module Page.About exposing(me,Model, Msg, init)

import Browser
import Html exposing (..)
import Html.Attributes exposing (href,class,style)
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

me : Model -> Html Msg
me model= div[]
        [
             a [ href "/" ] [ text "←　一覧に戻る" ]
            ,div[style "text-align" "center"][text "こんには"]
            ,div[style "text-align" "center"][text ""]
        ]