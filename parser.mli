
(* The type of tokens. *)

type token = 
  | TIMES
  | RPAREN
  | PLUS
  | MINUS
  | LPAREN
  | INT of (int)
  | EOL
  | DIV
  | BOOL of (bool)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.expression)
