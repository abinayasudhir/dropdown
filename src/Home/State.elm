module Home.State exposing (..)

import Dropdown.State as DD
import Home.Types exposing (..)


init : ( Model, Cmd Msg )
init =
    ( { dropDown1 =
            DD.init
                [ { label = "Worst-case", description = Just "This is the worst case scenario", value = "Worst-case" }
                , { label = "Pessimistic", description = Just "This is the 30th percentile(0 - most pessimistic/ 100 - most optimistic", value = "Pessimistic" }
                , { label = "Median", description = Just "This is the 50th percentile(0 - most pessimistic / 100 - most optimistic", value = "Median" }
                , { label = "Optimistic", description = Just "this is the 70th percentile", value = "Optimistic" }
                , { label = "Option 5", description = Just "this is the 30th percentile", value = "Option 5" }
                , { label = "Option 6", description = Just "this is the 30th percentile", value = "Option 6" }
                , { label = "Option 7", description = Just "this is the 30th percentile", value = "Option 7" }
                , { label = "Option 8", description = Just "this is the 30th percentile", value = "Option 8" }
                , { label = "Option 9", description = Nothing, value = "Option 9" }
                , { label = "this is the 30th percentile this is the 30th percentile this is the 30th percentile", description = Just "this is the 30th percentile", value = "Option 10" }
                ]
                (Just "Optimistic")
      , dropDown2 =
            DD.init
                [ { label = "Worst-case", description = Just "This is the worst case scenario", value = "Worst-case" }
                , { label = "Pessimistic", description = Just "This is the 30th percentile(0 - most pessimistic/ 100 - most optimistic", value = "Pessimistic" }
                , { label = "Median", description = Just "This is the 50th percentile(0 - most pessimistic / 100 - most optimistic", value = "Median" }
                , { label = "Optimistic", description = Just "this is the 70th percentile", value = "Optimistic" }
                , { label = "Option 5", description = Just "this is the 30th percentile", value = "Option 5" }
                , { label = "Option 6", description = Just "this is the 30th percentile", value = "Option 6" }
                , { label = "Option 7", description = Just "this is the 30th percentile", value = "Option 7" }
                , { label = "Option 8", description = Just "this is the 30th percentile", value = "Option 8" }
                , { label = "Option 9", description = Nothing, value = "Option 9" }
                , { label = "this is the 30th percentile this is the 30th percentile this is the 30th percentile", description = Just "this is the 30th percentile", value = "Option 10" }
                ]
                (Just "Optimistic")
      , dropDown3 =
            DD.init
                [ { label = "Worst-case", description = Just "This is the worst case scenario", value = "Worst-case" }
                , { label = "Pessimistic", description = Just "This is the 30th percentile(0 - most pessimistic/ 100 - most optimistic", value = "Pessimistic" }
                , { label = "Median", description = Just "This is the 50th percentile(0 - most pessimistic / 100 - most optimistic", value = "Median" }
                , { label = "Optimistic", description = Just "this is the 70th percentile", value = "Optimistic" }
                , { label = "Option 5", description = Just "this is the 30th percentile", value = "Option 5" }
                , { label = "Option 6", description = Just "this is the 30th percentile", value = "Option 6" }
                , { label = "Option 7", description = Just "this is the 30th percentile", value = "Option 7" }
                , { label = "Option 8", description = Just "this is the 30th percentile", value = "Option 8" }
                , { label = "Option 9", description = Nothing, value = "Option 9" }
                , { label = "this is the 30th percentile this is the 30th percentile this is the 30th percentile", description = Just "this is the 30th percentile", value = "Option 10" }
                ]
                (Just "Optimistic")
      , dropDown4 =
            DD.init
                [ { label = "Worst-case", description = Just "This is the worst case scenario", value = "Worst-case" }
                , { label = "Pessimistic", description = Just "This is the 30th percentile(0 - most pessimistic/ 100 - most optimistic", value = "Pessimistic" }
                , { label = "Median", description = Just "This is the 50th percentile(0 - most pessimistic / 100 - most optimistic", value = "Median" }
                , { label = "Optimistic", description = Just "this is the 70th percentile", value = "Optimistic" }
                , { label = "Option 5", description = Just "this is the 30th percentile", value = "Option 5" }
                , { label = "Option 6", description = Just "this is the 30th percentile", value = "Option 6" }
                , { label = "Option 7", description = Just "this is the 30th percentile", value = "Option 7" }
                , { label = "Option 8", description = Just "this is the 30th percentile", value = "Option 8" }
                , { label = "Option 9", description = Nothing, value = "Option 9" }
                , { label = "this is the 30th percentile this is the 30th percentile this is the 30th percentile", description = Just "this is the 30th percentile", value = "Option 10" }
                ]
                (Just "Optimistic")
      , dropDown5 =
            DD.init
                [ { label = "Male", description = Just "This is the worst case scenario", value = Male }
                , { label = "Female", description = Just "This is the 30th percentile(0 - most pessimistic/ 100 - most optimistic", value = Female }
                , { label = "Non Binary", description = Just "This is the 50th percentile(0 - most pessimistic / 100 - most optimistic", value = NonBinary }
                ]
                Nothing
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddNewItem ->
            let
                _ =
                    Debug.log "AddNewItem" "called"
            in
            ( model, Cmd.none )

        EditItem item ->
            let
                _ =
                    Debug.log "EditItem called with" item
            in
            ( model, Cmd.none )

        EditGender item ->
            let
                _ =
                    Debug.log "EditGender called with" item
            in
            ( model, Cmd.none )

        DD1 ddMsg ->
            let
                ( newModel, newCmd ) =
                    DD.update ddMsg model.dropDown1
            in
            ( { model | dropDown1 = newModel }
            , Cmd.map DD1 newCmd
            )

        DD2 ddMsg ->
            let
                ( newModel, newCmd ) =
                    DD.update ddMsg model.dropDown2
            in
            ( { model | dropDown2 = newModel }
            , Cmd.map DD2 newCmd
            )

        DD3 ddMsg ->
            let
                ( newModel, newCmd ) =
                    DD.update ddMsg model.dropDown3
            in
            ( { model | dropDown3 = newModel }
            , Cmd.map DD3 newCmd
            )

        DD4 ddMsg ->
            let
                ( newModel, newCmd ) =
                    DD.update ddMsg model.dropDown4
            in
            ( { model | dropDown4 = newModel }
            , Cmd.map DD4 newCmd
            )

        DD5 ddMsg ->
            let
                ( newModel, newCmd ) =
                    DD.update ddMsg model.dropDown5
            in
            ( { model | dropDown5 = newModel }
            , Cmd.map DD5 newCmd
            )
