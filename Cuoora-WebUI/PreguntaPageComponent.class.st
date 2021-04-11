Class {
	#name : #PreguntaPageComponent,
	#superclass : #PublicacionPageComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #accessing }
PreguntaPageComponent class >> pregunta: unaPregunta [
	^ self new
		pregunta: unaPregunta;
		yourself
]

{ #category : #callbacks }
PreguntaPageComponent >> agregarRespuesta [
	"self call: RespuestaCrearPageComponent new"
]

{ #category : #callbacks }
PreguntaPageComponent >> agregarRespuestaConPregunta: unaPregunta [
	self call: (RespuestaCrearPageComponent conPregunta: unaPregunta)
]

{ #category : #callbacks }
PreguntaPageComponent >> perfilComponent: unPerfil [
	"self call: (CuooraPerfilComponent conPerfil: unPerfil)"
]

{ #category : #callbacks }
PreguntaPageComponent >> perfilPreguntaComponent [
	self perfilComponent: self pregunta usuario.
]

{ #category : #accessing }
PreguntaPageComponent >> pregunta [
	^ pregunta
]

{ #category : #accessing }
PreguntaPageComponent >> pregunta: anObject [
	pregunta := anObject
]

{ #category : #private }
PreguntaPageComponent >> proceedWithPregunta: unaPregunta [
	self pregunta: unaPregunta.
	self call: CuooraVerPreguntaComponent new.
]

{ #category : #rendering }
PreguntaPageComponent >> renderCantidadRespuestasOn: html [
	html paragraph
		class: 'cant-rtas';
		with: [ html text: 'Respuestas: '.
			html strong: self pregunta totalRespuestas ]
]

{ #category : #rendering }
PreguntaPageComponent >> renderContentPageOn: html [
	self subclassResponsibility.
]

{ #category : #rendering }
PreguntaPageComponent >> renderFechaOn: html [
	html strong: (self pregunta formatearFecha )
]

{ #category : #rendering }
PreguntaPageComponent >> renderListaTopicosOn: html [
	html paragraph
		class: 'topico';
		with: [ html text: 'Topicos: '.
			self pregunta topicos
				do: [ :topico | 
					html anchor
						callback: [ self topicoPerfilComponent: topico ];
						with: topico nombre.
					html text: ', ' ] ]
]

{ #category : #rendering }
PreguntaPageComponent >> renderOwnerOn: html [
	html
		paragraph: [ html text: 'Creado por '.
			html anchor
				callback: [ self perfilPreguntaComponent ];
				with: [ html strong: self pregunta usuario user ]]
]

{ #category : #rendering }
PreguntaPageComponent >> renderPreguntaOn: html [
	html div
		class: 'informacion-pregunta';
		with: [ self renderTituloDescripcionOn: html.
			self renderListaTopicosOn: html.
			self renderCantidadRespuestasOn: html.
			self renderOwnerOn: html ].
	self renderFechaOn: html.
	self renderLikesDislikesOn: html publicacion: self pregunta
]

{ #category : #rendering }
PreguntaPageComponent >> renderRespuestasContentOn: html [
	| rta |
	self pregunta respuestas
		do: [ :respuesta | 
			html div
				class: 'respuesta';
				with: [ html div
						class: 'respuesta-titulo';
						with: [ html text: 'Respuesta de '.
							html anchor
								callback: [ self perfilComponent: respuesta usuario ];
								with: [ html strong: respuesta usuario user ] ].
					html div
						class: 'respuesta-texto';
						with: [ html text: respuesta texto ].
					rta := PublicacionPageComponent publicacion: respuesta.
					rta renderLikesDislikesOn: html publicacion: respuesta ] ]
]

{ #category : #rendering }
PreguntaPageComponent >> renderRespuestasOn: html [
	self renderRespuestasContentOn: html.
	
]

{ #category : #rendering }
PreguntaPageComponent >> renderTituloDescripcionOn: html [
	html div
		class: 'titulo-pregunta';
		with: [ html heading: self pregunta titulo].
	html paragraph
		class: 'descripcion';
		with: [ html text: self pregunta descripcion ].
]

{ #category : #rendering }
PreguntaPageComponent >> renderTotalyAgregarOn: html [
	html
		paragraph: [ html text: 'Respuestas ('.
			html strong: self totalRespuestas.
			html text: ') '.
			html anchor
				callback: [ self agregarRespuestaConPregunta: self pregunta ];
				with: [ html formButton
						beWarning;
						beSmall;
						with: 'Agregar Respuesta' ] ]
]

{ #category : #callbacks }
PreguntaPageComponent >> topicoPerfilComponent: unTopico [
	"self call: (PreguntasDeTopico conTopico: unTopico)"
]

{ #category : #actions }
PreguntaPageComponent >> totalRespuestas [
	^self pregunta totalRespuestas
]

{ #category : #updating }
PreguntaPageComponent >> updateRoot: anHtmlRoot [
	self updateRoot: anHtmlRoot title: self pregunta titulo , ' | cuOOra'
]
