Class {
	#name : #RespuestaCrearPageComponent,
	#superclass : #PreguntaPageComponent,
	#instVars : [
		'respuesta'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #accessing }
RespuestaCrearPageComponent class >> conPregunta: unaPregunta [
	^ self new
		pregunta: unaPregunta;
		yourself
]

{ #category : #actions }
RespuestaCrearPageComponent >> accept [
	self pregunta
		agregarRespuesta:
			(Respuesta conTexto: self respuesta texto Usuario: self session user).
	self answer
]

{ #category : #actions }
RespuestaCrearPageComponent >> cancel [
	respuesta texto: nil.
	self answer
]

{ #category : #'instance creation' }
RespuestaCrearPageComponent >> conPregunta: unaPregunta [
	
	self pregunta: unaPregunta.
	self respuesta: Respuesta new.
]

{ #category : #accessing }
RespuestaCrearPageComponent >> pregunta [
	^ pregunta
]

{ #category : #accessing }
RespuestaCrearPageComponent >> pregunta: anObject [
	pregunta := anObject
]

{ #category : #rendering }
RespuestaCrearPageComponent >> renderAgregarRespuestaOn: html [
	html div
		class: 'agregarPregunta';
		with: [ html heading level5; with: 'Responder'.
			html
				form: [ html textArea
						class: 'respuesta-input form-control';
						callback: [ :descripcion | 
							self
								respuesta: (Respuesta conTexto: descripcion Usuario: self session user) ].
					self renderButtonsOn: html ] ]
]

{ #category : #rendering }
RespuestaCrearPageComponent >> renderButtonsOn: html [
	html
		paragraph: [ html formButton
				class: 'mr-1';
				beSuccess;
				beSmall;
				callback: [ self accept ];
				with: 'Responder'.
			html formButton
				class: 'ml-1';
				beDanger;
				beSmall;
				callback: [ self cancel ];
				with: 'Cancelar ' ]
]

{ #category : #rendering }
RespuestaCrearPageComponent >> renderContentPageOn: html [
	html div with: [ self renderPreguntaOn: html ].
	html horizontalRule.
	self renderAgregarRespuestaOn: html
]

{ #category : #accessing }
RespuestaCrearPageComponent >> respuesta [
	^ respuesta
]

{ #category : #accessing }
RespuestaCrearPageComponent >> respuesta: anObject [
	respuesta := anObject
]

{ #category : #updating }
RespuestaCrearPageComponent >> updateRoot: anHtmlRoot [
	self
		updateRoot: anHtmlRoot
		title: 'Responder a ' , pregunta titulo , ' | cuOOra'
]
