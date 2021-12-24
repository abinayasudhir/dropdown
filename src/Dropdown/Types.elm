module Dropdown.Types exposing (AddItem, Config, EditItem, Model, Msg(..), OpenState(..), Option)

import Css exposing (Style)
import FontAwesome.Icon exposing (Icon)
import Keyboard.Event exposing (KeyboardEvent)


type alias AddItem msg =
    { msg : msg
    , text : String
    , icon : Icon
    }


type alias EditItem msg item =
    { msg : item -> msg
    , icon : Icon
    }


type alias Config msg item =
    { addItem : Maybe (AddItem msg)
    , editItem : Maybe (EditItem msg item)
    , action : Msg item -> msg
    , addItemStyle : List Style
    , itemStyle : List Style
    , labelStyle : List Style
    , descriptionStyle : List Style
    , containerStyle : List Style
    , itemContainerStyle : List Style
    }


type alias Option item =
    { label : String
    , description : Maybe String
    , value : item
    }


type OpenState
    = Opened
    | Closed


type alias Model item =
    { options : List (Option item)
    , value : Maybe item
    , state : OpenState
    }


type Msg item
    = Open
    | Close
    | Select item
    | HandleKeyboardEvent KeyboardEvent
