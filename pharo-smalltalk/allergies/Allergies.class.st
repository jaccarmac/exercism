Class {
	#name : #Allergies,
	#superclass : #Object,
	#category : #'Exercise@Allergies'
}

{ #category : #accessing }
Allergies >> allergens [

	^ #( 'eggs' 'peanuts' 'shellfish' 'strawberries' 'tomatoes'
	     'chocolate' 'pollen' 'cats' )
]

{ #category : #querying }
Allergies >> allergicToItem: aString forScore: anInteger [

	^ (anInteger bitAt: (self allergens indexOf: aString)) = 1
]

{ #category : #querying }
Allergies >> allergyListForScore: anInteger [

	^ self allergens select: [ :allergen | 
		  self allergicToItem: allergen forScore: anInteger ]
]
