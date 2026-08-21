module Page.Post exposing (viewPost, Msg)

import Html exposing (..)
import Html.Attributes exposing (href)
import Article.Articles.R8.ElmBlog as ElmBlog
import Markdown
import Data.Articles as Articles

type Msg
    = GotElmBlogMsg ElmBlog.Msg

viewPost : Int -> Html Msg
viewPost id =
    div []
        [ a [ href "/" ] [ text "←　一覧に戻る" ]
        , h1 [] [ text (Articles.findTitle id) ]
        , div []
              [ case id of
                  1 ->
                    Html.map GotElmBlogMsg ElmBlog.view

                  _ ->
                    text "記事が見つかりません"
              ]
        ]