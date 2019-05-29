"
I calculate whether a year is a leap year or not
"
Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercism-Leap'
}

{ #category : #'leap-year' }
Leap >> isLeapYear: anInteger [
	^ (anInteger isDivisibleBy: 400)
		or: ((anInteger isDivisibleBy: 4) and: (anInteger isDivisibleBy: 100) not)
]
