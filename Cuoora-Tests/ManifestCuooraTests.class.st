"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCuooraTests,
	#superclass : #PackageManifest,
	#category : #'Cuoora-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestCuooraTests class >> ruleRBLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CuooraTest #setUp #false)) #'2021-04-06T12:15:18.370072-03:00') )
]
