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
	self call: (CuooraRegisterComponent newExiste: unUsuario)
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
	self renderRegisterButtonOn: html
]

{ #category : #rendering }
CuooraRegisterComponent >> renderInputElementsOn: html [
	html heading: 'Registrate en cuOOra, es gratis!'.
	existe
		ifNotNil: [ html paragraph.
			html label: 'Usuario ' , existe , ' ya existe' ].
	html paragraph: [  ].
	super renderInputElementsOn: html
]

{ #category : #rendering }
CuooraRegisterComponent >> renderRegisterButtonOn: html [
	html submitButton
		callback: [ self registerAndLogin ];
		with: 'Crear cuenta.'
]

{ #category : #actions }
CuooraRegisterComponent >> updateRoot: anHtmlRoot [
	self updateRoot: anHtmlRoot title: 'Registro | cuOOra'
]
