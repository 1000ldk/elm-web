module Route exposing (Route(..), parseUrl)

import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, (</>), int, map, oneOf, s, top, parse)

type Route
    = Home
    | Post Int
    | About
    | NotFound

routeParser : Parser (Route -> a)a
routeParser =
    oneOf
        [ Parser.map Home top
        , Parser.map Post (s "post" </>int)
        , Parser.map About(s"about")
        ]

{-| GitHub Pages のプロジェクトページでは "/elm-web/" 配下に置かれるため、
基準パス(index.html の <base> から渡ってくる)を取り除いてから解析する。
ローカル開発では基準パスが "/" なので何も変わらない。
-}
parseUrl : String -> Url -> Route
parseUrl basePath url =
    Maybe.withDefault NotFound (parse routeParser (stripBasePath basePath url))

stripBasePath : String -> Url -> Url
stripBasePath basePath url =
    let
        prefix =
            String.dropRight 1 basePath
    in
    if prefix /= "" && String.startsWith prefix url.path then
        { url | path = String.dropLeft (String.length prefix) url.path }

    else
        url
