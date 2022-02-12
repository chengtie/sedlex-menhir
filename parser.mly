%{
  open Syntax
%} 

%token <int> INT
%token <bool> BOOL
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token EOL
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */
%start main             /* the entry point */
%type <Syntax.expression> main
%%
main:
    expr EOL                { $1 }
;
expr:
    INT                     { E_int $1 }
  | BOOL                    { E_bool $1 }
  | LPAREN expr RPAREN      { $2 }
  | expr PLUS expr          { Syntax.plus $1 $3 }
  | expr MINUS expr         { Syntax.minus $1 $3 }
  | expr TIMES expr         { Syntax.times $1 $3 }
  | expr DIV expr           { Syntax.div $1 $3 }
  | MINUS expr %prec UMINUS { Syntax.uminus $2 }
