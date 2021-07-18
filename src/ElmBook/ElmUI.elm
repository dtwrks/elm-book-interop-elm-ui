module ElmBook.ElmUI exposing (Book, book, Chapter)

{-|

@docs Book, book, Chapter

-}

import Element exposing (Element, layout)
import ElmBook.Custom exposing (customBook)


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
book =
    customBook (layout [])
