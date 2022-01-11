module Home.View exposing (..)

-- import Bulma.CDN exposing (..)
-- import Bulma.Elements exposing (..)
-- import Bulma.Modifiers exposing (..)

import Css exposing (color, hover, rgb)
import Dropdown.State as DD exposing (defaultConfig, withAddItem, withAddItemStyle, withEditItem)
import Dropdown.Types as DD
import Dropdown.View as DD
import FontAwesome.Icon exposing (viewIcon)
import FontAwesome.Solid as FAS
import FontAwesome.Styles exposing (css)
import Home.Types exposing (Gender(..), Model, Msg(..))
import Html exposing (Html, div, i, main_, p, section, text)
import Html.Attributes exposing (attribute, class, default, href, placeholder, rel, src, style, type_)
import Html.Lazy exposing (lazy2)


view : Model -> Html Msg
view model =
    let
        dd1Config : DD.Config Msg String
        dd1Config =
            defaultConfig DD1

        dd2Config : DD.Config Msg String
        dd2Config =
            defaultConfig DD2
                |> withAddItem AddNewItem FAS.plus "Add new plan"

        dd3Config : DD.Config Msg String
        dd3Config =
            defaultConfig DD3
                |> withAddItem AddNewItem FAS.plus "Add new plan"
                |> withEditItem EditItem FAS.pencilAlt

        dd4Config : DD.Config Msg String
        dd4Config =
            defaultConfig DD4
                |> withAddItem AddNewItem FAS.plus "Add new plan"
                |> withEditItem EditItem FAS.pencilAlt
                |> withAddItemStyle [ Css.color (rgb 255 0 0), hover [ Css.color (rgb 0 255 0) ] ]

        dd5Config : DD.Config Msg Gender
        dd5Config =
            defaultConfig DD5
                |> withAddItem AddNewItem FAS.plus "Add new plan"
                |> withEditItem EditGender FAS.pencilAlt
    in
    main_
        [ class "container" ]
        [ css
        , text "only default configuration"
        , lazy2 DD.view dd1Config model.dropDown1
        , text "default with Add New"
        , lazy2 DD.view dd2Config model.dropDown2
        , text "default with Add New and Edit"
        , lazy2 DD.view dd3Config model.dropDown3
        , text "default with Add New, Edit and style customization"
        , lazy2 DD.view dd4Config model.dropDown4
        , text "Gender Type"
        , lazy2 DD.view dd5Config model.dropDown5
        ]
