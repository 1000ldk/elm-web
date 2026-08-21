module Layout exposing (view)

import Html exposing (Html, div, header, nav, a, span, text, node)
import Html.Attributes exposing (class, href)


view : List (Html msg) -> Html msg
view content =
    div [ class "container" ]
        (styles
            :: header [ class "site-header" ]
                [ span [ class "site-title" ] [ text "1000LDK Blog" ]
                , nav [ class "site-nav" ]
                    [ a [ href "/about" ] [ text "About" ] ]
                ]
            :: content
        )


styles : Html msg
styles =
    node "style" [] [ text css ]


css : String
css = """
* { box-sizing: border-box; }
body { margin: 0; }
.container { max-width: 680px; margin: 0 auto; padding: 40px 24px 80px;
  font-family: -apple-system, "Hiragino Kaku Gothic ProN", "Hiragino Sans", sans-serif;
  color: #1a1a1a; }
.site-header { display: flex; align-items: center; justify-content: space-between;
  padding-bottom: 12px; border-bottom: 1px solid #eaeaea; margin-bottom: 32px; }
.site-title { font-weight: 600; font-size: 15px; }
.site-nav a { font-size: 14px; color: #666; text-decoration: none; margin-left: 20px; }
.site-nav a:hover { color: #1a1a1a; }
.post-title { font-size: 22px; font-weight: 600; margin: 0 0 6px; }
.post-subtitle { font-size: 14px; color: #888; margin: 0 0 32px; }
.post-list { list-style: none; margin: 0; padding: 0; }
.post-list li { border-top: 1px solid #eaeaea; padding: 16px 0; }
.post-list li:last-child { border-bottom: 1px solid #eaeaea; }
.post-list a { display: block; text-decoration: none; color: #1a1a1a;
  font-weight: 500; font-size: 16px; }
.post-list a:hover { text-decoration: underline; }
.post-list a { display: flex; align-items: baseline; justify-content: space-between;
  gap: 12px; text-decoration: none; color: #1a1a1a; padding: 2px 0; }
.post-item-title { font-weight: 500; font-size: 16px; }
.post-item-date { font-size: 12px; color: #999; white-space: nowrap; }
.post-list a:hover .post-item-title { text-decoration: underline; }
"""