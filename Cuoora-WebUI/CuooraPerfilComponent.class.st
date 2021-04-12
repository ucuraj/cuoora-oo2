Class {
	#name : #CuooraPerfilComponent,
	#superclass : #CuooraPageComponent,
	#category : #'Cuoora-WebUI'
}

{ #category : #rendering }
CuooraPerfilComponent >> renderContentPageOn: html [
	self renderTitleOn: html.
	self renderPreguntasRelevantesOn: html 
]

{ #category : #rendering }
CuooraPerfilComponent >> renderPreguntasRelevantesOn: html [
	| preg |
	html horizontalRule class: 'mb-4'.
	html heading level2 with: 'Últimas preguntas'.
	html container
		class: 'home-list mt-5';
		with: [ html
				row class:'pregunta-anchor'; with: [ (self session user getPreguntasInteres: 5)
						do: [ :preguntaRelevante | 
							preguntaRelevante.
							html anchor class: 'pregunta-anchor'; 
								callback: [ self verPregunta: preguntaRelevante ];
								with: [ html
										column: [ preg := PreguntaPageComponent pregunta: preguntaRelevante.
											preg renderPreguntaOn: html.
											html horizontalRule class: 'hr-dots mt-4 mb-5' ]
										mediumSize: 6 ] ] ] ]
]

{ #category : #rendering }
CuooraPerfilComponent >> renderTitleOn: html [
	html
		heading: 'Bienvenido a cuOOra, ' , self session user user , '!'.
	html heading
		level: 3;
		with: 'La red social de preguntas y respuestas'
]

{ #category : #updating }
CuooraPerfilComponent >> updateRoot: anHtmlRoot [ 
    self updateRoot: anHtmlRoot title: 'Home | cuOOra'
]

{ #category : #callbacks }
CuooraPerfilComponent >> verPregunta: unaPregunta [
	self call: (CuooraVerPreguntaComponent pregunta: unaPregunta).
]
