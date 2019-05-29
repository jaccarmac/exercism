"
I reverse strings
"
Class {
	#name : #ReverseString,
	#superclass : #Object,
	#category : #'Exercise@ReverseString'
}

{ #category : #'string-manipulation' }
ReverseString >> reverseValue: aString [
	^ String
		streamContents:
			[ :s | aString size to: 1 by: -1 do: [ :i | s nextPutAll: (aString at: i) asString ] ]
]
