Class {
	#name : #CrearRespuestaComponent,
	#superclass : #PreguntaComponent,
	#instVars : [
		'respuesta'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #actions }
CrearRespuestaComponent >> accept [
	self pregunta
		agregarRespuesta:
			(Respuesta conTexto: self respuesta texto Usuario: self session user).
	self answer
]

{ #category : #actions }
CrearRespuestaComponent >> cancel [
	respuesta texto: nil.
	self answer
]

{ #category : #'instance creation' }
CrearRespuestaComponent >> conPregunta: unaPregunta [
	
	self pregunta: unaPregunta.
	self respuesta: Respuesta new.
]

{ #category : #rendering }
CrearRespuestaComponent >> renderAgregarRespuestaOn: html [
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
CrearRespuestaComponent >> renderButtonsOn: html [
	html
		paragraph class: 'mt-2'; with: [ html formButton
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
CrearRespuestaComponent >> renderContentPageOn: html [
	html div with: [ self renderPreguntaOn: html ].
	html horizontalRule.
	self renderAgregarRespuestaOn: html
]

{ #category : #accessing }
CrearRespuestaComponent >> respuesta [
	^ respuesta
]

{ #category : #accessing }
CrearRespuestaComponent >> respuesta: anObject [
	respuesta := anObject
]

{ #category : #updating }
CrearRespuestaComponent >> updateRoot: anHtmlRoot [
	self
		updateRoot: anHtmlRoot
		title: 'Responder a ' , pregunta titulo
]
