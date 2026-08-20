module Page.Post exposing (viewPost, Msg)

import Html exposing (..)
import Html.Attributes exposing (href)
import Article.Articles.R8.ElmBlog as ElmBlog

type Msg
    = GotElmBlogMsg ElmBlog.Msg

viewPost : Int -> Html Msg
viewPost id =
    div []
        [ a [ href "/" ] [ text "←　一覧に戻る" ]
        , h1 [] [ text ("記事" ++ String.fromInt id) ]
        , div []
              [ case id of
                  1 ->
                    Html.map GotElmBlogMsg ElmBlog.view

                  _ ->
                    text "記事が見つかりません"
              ]
        ]