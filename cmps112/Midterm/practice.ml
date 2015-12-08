let reverse aList =
   let rec rev' inn out = match inn with
      | [] -> out
      | h::t -> rev' t (h::out)
   in rev' list []

let reverse = List.fold_left (fun tl hd -> hd::tl) []
let sum = List.fold_left (+) 0
let length = List.fold_left (fun _ n -> n + 1) 0

let collatz n  =
   let rec collatz' n rest =
      if n <= 1
         then 1::rest
         else if even n
            then collatz' (n/2) (n::rest)
            else collatz' (n * 3 + 1) (n::rest)
   in reverse (collatz' n [])

let rec range x y = 
   if x > y then []
   else x::(range (x + 1) y)
