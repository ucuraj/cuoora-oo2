"
- Metacello new
-      baseline:'Bootstrap4';
-      repository: 'github://astares/Seaside-Bootstrap4:master/src';
-      load.
-
- cuoora := WAAdmin register: CuooraLoginComponent asApplicationAt: 'cuoora'.
- cuoora sessionClass: CuooraSession.


"
Class {
	#name : #CuooraLoginComponent,
	#superclass : #CuooraAccessComponent,
	#instVars : [
		'badCredentials'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #actions }
CuooraLoginComponent class >> logout [
	"CUando cierro la sesión llamo a lougout, que me devuelve una nueva pagina de login con usuario en nil"

	^ self new
		logout;
		yourself
]

{ #category : #accessing }
CuooraLoginComponent >> badCredentials [
	^ badCredentials
]

{ #category : #accessing }
CuooraLoginComponent >> badCredentials: anObject [
	badCredentials := anObject
]

{ #category : #initialization }
CuooraLoginComponent >> initialize [
	super initialize.
	self badCredentials: false.
]

{ #category : #callbacks }
CuooraLoginComponent >> login [
	"Chequea que user y pass sean correctos.
	Si no setea user pass session->user en nil 
	y badCredentials en true, para mostrar msj de error"

	(self model loginUser: user password: pass)
		ifNotNil: [ :u | self proceedWith: u ].
	user := nil.
	pass := nil.
	self session user: nil.
	self badCredentials: true
]

{ #category : #rendering }
CuooraLoginComponent >> renderButtonsOn: html [
	self renderLoginButtonOn: html.
	html horizontalRule .
	html paragraph: 'No tenés cuenta? Unite a cuOOra ahora mismo!'.
	self renderRegisterButtonOn: html
]

{ #category : #rendering }
CuooraLoginComponent >> renderInputElementsOn: html [
	html heading
		level: 2;
		with: 'Bienvenido!'.
	html paragraph: 'Ingresá tus datos para iniciar sesión'.
	super renderInputElementsOn: html
]

{ #category : #rendering }
CuooraLoginComponent >> renderLoginButtonOn: html [
	html formButton beSuccess
		callback: [ self login ];
		with: 'Iniciar sesión'.
	self badCredentials
		ifTrue: [ html paragraph: 'Usuario/Contraseña incorrectos' ]
]

{ #category : #rendering }
CuooraLoginComponent >> renderRegisterButtonOn: html [
	html submitButton
		callback: [ 
			self session user: nil.
			self ];
		with: 'Crear nueva cuenta.'
]

{ #category : #rendering }
CuooraLoginComponent >> updateRoot: anHtmlRoot [ 
    self updateRoot: anHtmlRoot title: 'Login | cuOOra'
]
