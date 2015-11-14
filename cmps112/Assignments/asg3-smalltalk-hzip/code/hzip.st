#!/usr/bin/gst -f
"Adam Pinarbasi"
"akpinarb"

nl := Character nl.

sortcol := SortedCollection new.

encodeTable := Array new: 256.

"options: "
d := Boolean new.
t := Boolean new.
c := Boolean new.
u := Boolean new.

freqtable := Array new: 256.
freqtable at: 256 put: 1.
(1 to: 255) do: [:index |
   freqtable at: index put: 0
].

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

   postorder [
      char = 256 ifTrue: [ '1' display ] ifFalse: [ '0' display. ].
      (0 to: 7) do: [:index | 
         (char bitAt: (7 - index)) display ].
      ' ' display. 
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

   postorder [
      left postorder.
      right postorder.
      '1' display.
      ' ' display.
   ]

]

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

encodeTree := [
   (sortcol first) inorder: [:char :string |
      encodeTable at: char put: string.
   ] prefix: ''.
].

displayEncoded := [
   (1 to: 256) do: [:index |
      ((encodeTable at: index) isNil) ifFalse: [
         (index < 40) | (index > 126)
             ifTrue: [ index display ] 
            ifFalse: [ (Character value: index) display ].
         '   ' display.
         (freqtable at: index) display.
         '   ' display.
         (encodeTable at: index) displayNl.
      ]
   ]
].

constructTree := [ :infile |
   readFile value: infile.
   insertLeaves value.
   createTree value.
   encodeTree value
].

compressFile := [
   ((sortcol first) postorder).
   '' displayNl.
].

performOptions := [ :infile |
   t = true ifTrue: [ displayEncoded value ].
   c = true ifTrue: [ compressFile value ].
].

argc := Smalltalk getArgc.
argc = 2 ifFalse: 
   ['Usage: hzip [-d -t -c -u] filename' displayNl.
    ObjectMemory quit: 1
   ].
              
(1 to: argc)
do: [:argi |
   option := (Smalltalk getArgv: argi).

   argi = argc ifTrue: [
      [  |infile|
         infile := FileStream open: option mode: FileStream read.
         constructTree value: infile.
         performOptions value: infile.
         infile close.
      ] on: SystemExceptions.FileError do: [:signal |
         |errno|
         errno := File errno.
         stdout flush.
         stderr << 'Error opening file: ' << option << nl.
         stderr flush
      ]
   ].

   '-d' = option ifTrue: [ d := true ].
   '-t' = option ifTrue: [ t := true ].
   '-c' = option ifTrue: [ c := true ].
   '-u' = option ifTrue: [ u := true ].
].

