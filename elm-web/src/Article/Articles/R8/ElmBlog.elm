module Article.Articles.R8.ElmBlog exposing(view,Msg)

import Html exposing (Html, div, h1, img, main_, text)
import Html.Attributes exposing(..)

type Msg
    = SomeEvent
    | AnotherEvent String

view : { title : String, content : Html.Html Msg}
view =
    { title = "Elmでこのサイトが作られるまで"
    , content = 
           text "こんにちは1000ldkです"
    }