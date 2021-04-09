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
PreguntaPageComponent >> TopicoPerfilComponent: unTopico [
	"self call: (PreguntasDeTopico conTopico: unTopico)"
]

{ #category : #visiting }
PreguntaPageComponent >> accept [
	true
]

{ #category : #rendering }
PreguntaPageComponent >> agregarRespuesta [
	"self call: RespuestaCrearPageComponent new"
]

{ #category : #rendering }
PreguntaPageComponent >> agregarRespuestaConPregunta: unaPregunta [
	"self call: (RespuestaCrearPageComponent conPregunta: unaPregunta)"
]

{ #category : #visiting }
PreguntaPageComponent >> cancel [
	user := nil.
	self answer
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

{ #category : #'as yet unclassified' }
PreguntaPageComponent >> proceedWithPregunta: unaPregunta [
	self pregunta: unaPregunta.
	self call: CuooraVerPreguntaComponent new.
]

{ #category : #rendering }
PreguntaPageComponent >> renderCantidadRespuestasOn: html [
	html paragraph
		id: 'cant-rtas';
		with: [ html text: 'Respuestas: '.
				  html strong: self pregunta totalRespuestas.]
			
]

{ #category : #rendering }
PreguntaPageComponent >> renderFechaOn: html [
	html
		paragraph: [ html text: 'Creado el '.
			 html strong: self pregunta fechaCreacion asDate ] 
]

{ #category : #rendering }
PreguntaPageComponent >> renderListaTopicosOn: html [
	html paragraph
		id: 'topico';
		with: [ html text: 'Topicos: '.
			self pregunta topicos
				do: [ :topico | html anchor
											callback:[ self TopicoPerfilComponent:topico];
											with:topico nombre.
									html text:', '. ]]
]

{ #category : #rendering }
PreguntaPageComponent >> renderOwnerOn: html [
	html
		paragraph: [ html text: 'Creado por '.
			html anchor
				callback: [ self perfilPreguntaComponent ];
				with: [ html strong: self pregunta usuario user ] ]
]

{ #category : #rendering }
PreguntaPageComponent >> renderPreguntaOn: html [
	self renderTituloDescripcionOn: html.
	self renderListaTopicosOn: html.
	self renderCantidadRespuestasOn: html.
	self renderOwnerOn: html.
	self renderFechaOn: html.
	self renderLikesDislikesOn: html publicacion: self pregunta
]

{ #category : #rendering }
PreguntaPageComponent >> renderRespuestasContentOn: html [
	| rta |
	self pregunta respuestasOrdenadas
		do: [ :respuesta | 
			html div
				id: 'respuesta';
				with: [ html div
						id: 'respuesta-titulo';
						with: [ html text: 'Respuesta de '.
							html anchor
								callback: [ self perfilComponent: respuesta usuario ];
								with: [ html strong: respuesta usuario user ] ].
					html div
						id: 'respuesta-texto';
						with: [ html text: respuesta texto ].
					rta := PublicacionPageComponent publicacion: respuesta.
					rta renderLikesDislikesOn: html publicacion: respuesta ] ]
]

{ #category : #rendering }
PreguntaPageComponent >> renderRespuestasOn: html [
	self renderTotalyAgregarOn: html.
	self renderRespuestasContentOn: html.
	
]

{ #category : #rendering }
PreguntaPageComponent >> renderTituloDescripcionOn: html [
	html div
		id: 'titulo-pregunta';
		with: [ html anchor
				id: 'titulo';
				callback: [ self call: CuooraRegisterComponent new ];
				with: self pregunta titulo].
	html paragraph
		id: 'descripcion';
		with: [ html text: self pregunta descripcion ]
]

{ #category : #rendering }
PreguntaPageComponent >> renderTotalyAgregarOn: html [
	html
		paragraph: [ html text: 'Respuestas ('.
			html strong: self totalRespuestas.
			html text: ') '.
			html anchor
				callback: [ self agregarRespuestaConPregunta: self pregunta ];
				with: [ html button: 'Agregar Respuesta' ] ]
]

{ #category : #callbacks }
PreguntaPageComponent >> topicoPerfilComponent: unTopico [
	"self call: (PreguntasDeTopico conTopico: unTopico)"
]

{ #category : #actions }
PreguntaPageComponent >> totalRespuestas [
	^self pregunta totalRespuestas
]

{ #category : #actions }
PreguntaPageComponent >> updateRoot: anHtmlRoot [
	self updateRoot: anHtmlRoot title: self pregunta titulo , ' | cuOOra'
]

{ #category : #'as yet unclassified' }
PreguntaPageComponent >> verPregunta:unaPregunta [
self call: CuooraLoginComponent new.
]
