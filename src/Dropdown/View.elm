module Dropdown.View exposing (view)

import Css exposing (..)
import Dropdown.Types as DD exposing (AddItem, Config, EditItem, Model, Msg(..), OpenState(..), Option)
import FontAwesome.Icon exposing (viewIcon)
import FontAwesome.Solid as FAS
import Html exposing (Html)
import Html.Events.Extra as HE
import Html.Styled as HS exposing (div, fromUnstyled, span, text, toUnstyled)
import Html.Styled.Attributes as HSA exposing (class, css, tabindex)
import Html.Styled.Events exposing (on, onClick)
import Json.Decode as Decode
import Keyboard.Event exposing (decodeKeyboardEvent)


addItem : List Style -> AddItem msg -> HS.Html msg
addItem styles add =
    div
        [ onClick add.msg
        , class "add-item list-item"
        , css styles
        ]
        [ viewIcon add.icon |> fromUnstyled
        , text add.text
        ]


editItem : item -> EditItem msg item -> HS.Html msg
editItem item edit =
    div
        [ onClick (edit.msg item)
        , class "edit-item"
        ]
        [ viewIcon edit.icon |> fromUnstyled
        ]


view : Config msg item -> Model item -> Html msg
view config model =
    let
        newItem =
            Maybe.map (addItem config.addItemStyle) config.addItem |> Maybe.withDefault (text "")

        displayText =
            List.filter (\a -> Just a.value == model.value) model.options
                |> List.head
                |> Maybe.map .label
                |> Maybe.withDefault "Choose an option"
    in
    toUnstyled <|
        div
            [ tabindex 0
            , on "focusout" <| Decode.succeed (config.action Close)
            , class "dropdown-custom"
            , on "keydown" <|
                Decode.map (config.action << HandleKeyboardEvent) decodeKeyboardEvent
            , HSA.fromUnstyled <|
                HE.onClickStopPropagation <|
                    if model.state == Closed then
                        config.action Open

                    else
                        config.action Close
            , css config.containerStyle
            ]
            [ span
                [ class "top-container"
                ]
                [ span [ class "display-text" ] [ text displayText ]
                , div []
                    [ fromUnstyled <|
                        viewIcon <|
                            if model.state == Closed then
                                FAS.caretDown

                            else
                                FAS.caretUp
                    ]
                ]
            , if model.state == Opened then
                ([ newItem ] ++ List.map (listItem config model.value) model.options)
                    |> div [ class "list-items" ]

              else
                div [] []
            ]


listItem : Config msg item -> Maybe item -> Option item -> HS.Html msg
listItem config value option =
    div [ onClick (config.action <| DD.Select option.value), class "list-item", css config.itemStyle ]
        [ div
            [ class <|
                if Just option.value == value then
                    "selected item-container"

                else
                    "item-container"
            , css config.itemContainerStyle
            ]
            [ if value == Just option.value then
                viewIcon FAS.check |> fromUnstyled

              else
                span [ class "icon-spacer" ] []
            , div [ class "item" ]
                [ span [ class "display-text2", css config.labelStyle ] [ text option.label ]
                , span [ class "desc", css config.descriptionStyle ] [ text <| Maybe.withDefault "" <| option.description ]
                ]
            , Maybe.map (editItem option.value) config.editItem |> Maybe.withDefault (text "")
            ]
        ]
