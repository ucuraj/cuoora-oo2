Class {
	#name : #CuooraSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #accessing }
CuooraSession >> logout [
	self usuario: nil.
]

{ #category : #accessing }
CuooraSession >> user [
	^ user
]

{ #category : #accessing }
CuooraSession >> user: unUser [
	user:= unUser
]
