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
	roster := SortedCollection sortUsing: [ :s1 :s2 | 
		          s1 second = s2 second
			          ifFalse: [ s1 second < s2 second ]
			          ifTrue: [ s1 first < s2 first ] ]
]

{ #category : #accessing }
GradeSchool >> roster [

	^ (roster collect: #first) asArray
]
