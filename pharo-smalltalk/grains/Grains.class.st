Class {
	#name : #Grains,
	#superclass : #Object,
	#category : #'Exercise@Grains'
}

{ #category : #accessing }
Grains >> atSquare: aSquare [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^2 raisedTo: aSquare - 1
]
