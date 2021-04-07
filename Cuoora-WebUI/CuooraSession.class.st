Class {
	#name : #CuooraSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'badCredentials'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #accessing }
CuooraSession >> badCredentials [
	^ badCredentials
]

{ #category : #accessing }
CuooraSession >> badCredentials: aBool [.
	badCredentials := aBool.
]

{ #category : #initialization }
CuooraSession >> initialize [
	super initialize.
	self badCredentials: false.
]

{ #category : #accessing }
CuooraSession >> logout [
	self user: nil.
]

{ #category : #accessing }
CuooraSession >> user [
	^ user
]

{ #category : #accessing }
CuooraSession >> user: unUser [
	user:= unUser
]
