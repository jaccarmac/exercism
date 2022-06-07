Class {
	#name : #GradeSchool,
	#superclass : #Object,
	#instVars : [
		'roster'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #accessing }
GradeSchool >> addStudents: aCollection [

	roster addAll: aCollection
]

{ #category : #accessing }
GradeSchool >> desiredGrade: anInteger [

	^ (roster select: [ :s | s second = anInteger ] thenCollect: #first)
		  asArray
]

{ #category : #initialization }
GradeSchool >> initialize [

	super initialize.
	roster := SortedCollection sortUsing: #second ascending, #first ascending
]

{ #category : #accessing }
GradeSchool >> roster [

	^ (roster collect: #first) asArray
]
