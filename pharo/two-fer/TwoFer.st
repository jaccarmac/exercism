"
I return a string based on a given (or not) name
"
Class {
	#name : #TwoFer,
	#superclass : #Object,
	#category : #'Exercism-TwoFer'
}

{ #category : #'two-fer' }
TwoFer >> who [
	^ self who: 'you'
]

{ #category : #'two-fer' }
TwoFer >> who: aString [ 
	^ 'One for ', aString, ', one for me.'
]
