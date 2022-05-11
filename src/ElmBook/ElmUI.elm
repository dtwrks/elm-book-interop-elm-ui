module ElmBook.ElmUI exposing (Book, book, Chapter)

{-|

@docs Book, book, Chapter

-}

import Element exposing (Element, layout, layoutWith, noStaticStyleSheet)
import ElmBook
import ElmBook.Custom exposing (customBook)
import ElmBook.ThemeOptions


type alias Html state =
    Element (ElmBook.Custom.Msg state)


type alias BookBuilder state =
    ElmBook.Custom.BookBuilder state (Html state)


{-| Replaces `ElmBook.Book`
-}
type alias Book state =
    ElmBook.Custom.Book state (Html state)


{-| Replaces `ElmBook.Chapter.Chapter`
-}
type alias Chapter state =
    ElmBook.Custom.Chapter state (Html state)


{-| Replaces `ElmBook.book`
-}
book : String -> BookBuilder state
book title =
    customBook
        (layoutWith
            { options = [ noStaticStyleSheet ]
            }
            []
        )
        title
        |> ElmBook.withThemeOptions
            -- By adding a blank layout element here,
            -- all required global styles for elm-ui are loaded.
            -- Then we can use `layoutWith noStaticStylesheet`
            -- on subsequent calls and remove style conflicts.
            [ ElmBook.ThemeOptions.globals
                [ Element.text ""
                    |> layout []
                    |> Element.html
                ]
            ]
