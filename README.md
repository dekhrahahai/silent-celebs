# To add more celebrities or brands to this list there are 3 things that need to happen before you send a Pull Request
All changes to be done are in the `Data.elm` file and pictures need to be added in the `public/[brands or celebs-pics]` directory (or a folder if you are using windows).

1. To add a brand, add this to the `Data.elm` file:
```elm
myFavBrand : Brand
myFavBrand = Brand "1" "My Favorite Brand" "/brands/1.png" 
```
Ensure that the `id` is one greater than the last brand ID. Also, please add your brand at the end of the list of brands to enhace readability.

2. To add a celebrity, add this to the `Data.elm` file:
```elm
myFavCeleb : Celeb
myFavCeleb =
    { id = "1"
    , name = "My Favorite Star"
    , image = "celebs-pics/1.png"
    , endorsements = [myFavBrand]
    , twitterHandle = "https://twitter.com/shammiheroda"
    , instagramHandle = "https://www.instagram.com/shammiheroda/"
    }
```
Ensure that you pick up the right endorsements for the celebrity that you are adding/removing. `id` field here has similar idea to the brand ID.

3. Add relevant pictures to the `public/brands` or `public/celebs-pics` directory. Ensure that the name of the pictures match the names given in the `image` field of the `Celeb` or `Brand` records that you added. Also, please ensure that you add pictures that are not too huge or too small (typical size would be 512x512 px).


## If you'd like to help with hosting, buying a domain, improving the design or providing suggestions, please reach out at `dekhrahahai [at] protonmail [dot] com` or via this project's issue board \m/

### Troll messages would be archived and saved for posterity with their fake/real profile usernames.
