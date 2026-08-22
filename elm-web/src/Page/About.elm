module Page.About exposing(me,Model, Msg, init)

import Browser
import Html exposing (..)
import Html.Attributes exposing (href,class,style)
import Url exposing (Url)
import Browser.Navigation as Nav
import Route exposing (Route(..))



type alias Model =
    {}

init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )

type Msg 
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url

type alias LinkItem =
    { label : String
    , url : String
    }    

links : List LinkItem
links =
    [
        {label = "GitHub", url ="https://github.com/1000ldk"}
       ,{label = "Twitter", url = "https://twitter.com/0zldk" } 
    ]    

me : Model -> Html Msg
me model= div[]
        [
             a [ href "./" ] [ text "←　一覧に戻る" ]
            ,h1[style "text-align" "center" ] [text "1000LDK"]
            ,div[style "text-align" "center"][text "iOSアプリ開発や折り紙、島巡り"]
            ,div[style "text-align" "center"][text "今年中にアウトドア派になります"]
            ,div
            [style "max-width" "240px"
            , style "margin" "40px auto 0"
            ]
            [h2[ style "margin-bottom" "8px" ][text "Links"]
            ,ul [ style "list-style-position" "inside"
                , style "padding" "0"
                , style "margin" "0"
                 ]
                 (List.map viewLink links)
            ]     
        ]

viewLink : LinkItem -> Html Msg
viewLink item =
    li [style "margin-bottom" "4px" ] [ a [ href item.url ] [ text item.label ] ]        