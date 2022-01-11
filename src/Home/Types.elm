module Home.Types exposing (Gender(..), Model, Msg(..))

import Dropdown.Types as DD


type Gender
    = Male
    | Female
    | NonBinary


type alias Model =
    { dropDown1 : DD.Model String
    , dropDown2 : DD.Model String
    , dropDown3 : DD.Model String
    , dropDown4 : DD.Model String
    , dropDown5 : DD.Model Gender
    }


type Msg
    = DD1 (DD.Msg String)
    | AddNewItem
    | EditItem String
    | EditGender Gender
    | DD2 (DD.Msg String)
    | DD3 (DD.Msg String)
    | DD4 (DD.Msg String)
    | DD5 (DD.Msg Gender)



-- DD1 = (DD.Msg String) -> Msg
-- DD.Msg = (item -> DD.Msg item)
-- DD.Msg = Type -> Type
