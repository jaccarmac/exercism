"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestExerciseGrains,
	#superclass : #PackageManifest,
	#category : #'Exercise@Grains-Manifest'
}

{ #category : #'code-critics' }
ManifestExerciseGrains class >> ruleSendsDifferentSuperRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Grains class' #new: #true)) #'2022-06-02T23:30:18.777219-05:00') )
]
