module Main exposing (main)

import Browser
import Html exposing (Html, a, h1, img, li, main_, section, text, ul)
import Html.Attributes exposing (href, src, target)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { userState : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model ""
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    main_
        []
        [ section []
            [ h1 [] [ text "Elm official..." ]
            , ul []
                [ li []
                    [ a [ href "https://elm-lang.org", target "_blank" ]
                        [ text "Elm - A delightful language for reliable webapps" ]
                    ]
                , li []
                    [ a [ href "https://guide.elm-lang.org", target "_blank" ]
                        [ text "Introduction · An Introduction to Elm" ]
                    ]
                ]
            ]
        , section []
            [ h1 [] [ text "Community in Japan" ]
            , ul []
                [ li []
                    [ a [ href "https://elm-lang.jp", target "_blank" ]
                        [ text "Elm-jp" ]
                    ]
                , li []
                    [ a [ href "https://guide.elm-lang.jp", target "_blank" ]
                        [ text "はじめに · An Introduction to Elm" ]
                    ]
                , li []
                    [ a [ href "http://jinjor-labo.hatenablog.com/entry/2019/02/26/112019", target "_blank" ]
                        [ text "『基礎からわかる Elm』（Author's post）" ]
                    ]
                ]
            ]

        -- , img [ src "./static/images/Elm_logo.png" ] []
        ]
