Class {
	#name : #AccessComponent,
	#superclass : #CuooraPageComponent,
	#instVars : [
		'pass',
		'badCredentials'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #actions }
AccessComponent >> logout [
	self session logout
]

{ #category : #accessing }
AccessComponent >> pass [
	^ pass
]

{ #category : #accessing }
AccessComponent >> pass: unaPass [
	pass := unaPass
]

{ #category : #private }
AccessComponent >> proceedWith: unUsuario [
	self session user: unUsuario.
	self call: HomeComponent new.
]

{ #category : #rendering }
AccessComponent >> renderBadCredentialsOn: html [
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
AccessComponent >> renderButtonsOn: html [
	 self subclassResponsibility. 
]

{ #category : #rendering }
AccessComponent >> renderContentPageOn: html [
	html heading: 'CuOOra'.
	html heading
		level: 3;
		with: 'La red social de preguntas y respuestas'.
	html horizontalRule.
	html
		form: [ self renderInputElementsOn: html.
			self renderBadCredentialsOn: html.
			self renderButtonsOn: html ].
	self renderRegisterButtonOn: html
]

{ #category : #rendering }
AccessComponent >> renderInputElementsOn: html [
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

{ #category : #rendering }
AccessComponent >> renderRegisterButtonOn:html [ 
self subclassResponsibility. 
]
