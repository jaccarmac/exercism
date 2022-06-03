Class {
	#name : #MatrixReader,
	#superclass : #Object,
	#category : #'Exercise@Matrix'
}

{ #category : #accessing }
MatrixReader >> input: aString atColumn: anInteger [

	^ aString lines collect: [ :each | each parseLiterals at: anInteger ]
]

{ #category : #accessing }
MatrixReader >> input: aString atRow: anInteger [

	^ (aString lines at: anInteger) parseLiterals
]
