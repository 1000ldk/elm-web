module Api.Endpoint exposing (Endpoint, article)

import Article.slug as Slig exposing (Slug)
import Http

request :
    { url : Endpoint}

article : Slug -> Endpoint
article slug =
    url [ "articles", Slug.toString slug ] []