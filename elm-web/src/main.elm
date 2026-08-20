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


type alias Model =
     {
        key : Nav.Key
       ,route : Route
     }

init : () -> Url -> Nav.Key -> (Model , Cmd Msg)
init _ url key =
    ( { key = key, route = Route.parseUrl url }, Cmd.none)

type Msg 
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url
    | GotHomeMsg Home.Msg
    | GotPostMsg Post.Msg
    | GotAboutMsg About.Msg


update : Msg -> Model -> (Model , Cmd Msg)
update msg model =
    case msg of
        LinkClicked urlRequest ->
           case urlRequest of
                Browser.Internal url ->
                  (model, Nav.pushUrl model.key (Url.toString url))

                Browser.External href ->
                  (model, Nav.load href)

        UrlChanged url ->
           ({model| route = Route.parseUrl url}, Cmd.none) 

        GotHomeMsg _->
           (model, Cmd.none)

        GotPostMsg _->
           (model, Cmd.none)

        GotAboutMsg _->
           (model, Cmd.none)    



view : Model -> Browser.Document Msg
view model=
    { title = "1000ldk Blog"
    , body =
        [ case model.route of
            Home ->
               Html.map GotHomeMsg (Home.home model)
            
            Post id ->
               Html.map GotPostMsg (Post.viewPost id)

            About ->
               Html.map GotAboutMsg (About.me)   

            NotFound ->
               text "ページが見つかりません"
               
        ]
    }

main : Program () Model Msg
main = 
    Browser.application 
       { init = init
       , view = view
       , update = update
       , subscriptions =\_ -> Sub.none
       , onUrlChange = UrlChanged
       , onUrlRequest = LinkClicked
       }