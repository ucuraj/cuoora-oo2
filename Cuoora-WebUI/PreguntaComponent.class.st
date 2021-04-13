Class {
	#name : #PreguntaComponent,
	#superclass : #PublicacionComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #accessing }
PreguntaComponent class >> pregunta: unaPregunta [
	^ self new
		pregunta: unaPregunta;
		yourself
]

{ #category : #callbacks }
PreguntaComponent >> agregarRespuesta [
	"self call: RespuestaCrearPageComponent new"
]

{ #category : #callbacks }
PreguntaComponent >> agregarRespuestaConPregunta: unaPregunta [
	self call: (CrearRespuestaComponent conPregunta: unaPregunta)
]

{ #category : #callbacks }
PreguntaComponent >> perfilComponent: unUsuario [
	self call: (PerfilComponent conUsuario: unUsuario)
]

{ #category : #callbacks }
PreguntaComponent >> perfilPreguntaComponent [
	self perfilComponent: self pregunta usuario. 
]

{ #category : #accessing }
PreguntaComponent >> pregunta [
	^ pregunta
]

{ #category : #accessing }
PreguntaComponent >> pregunta: anObject [
	pregunta := anObject
]

{ #category : #private }
PreguntaComponent >> proceedWithPregunta: unaPregunta [
	self pregunta: unaPregunta.
	self call: VerPreguntaComponent new.
]

{ #category : #rendering }
PreguntaComponent >> renderCantidadRespuestasOn: html [
	html span
		class: 'cant-rtas';
		with: [ html text: 'respuestas: '.
			html strong: self pregunta totalRespuestas ].
	html break.
]

{ #category : #rendering }
PreguntaComponent >> renderContentPageOn: html [
	self subclassResponsibility.
]

{ #category : #rendering }
PreguntaComponent >> renderDescripcionOn: html [
	html div
		class: 'descripcion-pregunta';
		with: [ html span: self pregunta descripcion.]
]

{ #category : #rendering }
PreguntaComponent >> renderFechaOn: html [
	html span: [ html text: 'el ' , self pregunta formatearFecha ].
	html break.
]

{ #category : #rendering }
PreguntaComponent >> renderListaTopicosOn: html [
	html span
		class: 'topico';
		with: [ html text: 'topicos: '.
			self pregunta topicos
				do: [ :topico | 
					html span
					id:'topicos';
					with: [ html strong: topico nombre ].
					html text: ', ' ] ].
	html break
]

{ #category : #rendering }
PreguntaComponent >> renderOwnerOn: html [
	html
		span: [ html text: 'creado por: '.
			html anchor
				callback: [ self perfilPreguntaComponent ];
				with: [ html strong: self pregunta usuario user ] ].
	html break.
]

{ #category : #rendering }
PreguntaComponent >> renderPreguntaDescripcionOn: html [
	html div
		with: [ self renderTituloOn: html.
			html horizontalRule class: 'hr-pregunta'.
			self renderOwnerOn: html.
			self renderFechaOn: html.
			self renderListaTopicosOn: html.
			self renderCantidadRespuestasOn: html.
			self renderDescripcionOn: html.
			html break.
			self renderLikesDislikesOn: html publicacion: self pregunta ]
]

{ #category : #rendering }
PreguntaComponent >> renderPreguntaOn: html [
	html div
		with: [ self renderTituloOn: html.
			html horizontalRule class: 'hr-pregunta'.
			self renderOwnerOn: html.
			self renderFechaOn: html.
			self renderListaTopicosOn: html.
			self renderCantidadRespuestasOn: html.
			html break.
			self renderLikesDislikesOn: html publicacion: self pregunta ]
]

{ #category : #rendering }
PreguntaComponent >> renderRespuestasOn: html [
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
					rta := PublicacionComponent publicacion: respuesta.
					rta renderLikesDislikesOn: html publicacion: respuesta ] ]
]

{ #category : #rendering }
PreguntaComponent >> renderTituloOn: html [
	html div
		class: 'titulo-pregunta';
		with: [ html span: self pregunta titulo ]
]

{ #category : #rendering }
PreguntaComponent >> renderTotalyAgregarOn: html [
	html
		paragraph: [ html strong style:'font-size:14px'; with:('Respuestas ({1})' format: {self totalRespuestas}).
			html break.
			html anchor
				callback: [ self agregarRespuestaConPregunta: self pregunta ];
				with: [ html badge class:'text-white p-2';
						beWarning;
						with: [html strong: 'Agregar Respuesta' ] ] ]
]

{ #category : #callbacks }
PreguntaComponent >> topicoPerfilComponent: unTopico [
	"self call: (PreguntasDeTopico conTopico: unTopico)"
]

{ #category : #actions }
PreguntaComponent >> totalRespuestas [
	^self pregunta totalRespuestas
]

{ #category : #updating }
PreguntaComponent >> updateRoot: anHtmlRoot [
	self updateRoot: anHtmlRoot title: self pregunta titulo
]

{ #category : #callbacks }
PreguntaComponent >> verPregunta [
	self call: (VerPreguntaComponent pregunta: self pregunta).
]
