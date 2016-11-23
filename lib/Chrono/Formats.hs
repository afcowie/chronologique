--
-- Time to manipulate time
--
-- Copyright © 2013-2016 Operational Dynamics Consulting, Pty Ltd and Others
--
-- The code in this file, and the program it is a part of, is
-- made available to you by its authors as open source software:
-- you can redistribute it and/or modify it under the terms of
-- the 3-clause BSD licence.
--

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Chrono.Formats
(
      ISO8601_Precise(..)
    , ISO8601_Seconds(..)
    , ISO8601_Days(..)
    , Posix_Precise(..)
    , Posix_Seconds(..)
) where

import Data.Hourglass

data ISO8601_Precise = ISO8601_Precise

instance TimeFormat ISO8601_Precise where
    toFormat _ = TimeFormatString
        [ Format_Year
        , Format_Text '-'
        , Format_Month2
        , Format_Text '-'
        , Format_Day2
        , Format_Text 'T'
        , Format_Hour
        , Format_Text ':'
        , Format_Minute
        , Format_Text ':'
        , Format_Second
        , Format_Text '.'
        , Format_Precision 9
        , Format_Text 'Z'
        ]

data ISO8601_Seconds = ISO8601_Seconds

instance TimeFormat ISO8601_Seconds where
    toFormat _ = TimeFormatString
        [ Format_Year
        , Format_Text '-'
        , Format_Month2
        , Format_Text '-'
        , Format_Day2
        , Format_Text 'T'
        , Format_Hour
        , Format_Text ':'
        , Format_Minute
        , Format_Text ':'
        , Format_Second
        , Format_Text 'Z'
        ]

data ISO8601_Days = ISO8601_Days

instance TimeFormat ISO8601_Days where
    toFormat _ = TimeFormatString
        [ Format_Year
        , Format_Text '-'
        , Format_Month2
        , Format_Text '-'
        , Format_Day2
        ]

data Posix_Precise = Posix_Precise

instance TimeFormat Posix_Precise where
    toFormat _ = TimeFormatString 
        [ Format_UnixSecond
        , Format_Text '.'
        , Format_NanoSecond
        ]

data Posix_Seconds = Posix_Seconds

instance TimeFormat Posix_Seconds where
    toFormat _ = TimeFormatString 
        [ Format_UnixSecond
        ]
