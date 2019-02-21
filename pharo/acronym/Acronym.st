"
I generate acronyms from strings
"
Class {
	#name : #Acronym,
	#superclass : #Object,
	#category : #'Exercism-Acronym'
}

{ #category : #acronym }
Acronym >> abbreviate: aString [ 
	^ String streamContents: [ :s |
		| addToAcronym |
		addToAcronym := true.
		aString do: [ :c |
			(addToAcronym and: c isLetter) ifTrue: [ 
				s nextPutAll: c asUppercase asString.
				addToAcronym := false ].
			(addToAcronym not and: (' -' includes: c)) ifTrue: [ 
				addToAcronym := true ] ] ]
]
