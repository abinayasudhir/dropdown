module Dropdown.State exposing (defaultConfig, init, update, withAddItem, withAddItemStyle, withContainerStyle, withDescriptionStyle, withEditItem, withItemContainerStyle, withItemStyle, withLabelStyle)

import Css exposing (Style)
import Dropdown.Types exposing (Config, Model, Msg(..), OpenState(..), Option)
import FontAwesome.Icon exposing (Icon)
import Keyboard.Key exposing (Key(..))


init : List (Option item) -> Maybe item -> Model item
init options value =
    { options = options, value = value, state = Closed }


defaultConfig : (Msg item -> msg) -> Config msg item
defaultConfig action =
    { addItem = Nothing
    , editItem = Nothing
    , action = action
    , addItemStyle = []
    , itemStyle = []
    , labelStyle = []
    , descriptionStyle = []
    , containerStyle = []
    , itemContainerStyle = []
    }


withAddItem : msg -> Icon -> String -> Config msg item -> Config msg item
withAddItem msg icon title config =
    { config | addItem = Just { text = title, icon = icon, msg = msg } }


withAddItemStyle : List Style -> Config msg item -> Config msg item
withAddItemStyle styles config =
    { config | addItemStyle = styles }


withItemStyle : List Style -> Config msg item -> Config msg item
withItemStyle styles config =
    { config | itemStyle = styles }


withLabelStyle : List Style -> Config msg item -> Config msg item
withLabelStyle styles config =
    { config | labelStyle = styles }


withDescriptionStyle : List Style -> Config msg item -> Config msg item
withDescriptionStyle styles config =
    { config | descriptionStyle = styles }


withContainerStyle : List Style -> Config msg item -> Config msg item
withContainerStyle styles config =
    { config | containerStyle = styles }


withItemContainerStyle : List Style -> Config msg item -> Config msg item
withItemContainerStyle styles config =
    { config | itemContainerStyle = styles }


withEditItem : (item -> msg) -> Icon -> Config msg item -> Config msg item
withEditItem msg icon config =
    { config | editItem = Just { icon = icon, msg = msg } }


update : Msg item -> Model item -> ( Model item, Cmd (Msg item) )
update msg model =
    case msg of
        Open ->
            ( { model | state = Opened }
            , Cmd.none
            )

        Close ->
            ( { model | state = Closed }
            , Cmd.none
            )

        Select option ->
            ( { model | value = Just option, state = Closed }
            , Cmd.none
            )

        HandleKeyboardEvent { keyCode } ->
            let
                newModel =
                    if keyCode == Escape then
                        { model | state = Closed }

                    else
                        model
            in
            ( newModel
            , Cmd.none
            )
