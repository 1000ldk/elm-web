module Page.Home exposing (home, Model, Msg, init)

import Html exposing (..)
import Html.Attributes exposing (href, class)
import Data.Articles as Articles


type alias Model =
    {}


type Msg
    = NoOp


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


home : Model -> Html Msg
home model =
    div []
        [ h1 [ class "post-title" ] [ text "ブログ一覧" ]
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