(* $Id: asl.ml,v 1.3 1994/11/10 09:57:19 xleroy Exp $ *)

exception Error of string;;

let init_env =  ["+";"-";"*";"/";"="];;
