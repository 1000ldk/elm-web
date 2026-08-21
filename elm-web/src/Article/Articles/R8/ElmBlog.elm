module Article.Articles.R8.ElmBlog exposing (view, Msg)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Markdown


type Msg
    = SomeEvent
    | AnotherEvent String


content : String
content =
    """
# こんにちは1000ldkです

現状ではmarkdownでのブログ生成方法が分からないため、
elm直書きの表示にいたします。


なんだこれ
"""


view : Html Msg
view =
    div [ class "article-body" ]
        [ Markdown.toHtml [] content ]