Class {
	#name : #CrearPreguntaComponent,
	#superclass : #PublicacionComponent,
	#instVars : [
		'tituloPregunta',
		'descripcionPregunta',
		'topicosCol'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #visiting }
CrearPreguntaComponent >> accept [
	self session user
		agregarPregunta:
			(Pregunta
				conTitulo: self tituloPregunta
				Descripcion: self descripcionPregunta
				Usuario: self session user
				Topicos: self topicosCol).
	self answer.
]

{ #category : #visiting }
CrearPreguntaComponent >> cancel [
	tituloPregunta:= nil.
	descripcionPregunta := nil.
	topicosCol := nil.
]

{ #category : #accessing }
CrearPreguntaComponent >> descripcionPregunta [
	^ descripcionPregunta
]

{ #category : #accessing }
CrearPreguntaComponent >> descripcionPregunta: unaDescripcion [
	descripcionPregunta := unaDescripcion
]

{ #category : #rendering }
CrearPreguntaComponent >> renderButtonsOn: html [
	html formButton
		beSuccess;
		beSmall;
		callback: [ self accept ];
		with: 'Agregar Pregunta'.
	html space.
	html formButton
		beDanger;
		beSmall;
		callback: [ self cancel ];
		with: 'Cancelar'
]

{ #category : #rendering }
CrearPreguntaComponent >> renderContentPageOn: html [
	html
		div: [ html heading level3 with: 'Agregar Pregunta'.
			html horizontalRule class:'mb-5'.
			self renderFormOn: html ]
]

{ #category : #rendering }
CrearPreguntaComponent >> renderFormOn: html [
	html
		form: [ self renderInputTituloOn: html.
			self renderInputDescripcionOn: html.
			self renderInputTopicosOn: html.
			self renderButtonsOn: html ]
]

{ #category : #rendering }
CrearPreguntaComponent >> renderInputDescripcionOn: html [
	html inputGroup
		class: 'pregunta-input';
		marginBottom: 3;
		with: [ html
				inputGroupPrepend: [ html inputGroupText
						class: 'pregunta-textinput';
						with: 'Descripcion' ].
			html textArea formControl required
				placeholder: 'Escriba aqui el desarrollo de su pregunta';
				on: #descripcionPregunta of: self ]
]

{ #category : #rendering }
CrearPreguntaComponent >> renderInputTituloOn: html [
	html inputGroup
		class: 'pregunta-input';
		marginBottom: 3;
		with: [ html inputGroupPrepend: [ html inputGroupText: 'Título' ].
			html textInput formControl required
				placeholder: 'Escriba aquí el título de su pregunta';
				on: #tituloPregunta of: self ]
]

{ #category : #rendering }
CrearPreguntaComponent >> renderInputTopicosOn: html [
	html inputGroup
		class: 'pregunta-input';
		marginBottom: 3;
		with: [ html inputGroupPrepend: [ html inputGroupText: 'Tópicos' ].
			html textInput formControl required
				placeholder: 'Ingrese tópicos separados por coma. Ej: topico1,topico2,topico3';
				on: #topicosCol of: self ]
]

{ #category : #accessing }
CrearPreguntaComponent >> tituloPregunta [
	^ tituloPregunta
]

{ #category : #accessing }
CrearPreguntaComponent >> tituloPregunta: unTitulo [
	tituloPregunta := unTitulo
]

{ #category : #accessing }
CrearPreguntaComponent >> topicosCol [
	^ topicosCol
]

{ #category : #accessing }
CrearPreguntaComponent >> topicosCol: unosTopicos [
	topicosCol := unosTopicos
]

{ #category : #updating }
CrearPreguntaComponent >> updateRoot: anHtmlRoot [
	self updateRoot: anHtmlRoot title: 'Agregar Pregunta'
]
