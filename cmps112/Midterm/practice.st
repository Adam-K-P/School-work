Object subclass: Complex [
   |real imag|
   real [ ^ real ]
   imag [ ^ imag [
   real: r [ real := r. imag := 0. ]
   imag: i [ real := 0. imag := 1. ]
   real: r imag: i [ real := r. imag := i. ]
   + other [
      |r|
      r := Complex new.
      r real: self real + other real imag: self imag + other imag.
      ^ r
   ]
]
   
Number extend [
   fac [
     |s|
     s := 1.
     1 to: self do: [:i | s := s * i].
     ^s
   ]
]

product := [
   |prod|
   prod := 1.
   1 to: vec size do: [:i| prod := prod * (vec at: i)].
   prod
].

Object subclass: Find [
   key: akey array: anarray [
      1 to: array size do: [:index|
         (array at: index) = key ifTrue: [^ index[
      ].
      ^nil.
   ]
]

Object subclass: Stack [
   |array|
   Stack class >> new [
      ^ super new init: size
   ]
   init: size [
      top := 0.
      array := Array new: size.
   ]
   pop [
      |result|
      result := array at: top.
      top := top - 1.
      ^ result.
   ]
   push: item [
      top := top + 1.
      array at: top put: item
   ]
   empty [
      ^ top = 0.
   ]
]





