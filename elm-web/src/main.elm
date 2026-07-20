import Browser
import Html exposing(Html, button, div, text)
import Html.Events exposing (onClick)

type alias Model = {count:Int}

initailModel: Model
initailModel = {count=0}

type Msg
= Increment
| Decrement

update:Msg->Model->Model
update msg model=
case msg of 
Increment->
{model|count=model.count+1}

Decrement->
{model|count=model.count-1}

view:Model->Html Msg
view model=
div[]
[button[onClick Decrement][test"-"]
div[][text(String.fromInt model.count)]
button[onClick Increment][test"+"]
]

main:Program()Model Msg
main=
Browser.sandbox
{init=initailModel
view=view
update=update
}