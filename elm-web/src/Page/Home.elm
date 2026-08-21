module Page.Home exposing (home,Model, Msg, init)

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


home : Model -> Html Msg
home model = 
    div[]-- 記事を追加したかったらpostItem
       [ h1 [class "post-title"] [ text "ブログ一覧"]
       , ul [ class "post-list" ]
           [  postItem "/post/1" "このサイトをElmをつかって作成した話" "2026.08.21"
            , postItem "/post/2" "2番目の記事" " "
            , postItem "/post/3" "3番目の記事" " "
           ]
        ]
        

postItem : String -> String -> String -> Html Msg
postItem url title date =
    li []
        [ a [ href url ]
            [ span [ class "post-item-title" ] [ text title ]
            , span [ class "post-item-date" ] [ text date ]
            ]
        ]

viewSidebar : Model -> Html Msg
viewSidebar model=
    nav [ class "sidebar"] 
        [a[href "/about"][text ""]
        ]
               




