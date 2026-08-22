module Page.Post exposing (Model, Msg(..), init, update, view)

import Html exposing (..)
import Html.Attributes exposing (href, class)
import Http
import Markdown
import Data.Articles as Articles


type alias Model =
    { id : Int
    , status : Status
    }


type Status
    = Loading
    | Loaded String
    | Failed


type Msg
    = GotArticle (Result Http.Error String)


init : Int -> ( Model, Cmd Msg )
init id =
    ( { id = id, status = Loading }
    , fetchArticle id
    )


fetchArticle : Int -> Cmd Msg
fetchArticle id =
    Http.get
        { url = "articles/" ++ String.fromInt id ++ ".md"
        , expect = Http.expectString GotArticle
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotArticle (Ok raw) ->
            ( { model | status = Loaded raw }, Cmd.none )

        GotArticle (Err _) ->
            ( { model | status = Failed }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ a [ href "./" ] [ text "← 一覧に戻る" ]
        , h1 [] [ text (Articles.findTitle model.id) ]
        , case model.status of
            Loading ->
                p [] [ text "読み込み中..." ]

            Loaded raw ->
                Markdown.toHtml [ class "article-body" ] raw

            Failed ->
                p [] [ text "記事の読み込みに失敗しました" ]
        ]