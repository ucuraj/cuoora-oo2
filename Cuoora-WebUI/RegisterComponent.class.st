Class {
	#name : #RegisterComponent,
	#superclass : #AccessComponent,
	#instVars : [
		'existe'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #'instance creation' }
RegisterComponent class >> newExiste: unUsuario [
	^ self new
		existe: unUsuario;
		yourself
]

{ #category : #accessing }
RegisterComponent >> existe [
	^existe
]

{ #category : #accessing }
RegisterComponent >> existe: unUsuario [
	existe := unUsuario
]

{ #category : #private }
RegisterComponent >> proceedUserExists: unUsuario [
	existe := unUsuario.
	self call: (self class newExiste: unUsuario)
]

{ #category : #rendering }
RegisterComponent >> registerAndLogin [
	| usuarioNuevo |
	(Cuoora soleInstance existeUsuario: user)
		ifNil: [ usuarioNuevo := Usuario conNombre: user Password: pass.
			Cuoora soleInstance agregarUsuario: usuarioNuevo.
			self proceedWith: usuarioNuevo ]
		"si no devuelve nil es porque ya existe"
		ifNotNil: [ self proceedUserExists: user ]
]

{ #category : #rendering }
RegisterComponent >> renderButtonsOn: html [
	html space.
]

{ #category : #rendering }
RegisterComponent >> renderContentPageOn: html [
	html heading: 'CuOOra'.
	html heading
		level: 3;
		with: 'La red social de preguntas y respuestas'.
	html horizontalRule.
	html
		form: [ self renderInputElementsOn: html.
			self renderRegisterButtonOn: html ]
]

{ #category : #rendering }
RegisterComponent >> renderInputElementsOn: html [
	html heading
		level: 3;
		with: 'Registrate en cuOOra, es gratis!'.
	html break.
	existe
		ifNotNil: [ html label: 'Usuario ' , existe , ' ya existe'.
			existe := nil ].
	super renderInputElementsOn: html
]

{ #category : #rendering }
RegisterComponent >> renderRegisterButtonOn: html [
	html formButton beWarning;
		callback: [ self registerAndLogin ];
		with: 'Crear Cuenta'.
]

{ #category : #actions }
RegisterComponent >> updateRoot: anHtmlRoot [
	self updateRoot: anHtmlRoot title: 'Registro'
]
