{
module Parser where
import Lexer
import Type
}

%name parses
%tokentype { Token }
%error { parseError }

%token 
    type   { TType $$   }
    if     { TIf        }
    else   { TElse      }
    return { TReturn    }
    while  { TWhile     }
    cout   { TCout      }
    '<<'   { TOp "<<"   }
    cin    { TCin       }
    '>>'   { TOp ">>"   }
    '='    { TOp "="    }
    '+'    { TOp "+"    }
    '-'    { TOp "-"    }
    '*'    { TOp "*"    }
    '/'    { TOp "/"    }
    ';'    { TOp ";"    }
    '('    { TOp "("    }
    ')'    { TOp ")"    }
    '{'    { TOp "{"    }
    '}'    { TOp "}"    }
    '<'    { TOp "<"    }
    '>'    { TOp ">"    }
    ','    { TOp ","    }
    '=='   { TOp "=="   }
    '<='   { TOp "<="   }
    '>='   { TOp ">="   }
    '!='   { TOp "!="   }
    name   { TName $$   }
    bool   { TBool $$   }
    int    { TInt $$    }
    double { TDouble $$ }
    str    { TStr $$    }
    '"'    { TOp "\""   }

%%

Functions
  : Function Functions { $1 : $2 }
  | {- empty -}        { []      }

Function
  : type name '(' ')' '{' Body '}'
    {Function0 (getType $1) $2 $6}
  | type name '(' type name ')' '{' Body '}'
    {Function1 (getType $1) $2 (getType $4) $5 $8}
  | type name '(' type name ',' type name ')' '{' Body '}'
    { Function2 (getType $1) $2 (getType $4) $5 (getType $7) $8 $11}

Body
  : Statement Body { $1 : $2 }
  | {- empty -}    { []      }

Statement
  : type name '=' Expr ';'
    { VarDecl (getType $1) $2 $4 }
  | type name ';'
    { VarDecl (getType $1) $2 (defaultValue $ getType $1) }
  | name '=' Expr  ';'
    { VarAssi $1 $3 }
  | if '(' Expr ')' '{' Body '}' else '{' Body '}'
    { IfExpr $3 $6 $10 }
  | if '(' Expr ')' '{' Body '}'
    { IfExpr $3 $6 [] }
  | while Expr '{' Body '}'
    { WhileExpr $2 $4 }
  | cout '<<' Expr ';'
    { Cout $3 }
  | cin '>>' name ';'
    { Cin $3 }
  | return Expr ';'
    { VarAssi "funcRetVal'" $2 }
  | name '(' ')' ';'
    { FuncSCall0 $1 }
  | name '(' Expr ')' ';'
    { FuncSCall1 $1 $3 }
  | name '(' Expr ',' Expr ')' ';'
    { FuncSCall2 $1 $3 $5 }

Expr
  : Expr '<' Expr2  { Le $1 $3  }
  | Expr '>' Expr2  { Gt $1 $3  }
  | Expr '==' Expr2 { Eq $1 $3  }
  | Expr '<=' Expr2 { Leq $1 $3 }
  | Expr '>=' Expr2 { Geq $1 $3 }
  | Expr '!=' Expr2 { Neq $1 $3 }
  | Expr2           { $1        }

Expr2
  : Expr2 '+' Expr3 { Add $1 $3 }
  | Expr2 '-' Expr3 { Sub $1 $3 }
  | Expr3           { $1        }
        

Expr3
  : Expr3 '*' Expr4 { Mul $1 $3 }
  | Expr3 '/' Expr4 { Div $1 $3 }
  | Expr4           { $1        }

Expr4
  : '(' Expr ')'               { $2                  }
  | int                        { IntNum $1           }
  | name '('')'                { FuncECall0 $1       }
  | name '(' Expr ')'          { FuncECall1 $1 $3    }
  | name '(' Expr ',' Expr ')' { FuncECall2 $1 $3 $5 }
  | name                       { Var $1              }
  | str                        { Str $1              }
  | double                     { DoubleNum $1        }
  | bool                       { BoolNum $1          }


{
parseError :: [Token] -> a
parseError arg = error $ "Parse error" <> show arg

defaultValue :: ProgType -> Expression
defaultValue PInt    = IntNum 0
defaultValue PDouble = DoubleNum 0.0
defaultValue PBool   = BoolNum False
defaultValue PString = Str ""

data Expression = Add Expression Expression 
                | Sub Expression Expression
                | Mul Expression Expression
                | Div Expression Expression
                | Le Expression Expression
                | Gt Expression Expression
                | Eq Expression Expression
                | Neq Expression Expression
                | Leq Expression Expression
                | Geq Expression Expression
                | IntNum Int
                | DoubleNum Double
                | BoolNum Bool
                | Var String
                | Str String 
                | FuncECall0 String 
                | FuncECall1 String Expression
                | FuncECall2 String Expression Expression

instance Show Expression where 
  show (Add a b)              = "(" <> show a <> " + "  <> show b <> ")"
  show (Sub a b)              = "(" <> show a <> " - "  <> show b <> ")"
  show (Mul a b)              = "(" <> show a <> " * "  <> show b <> ")"
  show (Div a b)              = "(" <> show a <> " / "  <> show b <> ")"
  show (Le a b)               = "(" <> show a <> " < "  <> show b <> ")"
  show (Gt a b)               = "(" <> show a <> " > "  <> show b <> ")"
  show (Eq a b)               = "(" <> show a <> " == " <> show b <> ")"
  show (Neq a b)              = "(" <> show a <> " != " <> show b <> ")"
  show (Geq a b)              = "(" <> show a <> " >= " <> show b <> ")"
  show (Leq a b)              = "(" <> show a <> " <= " <> show b <> ")"
  show (IntNum a)             = show a
  show (DoubleNum a)          = show a
  show (BoolNum a)            = show a
  show (Var a)                = a
  show (Str a)                = show a
  show (FuncECall0 name)      = name <> "()"
  show (FuncECall1 name expr) =
    name <> "(" <> show expr <> ")"
  show (FuncECall2 name expr1 expr2) =
    name <> "(" <> show expr1 <> ", " <> show expr2 <> ")"

data Statement = VarDecl ProgType String Expression 
               | IfExpr Expression [Statement] [Statement]
               | WhileExpr Expression [Statement]
               | Cout Expression
               | Cin String
               | VarAssi String Expression 
               | FuncSCall0 String 
               | FuncSCall1 String Expression
               | FuncSCall2 String Expression Expression

instance Show Statement where 
  show (VarDecl c a b) =
    show c <> " " <> a <> " = " <> show b <> ";"
  show (IfExpr a b c) =
    "if " <> show a <> " then {\n" <> printBody b <> "} else {\n" <> printBody c <> "}\n"
  show (WhileExpr a b) =
    "while " <> show a <> " {\n" <> printBody b <> "}"
  show (VarAssi name expr) =
    name <> " = " <> show expr <> ";"
  show (Cout expr) =
    "cout << " <> show expr <> ";"
  show (Cin name) =
    "cin >> " <> name <> ";"
  show (FuncSCall0 name) =
    name <> "();"
  show (FuncSCall1 name expr1) =
    name <> "(" <> show expr1 <> ");"
  show (FuncSCall2 name expr1 expr2) =
    name <> "(" <> show expr1 <> ", " <> show expr2 <> ");"

data Function = Function0 ProgType String [Statement]
              | Function1 ProgType String ProgType String [Statement]
              | Function2 ProgType String ProgType String ProgType String [Statement]

instance Show Function where 
  show (Function0 typ name body) =
    show typ <> " " <> name <> " () {\n" <> printBody body <> "}\n"
  show (Function1 typ1 name1 typ2 name2 body) = 
    show typ1 <> " " <> name1 <> " (" <> show typ2
              <> " " <> name2 <> ") {\n" <> printBody body <> "}\n"
  show (Function2 typ1 name1 typ2 name2 typ3 name3 body) = 
    show typ1 <> " " <> name1 <> " (" <> show typ2 <> " " <> name2 <> ", " <> show typ3 <> " "
              <> name3 <> " ) {\n" <> printBody body <> "}\n"

getType :: String -> ProgType
getType "int"    = PInt
getType "double" = PDouble
getType "string" = PString
getType "bool"   = PBool

printBody :: [Statement] -> String 
printBody = foldr (\a b -> show a <> "\n" <> b) ""

parseLine :: String -> [Function] 
parseLine = parses . alexScanTokens
}