Class {
	#name : #CuooraVerPreguntaComponent,
	#superclass : #PreguntaPageComponent,
	#category : #'Cuoora-WebUI'
}

{ #category : #accessing }
CuooraVerPreguntaComponent class >> pregunta: unaPregunta [
	^ self new
		pregunta: unaPregunta;
		yourself
]

{ #category : #rendering }
CuooraVerPreguntaComponent >> renderContentPageOn: html [
self renderTitleOn: html.
self renderPreguntaConRespuestasOn: html.
]

{ #category : #rendering }
CuooraVerPreguntaComponent >> renderPreguntaConRespuestasOn: html [
	html div
		class: 'verPregunta';
		with: [ self renderPreguntaOn: html.
			html horizontalRule. ].
			html div
				class: 'verRespuesta';
				with: [ 	self renderTotalyAgregarOn: html.
							self renderRespuestasOn: html ].
]

{ #category : #rendering }
CuooraVerPreguntaComponent >> renderPreguntaSinRespuestasOn:html [
	html div
		class: 'verPregunta';
		with: [ self renderPreguntaOn: html.
			html horizontalRule. ]
]

{ #category : #rendering }
CuooraVerPreguntaComponent >> renderTitleOn:html [
	html heading
		level:2;
		with:'Informacion de Pregunta'.
]
