"
I calculate the sum of multiples up to a number
"
Class {
	#name : #SumOfMultiples,
	#superclass : #Object,
	#instVars : [
		'numbers'
	],
	#category : #'Exercism-SumOfMultiples'
}

{ #category : #initialization }
SumOfMultiples class >> with: anInteger [
	^ self withAny: {anInteger}
]

{ #category : #initialization }
SumOfMultiples class >> with: anInteger or: anInteger2 [
	^ self
		withAny:
			{anInteger.
			anInteger2}
]

{ #category : #initialization }
SumOfMultiples class >> withAny: aCollection [
	| summer |
	summer := self new.
	aCollection do: [ :i | summer addToNumbers: i ].
	^ summer
]

{ #category : #private }
SumOfMultiples >> addToNumbers: anInteger [
	numbers add: anInteger
]

{ #category : #initialization }
SumOfMultiples >> initialize [
	super initialize.
	numbers := Set new
]

{ #category : #'sum-of-multiples' }
SumOfMultiples >> upTo: anInteger [
	| sum |
	sum := 0.
	1 to: anInteger - 1 do: [ :i | 
		(numbers anySatisfy: [ :j | i isDivisibleBy: j ])
			ifTrue: [ sum := sum + i ] ].
	^ sum
]
