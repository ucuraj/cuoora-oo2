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
	"Chequea que user y pass sean correctos.
	Si no setea user pass session->user en nil 
	y badCredentials en true, para mostrar msj de error"

	(self model loginUser: user password: pass)
		ifNotNil: [ :u | 
			self session badCredentials: false.
			self proceedWith: u ].
	user := nil.
	pass := nil.
	self session user: nil.
	self session badCredentials: true
]

{ #category : #callbacks }
CuooraLoginComponent >> registerNewUser [
	self call: CuooraRegisterComponent new.
]

{ #category : #rendering }
CuooraLoginComponent >> renderButtonsOn: html [
	self renderLoginButtonOn: html.
	html horizontalRule .
]

{ #category : #rendering }
CuooraLoginComponent >> renderInputElementsOn: html [
	html heading level:5; with: 'Ingresá tus datos para iniciar sesión'.
	html paragraph.
	super renderInputElementsOn: html
	
]

{ #category : #rendering }
CuooraLoginComponent >> renderLoginButtonOn: html [
	html formButton beSuccess; beSmall;
		callback: [ self login ];
		with: 'Iniciar sesión'.
]

{ #category : #rendering }
CuooraLoginComponent >> renderRegisterButtonOn: html [
	html anchor
		callback: [ self session user: nil.
			self registerNewUser ];
		with:
			[html outlineButton
				beWarning;
				beSmall;
				with: 'Crear nueva cuenta.'].
]

{ #category : #rendering }
CuooraLoginComponent >> updateRoot: anHtmlRoot [ 
    self updateRoot: anHtmlRoot title: 'Login | cuOOra'
]
