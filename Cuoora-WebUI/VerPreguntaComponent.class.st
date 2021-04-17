Class {
	#name : #VerPreguntaComponent,
	#superclass : #PreguntaComponent,
	#category : #'Cuoora-WebUI'
}

{ #category : #rendering }
VerPreguntaComponent >> renderContentPageOn: html [
self renderTitleOn: html.
self renderPreguntaConRespuestasOn: html.
]

{ #category : #rendering }
VerPreguntaComponent >> renderPreguntaConRespuestasOn: html [
	html div
		class: 'verPregunta';
		with: [ self renderPreguntaDescripcionOn: html.
			html horizontalRule. ].
			html div
				class: 'verRespuesta';
				with: [ 	self renderTotalyAgregarOn: html.
							self renderRespuestasOn: html ].
]

{ #category : #rendering }
VerPreguntaComponent >> renderPreguntaSinRespuestasOn:html [
	html div
		class: 'verPregunta';
		with: [ self renderPreguntaDescripcionOn: html.
			html horizontalRule. ]
]

{ #category : #rendering }
VerPreguntaComponent >> renderTitleOn: html [
	html heading
		level: 2;
		with: 'Viendo pregunta'
]
