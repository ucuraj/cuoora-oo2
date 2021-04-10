Class {
	#name : #CuooraHomeComponent,
	#superclass : #CuooraPageComponent,
	#category : #'Cuoora-WebUI'
}

{ #category : #private }
CuooraHomeComponent >> callLogin [
	self call: CuooraLoginComponent new
]

{ #category : #rendering }
CuooraHomeComponent >> renderButtonsOn: html [
	 "self subclassResponsibility. "
]

{ #category : #rendering }
CuooraHomeComponent >> renderContentPageOn: html [
	self renderTitleOn: html.
	self renderPreguntasRelevantesOn: html
]

{ #category : #rendering }
CuooraHomeComponent >> renderPreguntasRelevantesOn: html [
	| preg |
	html heading level2 with: 'Utimas preguntas'.
	html span: self session user preguntasInteres size.
	html listGroup
		class: '';
		with: [ self session user preguntasInteres
				do: [ :preguntaRelevante | 
					preguntaRelevante.
					html horizontalRule.
					preg := PreguntaPageComponent pregunta: preguntaRelevante.
					html anchor
						callback: [ self verPregunta: preguntaRelevante ];
						with: [ html outlineButton
								beSuccess;
								beSmall;
								with: 'Ver Pregunta' ].
					preg renderPreguntaOn: html.
					 ] ]
]

{ #category : #rendering }
CuooraHomeComponent >> renderTitleOn: html [
	html
		heading: 'Bienvenido a cuOOra, ' , self session user user , '!'.
	html heading
		level: 3;
		with: 'La red social de preguntas y respuestas'
]

{ #category : #updating }
CuooraHomeComponent >> updateRoot: anHtmlRoot [ 
    self updateRoot: anHtmlRoot title: 'Home | cuOOra'
]

{ #category : #callbacks }
CuooraHomeComponent >> verPregunta: unaPregunta [
	self call: (CuooraVerPreguntaComponent pregunta: unaPregunta).
]
