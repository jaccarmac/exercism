"
I represent a grid of ordered squares on which doubling numbers of grains are placed.

I have a fixed size: An 8x8 chessboard has 64 squares. Each of those squares has a certain number of grains on it. I can tell you the number of grains on a given square or the total number of grains on all squares.

- atSquare: aSquare
- total
"
Class {
	#name : #Grains,
	#superclass : #Object,
	#instVars : [
		'squares'
	],
	#category : #'Exercise@Grains'
}

{ #category : #accessing }
Grains >> atSquare: aNumber [

	"Answer the number of grains on a given square."

	^ 2 raisedTo: (self validSquare: aNumber) - 1
]

{ #category : #initialization }
Grains >> initialize [

	super initialize.
	squares := 64
]

{ #category : #accessing }
Grains >> squares [

	^ squares
]

{ #category : #accessing }
Grains >> total [

	"Answer the total number of grains across all squares."

	^ ((1 to: self squares) collect: [ :s | self atSquare: s ]) sum
]

{ #category : #validating }
Grains >> validSquare: aNumber [

	(aNumber between: 1 and: self squares) ifFalse: [ 
		self error:
			('square must be between 1 and {1}' format: { self squares }) ].
	^ aNumber
]
