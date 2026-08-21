module Page.Home exposing (home,Model, Msg, init)

import Browser
import Html exposing (..)
import Html.Attributes exposing (href,class,style)
import Url exposing (Url)
import Browser.Navigation as Nav
import Route exposing (Route(..))
import Data.Articles as Articles




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
            (List.map postItem Articles.all)
        ]
        

postItem : Articles.Article -> Html Msg
postItem article =
    li []
        [ a [ href ("/post/" ++ String.fromInt article.id) ]
            [ span [ class "post-item-title" ] [ text article.title ]
            , span [ class "post-item-date" ] [ text article.date ]
            ]
        ]

viewSidebar : Model -> Html Msg
viewSidebar model=
    nav [ class "sidebar"] 
        [a[href "/about"][text ""]
        ]
               




