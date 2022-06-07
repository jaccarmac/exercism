Class {
	#name : #GradeSchool,
	#superclass : #Object,
	#instVars : [
		'students'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #accessing }
GradeSchool >> addStudents: aCollection [

	students addAll: aCollection
]

{ #category : #accessing }
GradeSchool >> desiredGrade: anInteger [

	^ self students
		  select: [ :s | s second = anInteger ]
		  thenCollect: #first
]

{ #category : #initialization }
GradeSchool >> initialize [

	super initialize.
	students := SortedCollection sortUsing:
		            #second ascending , #first ascending
]

{ #category : #accessing }
GradeSchool >> roster [

	^ self students collect: #first
]

{ #category : #accessing }
GradeSchool >> students [

	^ students asArray
]
