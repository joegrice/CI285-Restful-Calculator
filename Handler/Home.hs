module Handler.Home where

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
 
import Yesod
import Prelude (IO)
import Import
import Data.Text (Text)
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3,
                              withSmallInput)
import Text.Julius (RawJS (..))

-- This is a handler function for the GET request method on the HomeR
-- resource pattern. All of your resource patterns are defined in
-- config/routes
--
-- The majority of the code you will write in Yesod lives in these handler
-- functions. You can spread them across multiple files if you are so
-- inclined, or create a single monolithic file.
getHomeR :: Handler Html
getHomeR = defaultLayout $ do
        $(widgetFile "homepage")

postHomeR :: Handler Html
postHomeR = defaultLayout $ do
        $(widgetFile "homepage")


-- ADD METHOD
getAddR :: Int -> Int -> Handler TypedContent
getAddR x y = selectRep $ do
    provideRep $ return
        [shamlet|
            <p>#{num1} add #{num2} equals #{res}
        |]
    provideRep $ return $ object
        [ "num1" .= num1
        , "num2" .= num2
        ]
  where
    num1 = x :: Int
    num2 = y :: Int
    res = x + y :: Int

-- SUBTRACT METHOD
getSubR :: Int -> Int -> Handler TypedContent
getSubR x y = selectRep $ do
    provideRep $ return
        [shamlet|
            <p>#{num1} subtract #{num2} equals #{res}
        |]
    provideRep $ return $ object
        [ "num1" .= num1
        , "num2" .= num2
        ]
  where
    num1 = x :: Int
    num2 = y :: Int
    res = x - y :: Int

-- MULTIPLY METHOD
getMultiplyR :: Int -> Int -> Handler TypedContent
getMultiplyR x y = selectRep $ do
    provideRep $ return
        [shamlet|
            <p>#{num1} multiplied by #{num2} equals #{res}
        |]
    provideRep $ return $ object
        [ "num1" .= num1
        , "num2" .= num2
        ]
  where
    num1 = x :: Int
    num2 = y :: Int
    res = x * y :: Int

-- DIVIDE METHOD
getDivideR :: Int -> Int -> Handler TypedContent
getDivideR x y = selectRep $ do
    provideRep $ return
        [shamlet|
            <p>#{num1} divided by #{num2} equals #{res}
        |]
    provideRep $ return $ object
        [ "num1" .= num1
        , "num2" .= num2
        ]
  where
    num1 = x :: Int
    num2 = y :: Int
    res = div x y :: Int
