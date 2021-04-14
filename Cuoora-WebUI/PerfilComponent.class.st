Class {
	#name : #PerfilComponent,
	#superclass : #CuooraPageComponent,
	#instVars : [
		'usuarioPerfil'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #'instance creation' }
PerfilComponent class >> conUsuario: unUsuario [
	^ self new usuarioPerfil: unUsuario.
]

{ #category : #actions }
PerfilComponent >> dejarDeSeguirA: unUsuario [
	self session user dejarDeSeguirUsuario: unUsuario
]

{ #category : #rendering }
PerfilComponent >> renderContentPageOn: html [

	self renderTitleOn: html.
	self renderPreguntasDelUsuarioOn: html .
]

{ #category : #rendering }
PerfilComponent >> renderPreguntasDelUsuarioOn: html [
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
										column: [ preg := PreguntaComponent pregunta: pregunta.
											preg renderPreguntaOn: html.
											html horizontalRule class: 'hr-dots mt-5 pt-3 mb-5' ]
										mediumSize: 6 ] ] ] ]
]

{ #category : #rendering }
PerfilComponent >> renderSeguirOn: html [
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
PerfilComponent >> renderTitleOn: html [
	html div
		class: 'perfil-header';
		with: [ html
				div: [ html heading: 'Preguntas de ' , self usuarioPerfil user ].
			html div class:'ml-4'; with: [ self renderSeguirOn: html ] ]
]

{ #category : #actions }
PerfilComponent >> seguirA: unUsuario [
	self session user seguirUsuario: unUsuario
]

{ #category : #updating }
PerfilComponent >> updateRoot: anHtmlRoot [ 
    self updateRoot: anHtmlRoot title: 'Perfil de ', usuarioPerfil user.
]

{ #category : #accessing }
PerfilComponent >> usuarioPerfil [
	^ usuarioPerfil 
]

{ #category : #accessing }
PerfilComponent >> usuarioPerfil: unUsuario [
	usuarioPerfil := unUsuario
]

{ #category : #callbacks }
PerfilComponent >> verPregunta: unaPregunta [
	self call: (VerPreguntaComponent pregunta: unaPregunta).
]
