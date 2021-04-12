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
PreguntaPageComponent >> perfilComponent: unUsuario [
	self call: (CuooraPerfilComponent conUsuario: unUsuario)
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
	html span
		class: 'cant-rtas';
		with: [ html text: 'respuestas: '.
			html strong: self pregunta totalRespuestas ].
	html break.
]

{ #category : #rendering }
PreguntaPageComponent >> renderContentPageOn: html [
	self subclassResponsibility.
]

{ #category : #rendering }
PreguntaPageComponent >> renderDescripcionOn: html [
	html div
		class: 'descripcion-pregunta';
		with: [ html span: self pregunta descripcion.]
]

{ #category : #rendering }
PreguntaPageComponent >> renderFechaOn: html [
	html span: [ html text: 'el ' , self pregunta formatearFecha ].
	html break.
]

{ #category : #rendering }
PreguntaPageComponent >> renderListaTopicosOn: html [
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
PreguntaPageComponent >> renderOwnerOn: html [
	html
		span: [ html text: 'creado por: '.
			html anchor
				callback: [ self perfilPreguntaComponent ];
				with: [ html strong: self pregunta usuario user ] ].
	html break.
]

{ #category : #rendering }
PreguntaPageComponent >> renderPreguntaDescripcionOn: html [
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
PreguntaPageComponent >> renderPreguntaOn: html [
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
PreguntaPageComponent >> renderRespuestasOn: html [
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
PreguntaPageComponent >> renderTituloOn: html [
	html div
		class: 'titulo-pregunta';
		with: [ html span: self pregunta titulo ]
]

{ #category : #rendering }
PreguntaPageComponent >> renderTotalyAgregarOn: html [
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

{ #category : #callbacks }
PreguntaPageComponent >> verPregunta [
	self call: (CuooraVerPreguntaComponent pregunta: self pregunta).
]
