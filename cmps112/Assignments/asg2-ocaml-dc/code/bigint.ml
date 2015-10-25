(* Adam Pinarbasi
 * akpinarb
 * 1356887     *)
(* $Id: bigint.ml,v 1.5 2014-11-11 15:06:24-08 - - $ *)

open Printf

module Bigint = struct

    type sign     = Pos | Neg
    type bigint   = Bigint of sign * int list
    let  radix    = 10
    let  radixlen =  1

    let car       = List.hd
    let cdr       = List.tl
    let map       = List.map
    let reverse   = List.rev
    let strcat    = String.concat
    let strlen    = String.length
    let strsub    = String.sub
    let zero      = Bigint (Pos, [])

    let charlist_of_string str = 
        let last = strlen str - 1
        in  let rec charlist pos result =
            if pos < 0
            then result
            else charlist (pos - 1) (str.[pos] :: result)
        in  charlist last []

    let bigint_of_string str =
        let len = strlen str
        in  let to_intlist first =
                let substr = strsub str first (len - first) in
                let digit char = int_of_char char - int_of_char '0' in
                map digit (reverse (charlist_of_string substr))
            in  if   len = 0
                then zero
                else if   str.[0] = '_'
                     then Bigint (Neg, to_intlist 1)
                     else Bigint (Pos, to_intlist 0)

    let string_of_bigint (Bigint (sign, value)) =
        match value with
        | []    -> "0"
        | value -> let reversed = reverse value
                   in  strcat ""
                       ((if sign = Pos then "" else "-") ::
                        (map string_of_int reversed))

    let rec can value = 
        if (cdr value) = [] then
            if (car value) = 0 then [] else value
        else (car value)::can (cdr value)

    let rec cmp list1 list2 = match (list1, list2) with
        | list1, []       -> 1
        | [], list2       -> -1
        | car1::cdr1, car2::cdr2 -> 
          if cdr1 = [] && cdr2 = [] then
              if car1 > car2 then 1
              else if car1 < car2 then -1
              else 0
           else cmp cdr1 cdr2

    let rec add' list1 list2 carry = match (list1, list2, carry) with
        | list1, [], 0       -> list1
        | [], list2, 0       -> list2
        | list1, [], carry   -> add' list1 [carry] 0
        | [], list2, carry   -> add' [carry] list2 0
        | car1::cdr1, car2::cdr2, carry ->
          let sum = car1 + car2 + carry
          in  sum mod radix :: add' cdr1 cdr2 (sum / radix)

    let add (Bigint (neg1, value1)) (Bigint (neg2, value2)) =
        if neg1 = neg2
        then Bigint (neg1, add' value1 value2 0)
        else zero (*inappropriate behavior*)

    let sub_prev () =
       fprintf stderr "Precondition violation: list1 > list2\n%!";
       exit 1

    (* Precondition: list1 must be greater than list2 *)
    let rec sub' list1 list2 carry = match (list1, list2, carry) with
        | list1, [], false      -> list1
        | list1, [], true       -> ((car list1) - 1)::(cdr list1)
        | [], list2, true       -> sub_prev ()
        | [], list2, false      -> sub_prev ()  
        | car1::cdr1, car2::cdr2, carry -> 
            let diff = car1 - car2 in
                if carry then sub' ((car1 - 1)::cdr1) list2 false
                else if diff < 0 then (diff + 10)::(sub' cdr1 cdr2 true)
                else diff::(sub' cdr1 cdr2 false) 
           
    let sub (Bigint (neg1, value1)) (Bigint (neg2, value2)) =
       if neg1 = neg2 then 
            let comp = cmp value1 value2 in
                 if comp > 0 then Bigint (neg1, can (sub' value1 value2 false))
                 else if comp < 0 then 
                     let sign = if neg1 = Pos then Neg else Pos
                     in  Bigint (sign, can (sub' value2 value1 false))
                 else zero
        else Bigint (neg1, add' value1 value2 0) 
       
    let mul = add

    let div = add

    let rem = add

    let pow = add

end

