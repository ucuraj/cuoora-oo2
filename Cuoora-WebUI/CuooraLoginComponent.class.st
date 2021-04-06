Class {
	#name : #CuooraLoginComponent,
	#superclass : #CuooraAccessComponent,
	#category : #'Cuoora-WebUI'
}

{ #category : #actions }
CuooraLoginComponent class >> logout [
	"CUando cierro la sesión llamo a lougout, que me devuelve una nueva pagina de login con usuario en nil"

	^ self new
		logout;
		yourself
]

{ #category : #callbacks }
CuooraLoginComponent >> login [
	(self model loginUser: user password: pass)
		ifNotNil: [ :u | self proceedWith: u ].
	user := nil.
	pass := nil.
	self session user: 'incorrecto'
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
	html submitButton
		callback: [ self login ];
		with: 'Iniciar sesión'.
	self session user = 'incorrecto'
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
