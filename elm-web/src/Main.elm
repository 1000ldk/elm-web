module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (href)
import Url exposing (Url)
import Route exposing (Route(..))
import Page.Home as Home
import Page.Post as Post
import Page.About as About
import Element exposing(Element)
import Element.Background as Background
import Element.Font as Font
import Element.Border as Border
import Layout

type alias Model =
     {
        key : Nav.Key
       ,page : Page
       ,basePath : String
     }

-- フラグには index.html の <base> が示すパス("/" や "/elm-web/")が入る
init : String -> Url -> Nav.Key -> ( Model, Cmd Msg )
init basePath url key =
    let
        ( page, cmd ) = initPage (Route.parseUrl basePath url) key
    in
    ( { key = key, page = page, basePath = basePath }, cmd )

type Msg 
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url
    | GotHomeMsg Home.Msg
    | GotPostMsg Post.Msg
    | GotAboutMsg About.Msg

type Page
    = HomePage Home.Model
    | PostPage Post.Model
    | AboutPage About.Model
    | NotFoundPage

initPage : Route -> Nav.Key -> ( Page, Cmd Msg )
initPage route key =
    case route of
        Home ->
            let
                ( m, cmd ) = Home.init
            in
            ( HomePage m, Cmd.map GotHomeMsg cmd )

        Post id ->
            let
                ( m, cmd ) = Post.init id
            in
            ( PostPage m, Cmd.map GotPostMsg cmd )

        About ->
            let
                ( m, cmd ) = About.init
            in
            ( AboutPage m, Cmd.map GotAboutMsg cmd )

        NotFound ->
            ( NotFoundPage, Cmd.none )  

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.page ) of
        ( LinkClicked (Browser.Internal url), _ ) ->
            ( model, Nav.pushUrl model.key (Url.toString url) )

        ( LinkClicked (Browser.External href), _ ) ->
            ( model, Nav.load href )

        ( UrlChanged url, _ ) ->
            let
                ( page, cmd ) = initPage (Route.parseUrl model.basePath url) model.key
            in
            ( { model | page = page }, cmd )

        ( GotPostMsg subMsg, PostPage subModel ) ->
            let
                ( newSubModel, cmd ) = Post.update subMsg subModel
            in
            ( { model | page = PostPage newSubModel }, Cmd.map GotPostMsg cmd )

        _ ->
            ( model, Cmd.none )   



view : Model -> Browser.Document Msg
view model =
    { title = "1000ldk Blog"
    , body =
        [ Layout.view
            [ case model.page of
                HomePage m -> Html.map GotHomeMsg (Home.home m)
                PostPage m -> Html.map GotPostMsg (Post.view m)
                AboutPage m -> Html.map GotAboutMsg (About.me m)
                NotFoundPage -> text "ページが見つかりません"
            ]
        ]
    }

main : Program String Model Msg
main = 
    Browser.application 
       { init = init
       , view = view
       , update = update
       , subscriptions =\_ -> Sub.none
       , onUrlChange = UrlChanged
       , onUrlRequest = LinkClicked
       }