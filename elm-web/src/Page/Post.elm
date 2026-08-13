module Page.Post exposing (viewPost, Msg)

import Browser
import Html exposing (..)
import Url exposing (Url)
import Html.Attributes exposing (href)
import Browser.Navigation as Nav
import Route exposing (Route(..))
import Article.Articles.R8.ElmBlog as ElmBlog

type alias Model =
     {
        key : Nav.Key
        ,route : Route
     }

type Msg 
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url
    | GotElmBlogMsg ElmBlog.Msg

init : () -> Url -> Nav.Key -> (Model , Cmd Msg)
init _ url key =
    ( { key = key, route = Route.parseUrl url }, Cmd.none)

update : Msg -> Model -> (Model , Cmd Msg)
update msg model =
    case msg of
        GotElmBlogMsg _->
           (model, Cmd.none)

viewPost : Route -> Int -> Html Msg
viewPost id =
    div []
        [ a[href "/"][ text "←　一覧に戻る"]
        , h1 [] [text ("記事"++ String.fromInt id)]
        , div []
              [ case route of
                  ElmBlog ->
                    Html.map GotElmBlogMsg ElmBlog.view.content

                  _ ->
                  text ""  
              ]
        ]