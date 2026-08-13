module Route exposing (Route(..), parseUrl)

import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, (</>), int, map, oneOf, s, top, parse)

type Route
    = Home
    | Post Int
    | ElmBlog
    | NotFound

routeParser : Parser (Route -> a)a
routeParser =
    oneOf
        [Parser.map Home top
        , Parser.map Post (s "post" </>int)  
        ]

parseUrl : Url -> Route
parseUrl url =
    Maybe.withDefault NotFound (parse routeParser url)
