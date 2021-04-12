Class {
	#name : #CuooraPerfilComponent,
	#superclass : #CuooraPageComponent,
	#instVars : [
		'usuarioPerfil'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #'instance creation' }
CuooraPerfilComponent class >> conUsuario: unUsuario [
	^ self new usuarioPerfil: unUsuario.
]

{ #category : #actions }
CuooraPerfilComponent >> dejarDeSeguirA: unUsuario [
	self session user dejarDeSeguirUsuario: unUsuario
]

{ #category : #rendering }
CuooraPerfilComponent >> renderContentPageOn: html [
	self renderTitleOn: html.
	self renderPreguntasDelUsuarioOn: html 
]

{ #category : #rendering }
CuooraPerfilComponent >> renderPreguntasDelUsuarioOn: html [
	| preg |
	html horizontalRule class: 'mb-4'.
	html container
		class: 'home-list mt-5';
		with: [ html
				row class:'pregunta-anchor'; with: [ (self usuarioPerfil preguntas)
						do: [ :pregunta | 
							pregunta.
							html anchor class: 'pregunta-anchor'; 
								callback: [ self verPregunta: pregunta ];
								with: [ html
										column: [ preg := PreguntaPageComponent pregunta: pregunta.
											preg renderPreguntaOn: html.
											html horizontalRule class: 'hr-dots mt-5 pt-3 mb-5' ]
										mediumSize: 6 ] ] ] ]
]

{ #category : #rendering }
CuooraPerfilComponent >> renderSeguirOn: html [
	usuarioPerfil ~= self session user
		ifFalse: [ ^ self ].
	(self session user sigueA: usuarioPerfil)
		ifTrue: [ html anchor
				callback: [ self dejarDeSeguirA: usuarioPerfil ];
				with: [ html formButton
						beDanger;
						beSmall;
						with: 'Dejar de seguir' ] ]
		ifFalse: [ html anchor
				callback: [ self seguirA: usuarioPerfil ];
				with: [ html formButton
						bePrimary;
						beSmall;
						with: 'Seguir' ] ]
]

{ #category : #rendering }
CuooraPerfilComponent >> renderTitleOn: html [
	html div
		class: 'perfil-header';
		with: [ html
				div: [ html heading: 'Preguntas de ' , self usuarioPerfil user ].
			html div class:'ml-4'; with: [ self renderSeguirOn: html ] ]
]

{ #category : #actions }
CuooraPerfilComponent >> seguirA: unUsuario [
	self session user seguirUsuario: unUsuario
]

{ #category : #updating }
CuooraPerfilComponent >> updateRoot: anHtmlRoot [ 
    self updateRoot: anHtmlRoot title: 'Perfil de ', usuarioPerfil user.
]

{ #category : #accessing }
CuooraPerfilComponent >> usuarioPerfil [
	^ usuarioPerfil 
]

{ #category : #accessing }
CuooraPerfilComponent >> usuarioPerfil: unUsuario [
	usuarioPerfil := unUsuario
]

{ #category : #callbacks }
CuooraPerfilComponent >> verPregunta: unaPregunta [
	self call: (CuooraVerPreguntaComponent pregunta: unaPregunta).
]
