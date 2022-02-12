type expression = 
  | E_int of int
  | E_bool of bool

let print (e: expression) : unit =
  match e with
  | E_int i -> print_int i
  | E_bool b -> if b then print_string "TRUE" else print_string "FALSE"

let plus (e0: expression) (e1: expression) : expression = 
  match e0, e1 with
  | E_int i0, E_int i1 -> E_int (i0 + i1)
  | _ -> failwith "todo"

let minus (e0: expression) (e1: expression) : expression = 
  match e0, e1 with
  | E_int i0, E_int i1 -> E_int (i0 - i1)
  | _ -> failwith "todo"

let times (e0: expression) (e1: expression) : expression = 
  match e0, e1 with
  | E_int i0, E_int i1 -> E_int (i0 * i1)
  | _ -> failwith "todo"

let div (e0: expression) (e1: expression) : expression = 
  match e0, e1 with
  | E_int i0, E_int i1 -> E_int (i0 / i1)
  | _ -> failwith "todo"

let uminus (e: expression) : expression = 
  match e with
  | E_int i -> E_int (-i)
  | _ -> failwith "todo"