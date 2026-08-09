module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (href)
import Url exposing (Url)
import Route exposing (Route(..))

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

view : Model -> Browser.Document Msg
view model=
    { title = "1000ldk Blog"
    , body =
        [ case model.route of
            Home ->
               viewHome
            
            Post id ->
            
               viewPost id
               
            NotFound ->
               text "ページが見つかりません"
               
        ]
    }

viewHome : Html Msg
viewHome = 
    div[]
       [ h1 [] [ text "記事一覧"]
       , ul []
           [ li [] [a[href "/post/1"][ text "最初の記事"]]
           , li [] [a[href "/post/2"][ text "2番目の記事"]]
           ]
        ]

viewPost : Int -> Html Msg
viewPost id =
    div []
        [ a[href "/"][ text "←　一覧に戻る"]
        , h1 [] [text ("記事"++ String.fromInt id)]
        , p[] [ text "ここに本文が入ります"]
        ]

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