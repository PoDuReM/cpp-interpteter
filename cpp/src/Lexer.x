{
module Lexer where 
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-
    \" [^\"]* \"      { \s -> TStr (tail $ init s) }
    $white                 ;
    return        { \_ -> TReturn }
    int           { \s -> TType s }
    bool          {\s -> TType s }
    double        {\s -> TType s }
    string        {\s -> TType s }
    if            {\_ -> TIf}
    else          {\_ -> TElse}
    while         {\_ -> TWhile}
    False         {\_ -> TBool False}
    True          {\_ -> TBool True}
    cout          {\_ -> TCout}
    cin           {\_ -> TCin}
    ">>"          {\s -> TOp s}
    "<<"          {\s -> TOp s}
    "=="          {\s -> TOp s}
    "<="          {\s -> TOp s}
    ">="          {\s -> TOp s}
    "!="          {\s -> TOp s }
    $digit+ \. $digit+  {\s -> TDouble (read s)}
    \-$digit+ \. $digit+  {\s -> TDouble (read s)}
    $digit+       {\s -> TInt (read s)}
    \-$digit+     {\s -> TInt (read s)}
    [\=\+\;\*\-\/\{\}\(\)\<\>\,]            {\s -> TOp s}
    $alpha [$alpha $digit \_]* {\s -> TName s}

{
data Token = TElse 
           | TWhile 
           | TCout
           | TOut 
           | TCin 
           | TIn
           | TThen 
           | TReturn 
           | TIf 
           | TType String 
           | TInt Int
           | TDouble Double 
           | TOp String 
           | TStr String
           | TBool Bool
           | TName String deriving (Eq, Show)
}