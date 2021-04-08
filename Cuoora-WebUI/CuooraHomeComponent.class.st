Class {
	#name : #CuooraHomeComponent,
	#superclass : #CuooraPageComponent,
	#category : #'Cuoora-WebUI'
}

{ #category : #updating }
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
	html
		unorderedList: [ self session user preguntasInteres  
				do: [ :preguntaRelevante | 
					preg := CuooraVerPreguntaComponent pregunta: preguntaRelevante.
					html anchor
						callback: [ self verPregunta: preguntaRelevante ];
						with: [ html div
								id: 'pregunta-home';
								with: [ preg renderPreguntaOn: html ] ].
					html horizontalRule ] ]
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
