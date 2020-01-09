module Data exposing (Celeb, Brand, celebList)

import Url exposing (..)


type alias Url = String

type alias Celeb =
    { id : String
    , name : String
    , image : Url
    , endorsements : List Brand
    , twitterHandle : Url
    , instagramHandle : Url
    }

type alias Brand =
    { id : String
    , name : String
    , image : Url
    }

navratanTel : Brand
navratanTel = Brand "1" "Navratan Tel" "/brands/1.png" 

micromax : Brand
micromax = Brand "2" "Micromax" "/brands/2.png"

amitabh : Celeb
amitabh =
    { id = "1"
    , name = "Amitabh Bacchan"
    , image = "celebs-pics/1.png"
    , endorsements = [navratanTel]
    , twitterHandle = "https://twitter.com/srbachchan"
    , instagramHandle = "https://www.instagram.com/amitabhbachchan/"
    }

akshay : Celeb
akshay =
    { id = "2"
    , name = "Akshay Kumar"
    , image = "celebs-pics/akshay.jpeg"
    , endorsements = [micromax]
    , twitterHandle = "https://twitter.com/akshaykumar/"
    , instagramHandle = "https://www.instagram.com/akshaykumar/"
    }

celebList : List Celeb
celebList =
    [ amitabh, akshay ]