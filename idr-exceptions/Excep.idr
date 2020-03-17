import Effects
import Effect.Exception

data Error = NotANumber | OutOfRange

parseNum : Int -> String -> Effects.SimpleEff.Eff Int [EXCEPTION Error]
parseNum num str
  = if all isDigit (unpack str)
       then let x = cast str in
            if x >= 0 && x <= num
               then pure x
               else raise OutOfRange
       else raise OutOfRange

use : Int -> String -> Bool
use num str =
  let x = parseNum num str in
  ?foo
