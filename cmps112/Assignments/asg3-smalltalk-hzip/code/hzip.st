#!/usr/bin/gst -f
"Adam Pinarbasi"
"akpinarb"

nl := Character nl.

sortcol := SortedCollection new.

Object subclass: Leaf [
   |char count|
   char [ ^ char ]
   count [ ^ count ]

   Leaf class >> new [
      self shouldNotImplement
   ]

   Leaf class >> new: aChar count: aCount [
      |result|
      result := super new.
      result setChar: aChar andCount: aCount.
      ^result
   ]

   setChar: aChar andCount: aCount [
      char := aChar.
      count := aCount.
   ]

   <= other [
      ^ (count < other count) | ((count = other count) 
                              & (char <= other char))
   ]

   printBase: aStream [
      ^ aStream << self class << '(' << char << ',' << count
   ]

   printOn: aStream [
      (self printBase: aStream) << ')'.
   ]

   inorder: visitor prefix: string [
      visitor value: char value: string.
   ]

]

Leaf subclass: Tree [
   |left right|
   left [^ left]
   right [^ right]

   Tree class >> new: aChar count: aCount [
      self shouldNotImplement
   ]

   Tree class >> new: aChar count: aCount left: aLeft right: aRight [
      |result|
      result := super new: aChar count: aCount.
      result setLeft: aLeft andRight: aRight.
      ^ result
   ]

   setLeft: aLeft andRight: aRight [
      left := aLeft.
      right := aRight.
   ]

   printOn: aStream [
      (self printBase: aStream) << ',' << left << ',' << right << ')'.
   ]

   inorder: visitor prefix: string [
      left inorder: visitor prefix: string, '0'.
      right inorder: visitor prefix: string, '1'.
   ]

]

freqtable := Array new: 256.
freqtable at: 256 put: 1.
(1 to: 255) do: [:index |
   freqtable at: index put: 0
].

readFile := [:infile |
   |char|
   char := infile next.
   [char notNil] whileTrue: [
      freqtable at: (char asciiValue) 
         put: (freqtable at: (char asciiValue)) + 1.
      char := infile next
   ]
].

insertLeaves := [
   (1 to: 256) do: [:index |
      (freqtable at: index) = 0 ifFalse: [
         |leaf|
         leaf := Leaf new: index count: (freqtable at: index).
         sortcol add: leaf
      ]
   ]
].

createTree := [
   [(sortcol size) = 1] whileFalse: [
      |thisTree thatTree newTree|
      thisTree := sortcol removeFirst.
      thatTree := sortcol removeFirst.
      newTree := Tree new: (thisTree char)
                    count: ((thisTree count) + (thatTree count))
                     left: thisTree right: thatTree.
      sortcol add: newTree.
   ]
].

encodeTable := Array new: 256.
encodeTree := [
   (sortcol removeFirst) inorder: [:char :string |
      encodeTable at: char put: string.
   ] prefix: ''.
   encodeTable inspect.
].

displayEncoded := [
   "encodeTable inspect."
   (1 to: 256) do: [:index |
      ((encodeTable at: index) isNil) ifFalse: [
         index display.
         '   ' display.
         (freqtable at: index) display.
         '   ' display.
         (encodeTable at: index) displayNl.
      ]
   ]
].

argc := Smalltalk getArgc.
argc = 2
   ifFalse: ['Usage: hzip [-d -t -c -u] filename' displayNl].
              

(1 to: argc)
do: [:argi |
   option := (Smalltalk getArgv: argi).

   argi = argc
      ifTrue: [
         [  |infile|
            infile := FileStream open: option mode: FileStream read.
            readFile value: infile.
            insertLeaves value.
            createTree value.
            encodeTree value.
            infile close.
         ] on: SystemExceptions.FileError do: [:signal |
            |errno|
            errno := File errno.
            stdout flush.
            stderr << 'Error opening file: ' << option << nl.
            stderr flush
         ]
      ].

   "options being called too early"
   '-d' = option
      ifTrue: ['Debugging-mode' displayNl].
   '-t' = option
      ifTrue: [displayEncoded value].
   '-c' = option
      ifTrue: ['Compressing file' displayNl].
   '-u' = option
      ifTrue: ['Uncompressing file' displayNl]
].


