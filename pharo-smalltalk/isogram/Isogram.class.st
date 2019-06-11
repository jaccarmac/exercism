"
I check whether a string is an isogram

Isogram-ness, in this case is based only on ASCII characters in the string in question, and is case-insensitive.
"
Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #strings }
Isogram >> isIsogramPhrase: aString [
	| onlyLetters |
	onlyLetters := aString asLowercase
		reject: [ :c | c == Character space or: c == $- ].
	^ onlyLetters asSet size = onlyLetters size
]
