"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCuoora,
	#superclass : #PackageManifest,
	#category : #'Cuoora-Model-Manifest'
}

{ #category : #'code-critics' }
ManifestCuoora class >> ruleRBClassNameInSelectorRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Cuoora class' #newCuoora #true)) #'2021-03-30T13:21:34.410631-03:00') )
]
