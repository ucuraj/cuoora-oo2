Class {
	#name : #HomeComponent,
	#superclass : #CuooraPageComponent,
	#category : #'Cuoora-WebUI'
}

{ #category : #rendering }
HomeComponent >> renderContentPageOn: html [
	self renderTitleOn: html.
	self renderPreguntasRelevantesOn: html 
]

{ #category : #rendering }
HomeComponent >> renderPreguntasRelevantesOn: html [
	html horizontalRule class: 'mb-4'.
	html heading level2 with: 'Últimas preguntas'.
	html container
		class: 'home-list mt-5 pregunta-anchor';
		with: [ html
				row: [ (self session user getPreguntasInteres: 5)
						do: [ :preguntaRelevante | 
							html column
								class: 'col-md-5 mb-4 mr-auto';
								with: [ html anchor
										callback: [ self verPregunta: preguntaRelevante ];
										with: [ PreguntaComponent
												conPregunta: preguntaRelevante
												renderPreguntaOn: html ] ] ] ] ]
]

{ #category : #rendering }
HomeComponent >> renderTitleOn: html [
	html
		heading: 'Bienvenido a cuOOra, ' , self session user user , '!'.
	html heading
		level: 3;
		with: 'La red social de preguntas y respuestas'
]

{ #category : #updating }
HomeComponent >> updateRoot: anHtmlRoot [ 
    self updateRoot: anHtmlRoot title: 'Home'
]

{ #category : #callbacks }
HomeComponent >> verPregunta: unaPregunta [
	self call: (VerPreguntaComponent pregunta: unaPregunta).
]
