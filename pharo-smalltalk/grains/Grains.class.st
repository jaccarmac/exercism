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

{ #category : #'instance creation' }
Grains class >> new [

	^ self new: 64
]

{ #category : #'instance creation' }
Grains class >> new: aNumberOfSquares [

	^ super new setSquares: aNumberOfSquares
]

{ #category : #accessing }
Grains >> atSquare: aSquare [

	"Answer the number of grains on a given square."

	^ 2 raisedTo: (self validate: aSquare) - 1
]

{ #category : #'private - initialization' }
Grains >> setSquares: aNumberOfSquares [

	squares := aNumberOfSquares
]

{ #category : #accessing }
Grains >> total [

	"Answer the total number of grains across all squares."

	^ ((1 to: squares) collect: [ :s | self atSquare: s ]) sum
]

{ #category : #'private - validation' }
Grains >> validate: aNumber [

	(aNumber between: 1 and: squares) ifFalse: [ 
		self error: ('square must be between 1 and {1}' format: { squares }) ].
	^ aNumber
]
