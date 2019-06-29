module Main exposing (main)

import Browser
import Html exposing (Html, a, footer, h1, header, img, li, node, p, section, text, ul)
import Html.Attributes exposing (class, href, src, target)


main =
    Browser.document
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


view : Model -> Browser.Document Msg
view model =
    { title = "Elm 0.19 starter"
    , body =
        [ siteHeader
        , node "main"
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

            -- , img [ src "./assets/images/Elm_logo.png" ] []
            ]
        , siteFooter
        ]
    }


siteHeader : Html Msg
siteHeader =
    header [ class "site-header" ]
        [ h1 [] [ text "elm-stafighter is taking off." ]
        ]


siteFooter : Html Msg
siteFooter =
    footer [ class "site-footer" ]
        [ p [ class "copyright" ] [ text "© 2019 y047aka" ]
        ]
