open Parsing
open Lexing
open Interpreter_lib.Lexer
open Interpreter_lib.Parser
open Interpreter_lib.Lambda

let top_level_loop () =
  print_endline "Evaluator of lambda expressions...";
  let rec loop ctx prev =
    let _ =
      match prev with
      | "" -> print_string ">> "
      | _ -> print_string "   "
    in
    flush stdout;
    try
      (* call to the parser *)
      let tm = s token @@ from_channel stdin in
      match tm with
      | Some tm ->
        (* call to the lambda type engine *)
        let tyTm = typeof ctx tm in
        let evaluation = eval tm in
        print_endline (string_of_term evaluation ^ " : " ^ string_of_ty tyTm);
        loop ctx ""
      | None -> raise End_of_file
    with
    | Lexical_error ->
      print_endline "lexical error";
      loop ctx ""
    | Parse_error ->
      print_endline "syntax error";
      loop ctx ""
    | Type_error e ->
      print_endline ("type error: " ^ e);
      loop ctx ""
    | End_of_file -> print_endline "...bye!!!"
  in
  loop emptyctx ""
;;

top_level_loop ()
