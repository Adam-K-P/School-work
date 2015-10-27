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
        if value = [] then []
        else let rvalue = reverse value in
            if (car rvalue) = 0 then can (reverse (cdr rvalue))
            else value

    let rec cmp list1 list2 = 
        if (List.length list1) > (List.length list2) then 1
        else if (List.length list1) < (List.length list2) then -1
        else match (list1, list2) with
            | [], []          -> 0
            | list1, []       -> 1
            | [], list2       -> -1
            | list1, list2 ->  
                let rlist1 = reverse list1 in
                let rlist2 = reverse list2 in
                    if (car rlist1) > (car rlist2) then 1
                    else if (car rlist1) < (car rlist2) then -1
                    else cmp (reverse (cdr rlist1)) (reverse (cdr rlist2))

    let rec add' list1 list2 carry = 
        match (list1, list2, carry) with
        | list1, [], 0       -> list1
        | [], list2, 0       -> list2
        | list1, [], carry   -> add' list1 [carry] 0
        | [], list2, carry   -> add' [carry] list2 0
        | car1::cdr1, car2::cdr2, carry ->
          let sum = car1 + car2 + carry in
          sum mod radix :: add' cdr1 cdr2 (sum / radix)

    let sub_prev () =
       fprintf stderr "Precondition violation: list1 > list2\n%!";
       exit 1

    (* Precondition: list1 must be greater than list2 *)
    let rec sub' list1 list2 carry = match (list1, list2, carry) with
        | list1, [], false -> list1
        | list1, [], true  -> 
          let diff = (car list1) - 1 (* line below could crash the program *)
          in  if diff < 0 then (diff + 10)::(sub' (cdr list1) [] true)
          else diff::(cdr list1)
        | [], list2, true  -> sub_prev ()
        | [], list2, false -> sub_prev ()  
        | car1::cdr1, car2::cdr2, carry -> 
            let diff = car1 - car2 in
                if carry then sub' ((car1 - 1)::cdr1) list2 false
                else if diff < 0 then (diff + 10)::(sub' cdr1 cdr2 true)
                else diff::(sub' cdr1 cdr2 false) 
           
    let add (Bigint (neg1, value1)) (Bigint (neg2, value2)) =
        if neg1 = neg2
        then Bigint (neg1, add' value1 value2 0)
        else let comp = cmp value1 value2 in
            if comp > 0 then Bigint (neg1, sub' value1 value2 false)
            else if comp < 0 then Bigint (neg2, sub' value2 value1 false)
            else zero

    let sub (Bigint (neg1, value1)) (Bigint (neg2, value2)) =
        if neg1 = neg2 then 
            let comp = cmp value1 value2 in
                 if comp > 0 then Bigint (neg1, can (sub' value1 value2 false))
                 else if comp < 0 then 
                     let sign = if neg1 = Pos then Neg else Pos
                     in  Bigint (sign, can (sub' value2 value1 false))
                 else zero
        else Bigint (neg1, add' value1 value2 0) 

    (* traverse list1 in this function *)
    let rec mul_help list1 num carry = 
        if list1 = [] then [carry]
        else let prd = (car list1) * num + carry in
            (prd mod 10)::(mul_help (cdr list1) num (prd / 10))

    (* traverse list2 in this function *)
    let rec mul' list1 list2 =
        if (list1 = [] || list2 = []) then []
        else add' (mul_help list1 (car list2) 0) (0::(mul' list1 (cdr list2))) 0

    let mul (Bigint (neg1, value1)) (Bigint (neg2, value2)) =
        if neg1 = neg2 then Bigint (Pos, can (mul' value1 value2))
        else Bigint (Neg, can (mul' value1 value2))
            
    let div_by_0 () =
        fprintf stderr "ocamldc: division by 0 not allowed, now exiting\n";
        exit 1

    let rec div' divisor dividend oldv newv value = 
        let comp = cmp (can (mul' (add' value newv 0) dividend)) divisor in
            if comp > 0 then oldv
            else if comp < 0 then div' divisor dividend newv (mul' newv [2]) value
            else newv

    let rec divrem divisor dividend value = 
        let newv = div' divisor dividend [] [1] value in
            if newv = [] then value
            else divrem divisor dividend (add' value newv 0)

    let div (Bigint (neg1, value1)) (Bigint (neg2, value2)) = 
        match (value1, value2) with
            | [], value2     -> zero
            | value1, []     -> div_by_0 ()
            | value1, value2 -> 
              let sign = if neg1 = neg2 then Pos else Neg in
                  Bigint (sign, can (divrem value1 value2 []))

    let rem (Bigint (neg1, value1)) (Bigint (neg2, value2)) = 
        Bigint (neg1,  
        (can (sub' value1 (can (mul' (divrem value1 value2 []) value2)) false)))

    let rec pow' list1 list2 olist1 =
        if (car list2) = 0 then list1
        else pow' (mul' list1 olist1) (sub' list2 [1] false) olist1

    let pow (Bigint (neg1, value1)) (Bigint (neg2, value2)) = 
        if neg2 = Neg then zero
        else match (value1, value2) with
            | [], value2     -> zero
            | value1, []     -> Bigint (Pos, [1])
            | value1, value2 -> Bigint (neg1, (can (pow' value1 value2 value1)))

end
