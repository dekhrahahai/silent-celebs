module Main exposing (..)

import Browser
import Html exposing (Html)
import Html.Attributes exposing (src)
import Url exposing (..)
import Browser.Navigation as Nav
import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import Element.Background as Background
import Data exposing (..)

---- MODEL ----

scaled = modular 16 1.25


type alias Model =
    { celebs : List Celeb 
    , url : Url.Url
    , key : Nav.Key
    }



initialModel : Url.Url -> Nav.Key -> Model
initialModel url key =
    { celebs = celebList
    , url = url 
    , key = key
    }

init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( initialModel url key
    , Cmd.none 
    )

---- UPDATE ----


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----

view : Model -> Browser.Document Msg
view model =
    { title = "Silent Celebrities!"
    , body = page model
    }

page : Model -> List (Html Msg)
page model =
    [ layout 
        [ Font.family  
            [ Font.typeface "Gotham Rounded A"
            , Font.sansSerif
            ]
        , Font.color <| rgb255 50 50 50
        ] <|
        column 
            [ height fill
            , width fill
            , spacing 20
            , centerX
            ]
            [ headerRow
            , content model
            , footer
            ]
    ]

content : Model -> Element Msg
content model =
    column
    [ width fill 
    , spacing 10
    , padding 40
    ]
    ([ titleRow ] ++ List.map celebCards model.celebs)

headerRow : Element Msg
headerRow =
    column 
        [ width fill
        , Background.color <| rgb255 215 215 215
        , centerX
        , padding 50
        , Font.heavy
        ]
        [ wrappedRow 
            [ centerX
            , Font.size (round <| scaled 3)
            , Font.hairline
            , Font.letterSpacing 18
            ] 
            [text "CHOOSE WELL"]
        , paragraph 
            [ Font.size (round <| scaled 5)
            , Font.letterSpacing 0.5
            , centerX 
            , Font.hairline
            ] 
            [ el [] (text "we")
            , el [ Background.color (rgba255 242 108 31 0.8) ] (text " vote ")
            , el [ Background.color (rgba 232 232 232 0.5)] (text " EVERYDAY ")
            , el [] (text "with our")
            , el [ Background.color (rgba255 36 162 36 0.8) ] (text " money ")
            ]
        ]

titleRow : Element Msg
titleRow = 
    wrappedRow
    [ width fill
    , centerX
    , padding 25
    , Font.size (round <| scaled 2)
    ]
    [ column 
        [ centerX 
        , Font.bold
        , width <| fillPortion 2
        , padding 15
        , Font.size (round <| scaled 1)
        ]
        [ paragraph [] [ text "THESE CELEBRITIES ARE SILENT WHILE THE NATION BURNS!" ]
        ]
    , column
        [ centerX 
        , width <| fillPortion 3
        ]
        [ paragraph 
            [ Font.extraBold 
            , padding 15
            ] 
            [text "THEIR ENDORSEMENTS FUNDS THEIR SILENCE."]
        , paragraph 
            [ Font.size (round <| scaled -2)]
            [ text "(The logos are the property of their brands. No copyright infringement intended in their use here.)" ]
        ]
    ]


celebCards : Celeb -> Element Msg
celebCards celeb =
    wrappedRow
        [ width fill
        , spacing 50
        , padding 25
        , Border.shadow 
            { offset = (0.7, 0.7)
            , size = 0.6
            , blur = 0.6
            , color = rgb255 34 34 34
            }
        ]
        [ image
            [ width <| px 150
            , height <| px 150
            ] 
            { src = celeb.image
            , description = celeb.name
            }
        , column
            [ width <| fillPortion 1 ]
            [(text celeb.name)
            , socialMediaRow celeb
            ]
        , wrappedRow
            [ width <|fillPortion 3 
            , alignRight
            ]
            <| List.map brandTile celeb.endorsements
        ]

socialMediaRow : Celeb -> Element Msg
socialMediaRow celeb =
    row 
        [ padding 5 ]
        [ link 
            [ width <| px 30
            , height <| px 30 
            , Background.image "twitter-icon-300x300.png"
            ]
            { url = celeb.twitterHandle
            , label = text ""}
        , link
            [ width <| px 30
            , height <| px 30
            , Background.image "ig-512x512.png"
            ]
            { url = celeb.instagramHandle
            , label = text ""
            }
        ]

brandTile : Brand -> Element Msg
brandTile brand =
    image
        [ width <| px 75
        , height <| px 75
        ]
        { src = brand.image
        , description = brand.name
        }


footerColumnAttribs : Int -> List (Element.Attribute Msg)
footerColumnAttribs leftColumnWidth =
    [ width <| fillPortion leftColumnWidth
    , height fill
    , padding 10
    , Font.variant Font.smallCaps
    , Font.size (round <| scaled 1)
    ]

footer : Element Msg
footer =
    column
    [ width fill 
    , height <| fillPortion 2
    , spacing 100
    , padding 50
    , Background.color <| rgb255 34 34 34
    , Font.color <| rgb255 255 255 255
    , Font.italic
    ]
    [ wrappedRow 
        [ width fill
        ]
        [ column (footerColumnAttribs 2)
            [ text "WHY"
            , paragraph 
                [ centerX
                , Font.size (round <| scaled -1) 
                , Font.hairline
                , padding 20
                , Font.alignLeft
                ]
                [ text "The rich and the influencial think that they can continue in their private heavens, and their priviledge would shield them from everything that's burning the country. These ignorant masters of mankind have forgotten that their priviledge is owed to us down to the last rupee! It is time we showed them who runs the country!"]
                 ]
        , column (footerColumnAttribs 2)
            [ text "Support Us"
            , paragraph
                [ centerX
                , Font.size (round <| scaled -1)
                , Font.hairline
                , padding 20
                , Font.alignLeft
                ]
                [ text "If you can help in updating the site or support it by buying a domain name, etc. please reach out!"]
            ]
        , column (footerColumnAttribs 1)
            [ text "Contact" ]
        ]
    , el  
        [ centerX
        , Font.size (round <| scaled -1)
        ] 
        (text " ~ Made with love using Elm ~") 
    ]

---- PROGRAM ----

main : Program () Model Msg
main =
    Browser.application
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }