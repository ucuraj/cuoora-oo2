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
CuooraAccessComponent >> renderContentOn: html [
	html container
		class: 'fill';
		with: [ html jumbotron
				class: 'login-bg';
				with: [ html heading: 'Bienvenido a CuOOra!'.
					html horizontalRule.
					html
						form: [ self renderInputElementsOn: html.
							self renderBadCredentialsOn: html.
							self renderButtonsOn: html ] ] ]
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

{ #category : #rendering }
CuooraAccessComponent >> rendererClass [
	
	^ SBSHtmlCanvas 
]

{ #category : #hooks }
CuooraAccessComponent >> style [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Quicksand&display=swap");
	
html, body {
	height: 100%;
	width:100%
}

.fill { 
	padding-top: 100px;
	min-height: 100%;
	height: 100%;
	width:100%;
	min-width: 100%;
	background: url("https://source.unsplash.com/random/1920x1080");
	background-size:cover;
	box-shadow:inset 0 0 0 2000px rgba(0, 0, 0, 0.5);
}	
	
.login-bg { 
	background-color: rgba(0,0,0,0.5);
	max-width: 80%;
	margin-left: 10%;
	color: white;
	text-align: center;
 }

.login-bg h1, h2, h3, h4, h5, h6{
	font-family: "Quicksand", sans-serif;
}

.login-bg hr{
	background-color: white;
 }

 .login-input{
	max-width: 400px;
	margin: auto;
}
'
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
