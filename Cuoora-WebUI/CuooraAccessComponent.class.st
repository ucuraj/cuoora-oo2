Class {
	#name : #CuooraAccessComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'pass'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #actions }
CuooraAccessComponent >> logout [
	self session logout
]

{ #category : #model }
CuooraAccessComponent >> model [
	^ Cuoora soleInstance
]

{ #category : #accessing }
CuooraAccessComponent >> pass [
	^ pass
]

{ #category : #accessing }
CuooraAccessComponent >> pass: unaPass [
	pass := unaPass
]

{ #category : #private }
CuooraAccessComponent >> proceedWith: unUsuario [
	self session usuario: unUsuario.
	self call: CuooraHomeComponent new.
]

{ #category : #rendering }
CuooraAccessComponent >> renderButtonsOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
CuooraAccessComponent >> renderContentOn: html [
	html paragraph with: [ html heading: 'CuOOra' ].
	html paragraph.
	html
		form: [ self renderInputElementsOn: html.
			self renderButtonsOn: html ]
]

{ #category : #rendering }
CuooraAccessComponent >> renderInputElementsOn: html [
	html label: 'Usuario'.
	html paragraph: [ html textInput on: #usuario of: self ].
	html label: 'Contraseña'.
	html paragraph: [  html passwordInput on: #contrasena of: self ]
]

{ #category : #actions }
CuooraAccessComponent >> updateRoot: anHtmlRoot title: aTitle [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: aTitle
]

{ #category : #accessing }
CuooraAccessComponent >> user [
	^ user
]

{ #category : #accessing }
CuooraAccessComponent >> user: unUser [
	user := unUser
]
