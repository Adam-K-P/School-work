#!/usr/bin/gst -f
"Adam Pinarbasi"
"akpinarb"

nl := Character nl.

sortcol := SortedCollection new.

stack := LinkedList new.

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

FileStream extend [
   |bitNumber bitBuffer |
   clearByte [
      bitNumber := 8.
      bitBuffer := 0.
   ]
   flushByte [
      bitNumber = 8 ifFalse: [
         self nextPutByte: bitBuffer.
         self clearByte.
      ]
   ]
   writeBit: bit [
      bitBuffer isNil ifTrue: [self clearByte].
      bitNumber = 0 ifTrue: [self flushByte].
      bitBuffer := bitBuffer bitAt: bitNumber put: bit.
      bitNumber := bitNumber - 1.
   ]

   getBit [
      |tempBitNum|
      (bitBuffer isNil) | (bitNumber = 0) 
         ifTrue: [bitBuffer := self nextByte. bitNumber := 8].
      bitBuffer isNil ifTrue: [ ^nil ].
      tempBitNum := bitNumber.
      bitNumber := bitNumber - 1.
      ^ (bitBuffer bitAt: tempBitNum)
   ]

   getByte [
      |aByte tByte|
      tByte := 0.
      (bitBuffer isNil) | (bitNumber = 0)
          ifTrue: [bitBuffer := self nextByte. bitNumber := 8].
      bitNumber = 8 ifTrue: [bitNumber := 0. ^ bitBuffer].
      aByte := self nextByte.
      aByte isNil ifTrue: [ ^nil ].
      (1 to: (8 - bitNumber)) do: [ :index| 
         tByte := tByte bitAt: index 
                          put: (aByte bitAt: (bitNumber + index)).
      ].
      (1 to: bitNumber) do: [ :index|
         tByte := tByte bitAt: (8 - bitNumber + index) 
                 put: (bitBuffer bitAt: index).
      ].
      bitBuffer := aByte.
      ^ tByte
   ]

]

Link subclass: Leaf [
   |char count|
   char [ ^ char ]
   count [ ^ count ]

   Leaf class >> new [
      self shouldNotImplement
   ]

   Leaf class >> new: aChar [
      |result| 
      result := super new.
      result setChar: aChar.
      ^ result
   ]

   setChar: aChar [
      char := aChar.
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

   postorder: outfile [
      outfile writeBit: 0.
      char = 256 ifTrue: [ outfile writeBit: 1 ] 
                ifFalse: [ outfile writeBit: 0 ].
      (1 to: 8) do: [:index | 
         outfile writeBit: (char bitAt: index) ].
   ]

]

Leaf subclass: Tree [
   |left right|
   left [^ left]
   right [^ right]

   Tree class >> new: aChar count: aCount [
      self shouldNotImplement
   ]

   Tree class >> new: aChar left: aLeft right: aRight [
      |result|
      result := super new: aChar.
      result setLeft: aLeft andRight: aRight.
      ^ result
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

   postorder: outfile [
      left postorder: outfile.
      right postorder: outfile.
      outfile writeBit: 1. 
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

writeEncoded := [ :infile|
   |char encodedString count eof|
   char := infile next.
   count := 0.
   [char notNil] whileTrue: [
      encodedString := encodeTable at: (char asciiValue).
      (1 to: (encodedString size)) do: [ :index |
         (encodedString at: index) = $1 
            ifTrue: [ stdout writeBit: 1 ]
           ifFalse: [ stdout writeBit: 0 ].
      ].
      char := infile next.
      count := count + 1
   ].
   eof := encodeTable at: 256.
   (1 to: (eof size)) do: [ :index |
      (eof at: index) = $1
         ifTrue: [ stdout writeBit: 1 ]
        ifFalse: [ stdout writeBit: 0 ]
   ].
   "(1 to: (count rem: 8)) do: [ writeBit: 0 ]."
].

constructTree := [ :infile |
   readFile value: infile.
   insertLeaves value.
   createTree value.
   encodeTree value
].

compressFile := [ :infile |
   (sortcol first) postorder: stdout.
   '' displayNl.
   writeEncoded value: infile.
   "pad with 0 bits and EOF later"
].

reconstructTree := [ :infile |
   |byte bit eof subZero subOne nTree cond|
   cond := true.
   [cond] whileTrue: [
      eof := true.
      bit := infile getBit.
      bit = 0 ifTrue: [
         byte := infile getByte.
         (1 to: 8) do: [ :index|
            (byte bitAt: index) = 1 ifTrue: [ eof := false ].
         ].
         eof = true ifTrue: [
            bit := infile getBit.
            bit = 1 ifTrue: [ (1 to: 8) do: 
               [ :index| byte := byte bitAt: index put: 1 ].
            ].
         ].
         stack addLast: (Leaf new: byte).
      ].
      bit = 1 ifTrue: [
         subOne := stack removeLast.
         (stack isEmpty) 
            ifTrue: [ cond := false. stack addLast: subOne ]
           ifFalse: [ subZero := stack removeLast.
                      nTree := Tree new: (subZero char) 
                                   left: subZero right: subOne.
                      stack addLast: nTree.
                    ].
      ].
   ].
].

decompress := [ :infile |
   |theTree aTree next|
   theTree := stack removeLast.
   aTree := theTree.
   bit := infile getBit.
   [bit isNil] whileFalse: [
      bit = 0 
         ifTrue: [ next := aTree left ]
        ifFalse: [ next := aTree right ].
      (next isMemberOf: Leaf) 
         ifTrue: [ (Character value: (next char)) display. aTree := theTree ]
        ifFalse: [ aTree := next ].
      bit := infile getBit.
   ].
].

decompressFile := [ :infile |
   reconstructTree value: infile.
   decompress value: infile.
].

prepareTree := [ :infile |
   constructTree value: infile.
   infile close.
].

performOptions := [ :infilename :outfilename|
   |infile|
   [ infile := FileStream open: option mode: FileStream read]
   on: SystemExceptions.FileError do: [:signal |
      |errno|
      errno := File errno.
      stdout flush.
      stderr << 'Error opening file: ' << infilename << nl.
      stderr flush.
      ObjectMemory quit: 1.
   ].

   t = true ifTrue: [ prepareTree value: infile. 
                      displayEncoded value 
                    ].
   c = true ifTrue: [ prepareTree value: infile. 
                      infile := FileStream open: infilename 
                                           mode: FileStream read.
                      compressFile value: infile.
                      infile close
                    ].
   u = true ifTrue: [ decompressFile value: infile ].

   infile close.
].

argc := Smalltalk getArgc.
(argc = 2) | (argc = 3) ifFalse: 
   ['Usage: hzip -dtcu infile [outfile]' displayNl.
    ObjectMemory quit: 1
   ].
              
(1 to: argc)
do: [:argi |
   |infilename|
   option := (Smalltalk getArgv: argi).

   argi = 2 ifTrue: [
      argi = argc ifTrue: [ performOptions value: option value: stdout ]
                 ifFalse: [ performOptions value: option 
                               value: (Smalltalk getArgv: 3) ].
   ].

   '-d' = option ifTrue: [ d := true ].
   '-t' = option ifTrue: [ t := true ].
   '-c' = option ifTrue: [ c := true ].
   '-u' = option ifTrue: [ u := true ].
].

