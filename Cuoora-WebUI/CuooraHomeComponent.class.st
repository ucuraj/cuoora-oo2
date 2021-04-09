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
|preg|
	html outlineButton beSuccess; beSmall;
		callback: [ 
			self session user: nil.
			self call: CuooraRegisterComponent new.];
		with: 'Crear nueva cuenta.'.
	html heading level2 with: 'Utimas preguntas'.
	html span: self session user preguntasInteres size.
	html listGroup class: ''; with: [ self session user preguntasInteres
				do: [ :preguntaRelevante | 
					preguntaRelevante.
					preg := CuooraVerPreguntaComponent pregunta:preguntaRelevante.
					preg renderPreguntaConRespuestasOn: html.
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
