#!/usr/bin/gst -f 
"CHANGE BACK THE PATH"
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

   padOut [
      [bitNumber = 0] whileFalse: [ self writeBit: 0 ].
      self flushByte.
   ]

   "getBit"
   "gets one bit from a file"
   getBit [
      |tempBitNum|
      (bitBuffer isNil) | (bitNumber = 0) 
         ifTrue: [bitBuffer := self nextByte. bitNumber := 8].
      bitBuffer isNil ifTrue: [ ^nil ].
      tempBitNum := bitNumber.
      bitNumber := bitNumber - 1.
      ^ (bitBuffer bitAt: tempBitNum)
   ]

   "getByte"
   "gets one byte from a file"
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
      (1 to: 8) do: [:index | 
         outfile writeBit: (char bitAt: (9 - index)) ].
      char = 256 ifTrue: [ outfile writeBit: 1 ].
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

   "postorder"
   "postorder traversal"
   postorder: outfile [
      left postorder: outfile.
      right postorder: outfile.
      outfile writeBit: 1. 
   ]

]

"readFile"
"reads the file"
readFile := [:infile |
   |char|
   char := infile next.
   [char notNil] whileTrue: [
      freqtable at: (char asciiValue) 
         put: (freqtable at: (char asciiValue)) + 1.
      char := infile next
   ]
].

"insertLeaves"
"inserts leaves"
insertLeaves := [
   (1 to: 256) do: [:index |
      (freqtable at: index) = 0 ifFalse: [
         |leaf|
         leaf := Leaf new: index count: (freqtable at: index).
         sortcol add: leaf
      ]
   ]
].

"createTree"
"creates the tree for compression"
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

"encodeTree"
"encodes the tree"
encodeTree := [
   (sortcol first) inorder: [:char :string |
      encodeTable at: char put: string.
   ] prefix: ''.
].

"displayEncoded"
"prints the encoded table"
displayEncoded := [ :outfile|
   (1 to: 256) do: [:index |
      ((encodeTable at: index) isNil) ifFalse: [
         (index < 40) | (index > 126)
             ifTrue: [ outfile << index ] 
            ifFalse: [ outfile << (Character value: index) ].
         outfile << '   '.
         outfile << (freqtable at: index).
         outfile << '   '.
         outfile << (encodeTable at: index) << nl.
      ]
   ]
].

"writeEncoded"
"writes out the encoded file"
writeEncoded := [ :infile :outfile|
   |char encodedString eof |
   char := infile next.
   [char notNil] whileTrue: [
      encodedString := encodeTable at: (char asciiValue).
      (1 to: (encodedString size)) do: [ :index |
         (encodedString at: index) = $1 
            ifTrue: [ outfile writeBit: 1 ]
           ifFalse: [ outfile writeBit: 0 ].
      ].
      char := infile next.
   ].
   eof := encodeTable at: 256.
   (1 to: (eof size)) do: [ :index |
      (eof at: index) = $1
         ifTrue: [ outfile writeBit: 1 ]
        ifFalse: [ outfile writeBit: 0 ]
   ].
   outfile padOut.
].

"constructTree"
"constructs the tree for compression"
constructTree := [ :infile |
   readFile value: infile.
   insertLeaves value.
   createTree value.
   encodeTree value
].

"compressFile"
"compresses the file"
compressFile := [ :infile :outfile|
   (sortcol first) postorder: outfile.
   outfile writeBit: 1. "final pop bit"
   writeEncoded value: infile value: outfile.
].

"reconstructTree"
"reconstructs tree for decompression"
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
      ]
      ifFalse: [
         subOne := stack removeLast.
         (stack isEmpty) 
            ifTrue: [ cond := false. stack addLast: subOne. ]
           ifFalse: [ subZero := stack removeLast.
                      nTree := Tree new: (subZero char) 
                                   left: subZero right: subOne.
                      stack addLast: nTree.
                    ].
      ].
   ].
].

"decompress"
"decompresses the file"
decompress := [ :infile :outfile|
   |theTree aTree next|
   theTree := stack removeLast.
   aTree := theTree.
   (aTree isMemberOf: Leaf) ifTrue: [
      outfile << (Character value: (aTree char)). 
      ObjectMemory quit: 0  
   ].
   bit := infile getBit.
   [bit isNil] whileFalse: [
      bit = 0 
         ifTrue: [ next := aTree left ]
        ifFalse: [ next := aTree right ].
      (next isMemberOf: Leaf) 
         ifTrue: [ outfile << (Character value: (next char)).
                   aTree := theTree ]
         ifFalse: [ aTree := next ].
      bit := infile getBit.
   ].
].

"decompressFile"
"decompresses file"
decompressFile := [ :infile :outfile|
   reconstructTree value: infile.
   decompress value: infile value: outfile.
].

"prepareTree"
"tree is constructed here"
prepareTree := [ :infile |
   constructTree value: infile.
   infile close.
].

"performOptions"
"Options performed here"
performOptions := [ :infilename :outfile|
   |infile|
   [ infile := FileStream open: infilename mode: FileStream read]
   on: SystemExceptions.FileError do: [:signal |
      |errno|
      errno := File errno.
      stdout flush.
      stderr << 'Error opening file: ' << infilename << nl.
      stderr flush.
      ObjectMemory quit: 1.
   ].

   t = true ifTrue: [ prepareTree value: infile. 
                      displayEncoded value: outfile
                    ].
   c = true ifTrue: [ prepareTree value: infile. 
                      infile := FileStream open: infilename 
                                           mode: FileStream read.
                      compressFile value: infile value: outfile.
                      infile close
                    ].
   u = true ifTrue: [ decompressFile value: infile value: outfile].

   infile close.
].

argc := Smalltalk getArgc.
(argc = 2) | (argc = 3) ifFalse: 
   ['Usage: hzip -dtcu infile [outfile]' displayNl.
    ObjectMemory quit: 1
   ].
              
(1 to: argc)
do: [:argi |
   option := (Smalltalk getArgv: argi).

   argi = 2 ifTrue: [
      argi = argc ifTrue: [ performOptions value: option value: stdout ]
                 ifFalse: [ outfile := FileStream 
                               open: (Smalltalk getArgv: 3)  
                               mode: FileStream write.
                            performOptions value: option value: outfile.].
   ].

   '-d' = option ifTrue: [ d := true ].
   '-t' = option ifTrue: [ t := true ].
   '-c' = option ifTrue: [ c := true ].
   '-u' = option ifTrue: [ u := true ].
].

