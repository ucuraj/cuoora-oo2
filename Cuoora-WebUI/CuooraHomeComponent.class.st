Class {
	#name : #CuooraHomeComponent,
	#superclass : #CuooraPageComponent,
	#category : #'Cuoora-WebUI'
}

{ #category : #rendering }
CuooraHomeComponent >> renderContentPageOn: html [
	self renderTitleOn: html.
	self renderPreguntasRelevantesOn: html
]

{ #category : #rendering }
CuooraHomeComponent >> renderPreguntasRelevantesOn: html [
	| preg |
	html horizontalRule.
	html heading level3 with: 'Ultimas preguntas'.
	html break.
	html container
		class: 'home-list';
		with: [ html
				row: [ (self session user getPreguntasInteres: 5)
						do: [ :preguntaRelevante | 
							preguntaRelevante.
							html
								column: [ preg := PreguntaPageComponent pregunta: preguntaRelevante.
									preg renderPreguntaOn: html.
									html anchor
										callback: [ self verPregunta: preguntaRelevante ];
										with: [ html outlineButton
												beSuccess;
												beSmall;
												with: 'Ver Pregunta' ].
									html horizontalRule class: 'hr-fade' ]
								mediumSize: 6 ] ] ]
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
