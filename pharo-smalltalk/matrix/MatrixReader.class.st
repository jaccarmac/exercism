Class {
	#name : #MatrixReader,
	#superclass : #Object,
	#category : #'Exercise@Matrix'
}

{ #category : #accessing }
MatrixReader >> input: aString atColumn: anInteger [

	^ (self inputAsMatrix: aString) collect: [ :each | 
		  each at: anInteger ]
]

{ #category : #accessing }
MatrixReader >> input: aString atRow: anInteger [

	^ (self inputAsMatrix: aString) at: anInteger
]

{ #category : #parsing }
MatrixReader >> inputAsMatrix: aString [

	^ aString lines collect: [ :each | each parseLiterals ]
]
