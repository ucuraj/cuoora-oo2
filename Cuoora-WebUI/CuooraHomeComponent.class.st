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
	html horizontalRule.
	html heading level4 with: 'Ultimas preguntas'.
	html listGroup
		class: 'align-left';
		with: [ (self session user getPreguntasInteres: 5)
				do: [ :preguntaRelevante | 
					preguntaRelevante.
					html horizontalRule.
					preg := PreguntaPageComponent pregunta: preguntaRelevante.
					preg renderPreguntaOn: html.
					html anchor
						callback: [ self verPregunta: preguntaRelevante ];
						with: [ html outlineButton
								beSuccess;
								beSmall;
								with: 'Ver Pregunta' ] ] .
						html horizontalRule].
					
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
