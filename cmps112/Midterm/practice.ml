let reverse list =
   let rec rev' in out = match in with
      | [] -> out
      | h::t -> rev' t (h:: out)
   in rev' list []

let reverse = List.fold_left (fun tl hd -> hd::tl) []
let sum = List.fold_left (+) 0
let length = List.fold_left (fun _ n -> n + 1) 0

let collatz n =
   let rec collatz' n rest = 
      if n <= 1
         then 1::rest
         else if even n
            then collatz' (n / 2) (n::rest)
            else collatz' (n * 3 + 1) (n::rest)
   in reverse (collatz' n [])

let rec range x y =
   if x > y then []
   else x::range (x + 1) y

let rec pairthem l1 l2 =
   match l1 l2 with
      | [], l2 -> []
      | l1, [] -> []
      | car1::cdr1, car2::cdr2 ->
            (car1, car2)::(pairthem cdr1 cdr2)

let split pred alist =
   let rec split' thelist l1 l2 =
      if thelist = [] then []
      else if (pred (List.hd thelist)) then 
         split' (List.tl thelist) (List.hd thelist)::l1 l2
      else split' (List.tl thelist) l1 (List.hd thelist)::l2
   in split' alist [] []

let rec split pred list = match list with
   | [] -> [], []
   | head::tail ->
         let (out1, out2) = split pred tail
         in if pred head then (head::out1), out2
            else out1, (head::out2)

let rec exclude c l = 
   if ((c <= 0) || (l = [])) then []
   else exclude (c - 1) (List.tl l)
      




