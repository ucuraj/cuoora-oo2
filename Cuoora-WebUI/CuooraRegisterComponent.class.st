Class {
	#name : #CuooraRegisterComponent,
	#superclass : #CuooraAccessComponent,
	#instVars : [
		'existe'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #'instance creation' }
CuooraRegisterComponent class >> newExiste: unUsuario [
	^ self new
		existe: unUsuario;
		yourself
]

{ #category : #accessing }
CuooraRegisterComponent >> existe [
	^existe
]

{ #category : #accessing }
CuooraRegisterComponent >> existe: unUsuario [
	existe := unUsuario
]

{ #category : #private }
CuooraRegisterComponent >> proceedUserExists: unUsuario [
	existe := unUsuario.
	self call: (self class newExiste: unUsuario)
]

{ #category : #rendering }
CuooraRegisterComponent >> registerAndLogin [
	| usuarioNuevo |
	(Cuoora soleInstance existeUsuario: user)
		ifNil: [ usuarioNuevo := Usuario conNombre: user Password: pass.
			Cuoora soleInstance agregarUsuario: usuarioNuevo.
			self proceedWith: usuarioNuevo ]
		"si no devuelve nil es porque ya existe"
		ifNotNil: [ self proceedUserExists: user ]
]

{ #category : #rendering }
CuooraRegisterComponent >> renderButtonsOn: html [
	html space.
]

{ #category : #rendering }
CuooraRegisterComponent >> renderContentPageOn: html [
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
CuooraRegisterComponent >> renderInputElementsOn: html [
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
CuooraRegisterComponent >> renderRegisterButtonOn: html [
	html formButton beWarning;
		callback: [ self registerAndLogin ];
		with: 'Crear Cuenta'.
]

{ #category : #actions }
CuooraRegisterComponent >> updateRoot: anHtmlRoot [
	self updateRoot: anHtmlRoot title: 'Registro | cuOOra'
]
