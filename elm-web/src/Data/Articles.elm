module Data.Articles exposing (Article,all,findTitle)

type alias Article =
    {
        id :Int
       ,title :String
       ,date :String 
    }

all : List Article 
all =
    [
        {id=1,title ="このサイトをElmで作成した話", date="2026.08.21"}
       ,{id=2,title ="2番目のサイト", date=""}
       ,{id=3,title ="3番目のサイト", date=""}
    ]

findTitle :Int -> String
findTitle id=
    all
       |> List.filter(\a-> a.id == id)
       |> List.head
       |> Maybe.map .title
       |> Maybe.withDefault "記事が見つかりません"
