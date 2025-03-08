{
  open Parser;;
  exception Lexical_error;;
}

rule token = parse
  [' ' '\t']            { token lexbuf }
  | ['\n' '\r']         { token lexbuf }
  | "lambda"            { LAMBDA }
  | "L"                 { LAMBDA }
  | "λ"                 { LAMBDA }
  | "true"              { TRUE }
  | "false"             { FALSE }
  | "if"                { IF }
  | "then"              { THEN }
  | "else"              { ELSE }
  | "succ"              { SUCC }
  | "pred"              { PRED }
  | "iszero"            { ISZERO }
  | "let"               { LET }
  | "in"                { IN }
  | "Bool"              { BOOL }
  | "Nat"               { NAT }
  | '('                 { LPAREN }
  | ')'                 { RPAREN }
  | '.'                 { DOT }
  | '='                 { EQ }
  | ':'                 { COLON }
  | "->"                { ARROW }
  | ';'                 { EXPREND }
  | "letrec"            { LREC }
  | "\""                { QUOTE }
  | "'"                 { QUOTE }
  | "<>"                { CONCAT }
  | "{"                 { TUPSTART }
  | "}"                 { TUPEND }
  | ","                 { COMMA }
  | "<"                 { TYPESTART }
  | ">"                 { TYPEEND }
  | "as"                { CAST }
  | eof                 { EOF }
  | "["                 { LISTSTART }
  | "]"                 { LISTEND }
  | ['0'-'9']+          { INTV (int_of_string (Lexing.lexeme lexbuf)) }
  | ['a'-'z']['a'-'z' '_' '0'-'9']*
                        { STRINGV (Lexing.lexeme lexbuf) }
  | _ as c              { Printf.eprintf "Unknown token: %c" c; raise Lexical_error }

