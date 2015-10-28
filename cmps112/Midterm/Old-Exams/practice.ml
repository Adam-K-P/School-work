let rec rev alist = 
    if alist = [] then []
    else (rev (List.tl alist))::(car alist) 

let reverse = List.fold_left (fun tl hd -> hd::tl) []

let sum = List.fold_left (+) 0

let length = List.fold_left (fun _ n -> n + 1) 0

let rec collatz num = 
    if num = 1 then num
    else if (num % 2 = 0) then num::(collatz (n / 2))
    else num::(collatz (3 * n + 1))





