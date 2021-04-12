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
	html horizontalRule class:'mb-4'.
	html heading level3 with: 'Ultimas preguntas'.
	html container
		class: 'home-list mt-5';
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
									html horizontalRule class: 'hr-dots mt-5 mb-5' ]
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
