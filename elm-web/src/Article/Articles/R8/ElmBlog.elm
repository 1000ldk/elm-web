module Article.Articles.R8.ElmBlog exposing(view,Msg)

import Html exposing (Html, div, h1, p, img, main_, text)
import Html.Attributes exposing(..)

type Msg
    = SomeEvent
    | AnotherEvent String

view : Html.Html Msg
view =
    div[]
    [
        h1[][text"こんにちは1000ldkです"]
        , p[][text"現状ではmarkdownでのブログ生成方法が分からないためelm直書きの表示にいたします"]
    ]