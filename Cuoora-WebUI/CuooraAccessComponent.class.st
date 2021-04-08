Class {
	#name : #CuooraAccessComponent,
	#superclass : #CuooraPageComponent,
	#instVars : [
		'pass',
		'badCredentials'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #actions }
CuooraAccessComponent >> logout [
	self session logout
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
	self session user: unUsuario.
	self call: CuooraHomeComponent new.
]

{ #category : #rendering }
CuooraAccessComponent >> renderBadCredentialsOn: html [
	self session badCredentials
		ifFalse: [ ^ self ].
	html alert
		class: 'login-input';
		beDanger;
		with: 'Usuario/Contraseña incorrectos'.
	html break.
	self session badCredentials: false
]

{ #category : #rendering }
CuooraAccessComponent >> renderButtonsOn: html [
	 self subclassResponsibility. 
]

{ #category : #rendering }
CuooraAccessComponent >> renderContentPageOn: html [
	html heading: 'Bienvenido a CuOOra!'.
			html horizontalRule.
			html
				form: [ self renderInputElementsOn: html.
					self renderBadCredentialsOn: html.
					self renderButtonsOn: html ].
]

{ #category : #rendering }
CuooraAccessComponent >> renderInputElementsOn: html [
	html div
		with: [ html inputGroup
				class: 'login-input';
				marginBottom: 3;
				with: [ html inputGroupPrepend: [ html inputGroupText: 'user' ].
					html textInput formControl required
						placeholder: '';
						on: #user of: self ].
			html inputGroup
				class: 'login-input';
				marginBottom: 3;
				with: [ html inputGroupPrepend: [ html inputGroupText: 'pass' ].
					html passwordInput required
						formControl;
						on: #pass of: self ] ].
	
]
