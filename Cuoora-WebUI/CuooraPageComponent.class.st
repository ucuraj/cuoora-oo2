Class {
	#name : #CuooraPageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #callbacks }
CuooraPageComponent >> buscarUsuarios [
	"self call: BuscarUsuarioComponent new."
]

{ #category : #actions }
CuooraPageComponent >> loggedIn [
	^ self user isNotNil.
	
]

{ #category : #model }
CuooraPageComponent >> model [ 
	^ Cuoora soleInstance
]

{ #category : #'instance creation' }
CuooraPageComponent >> newPregunta [
	"| preg |
	preg := CrearPreguntaComponent pregunta: Pregunta new.
	self call: preg.
	preg pregunta
		ifNotNil: [ self session user agregarPregunta: preg pregunta ]"
]

{ #category : #'instance creation' }
CuooraPageComponent >> newTopico [
	"| topico |
	topico := CrearTopicoComponent topico: Topico new.
	self call: topico.
	topico topico ifNotNil: [ self model agregarTopico: topico topico ]"
]

{ #category : #callbacks }
CuooraPageComponent >> proceedWithHome [
	self call: CuooraHomeComponent new.
]

{ #category : #rendering }
CuooraPageComponent >> renderButtonsOn: html [
	 self subclassResponsibility. 
]

{ #category : #rendering }
CuooraPageComponent >> renderContentOn: html [
	 self subclassResponsibility.
]

{ #category : #rendering }
CuooraPageComponent >> renderHeaderInfoOn: html [
	self renderNavigationOn: html.
	html text: ' | '.
	html span
		id: 'username';
		with: [ html anchor
				callback: [ self verPerfil: self session user ];
				with: [ html strong: self session user user ] ].
	html span: ' | '.
	html span
		with: [ html anchor
				callback: [ self call: CuooraLoginComponent logout ];
				with: [ html strong: 'Cerrar Sesión' ] ]
]

{ #category : #rendering }
CuooraPageComponent >> renderHeaderOn: html [
	html div
		id: 'cuoora-header';
		with: [ html div
				id: 'titulo-header';
				with: [ html anchor
						callback: [ self proceedWithHome ];
						with: 'CuOOra' ].
			html div
				id: 'header-info';
				with: [ self renderHeaderInfoOn: html ] ]
]

{ #category : #rendering }
CuooraPageComponent >> renderInputElementsOn: html [
	html label: 'Usuario'.
	html paragraph: [ html textInput on: #user of: self ].
	html label: 'Contraseña'.
	html paragraph: [  html passwordInput on: #pass of: self ]
]

{ #category : #rendering }
CuooraPageComponent >> renderNavigationOn: html [
	html anchor
		callback: [ self buscarUsuarios ];
		with: [ html strong: 'Buscar Usuarios' ].
	html span: ' | '.
	html anchor
		callback: [ self newTopico ];
		with: [ html strong: 'Agregar Topico' ].
	html span: ' | '.
	html anchor
		callback: [ self newPregunta ];
		with: [ html strong: 'Agregar Pregunta' ]
]

{ #category : #rendering }
CuooraPageComponent >> renderNavigationUser: html [
	html span
		id: 'username';
		with: [ html anchor
				callback: [ self verPerfil: self session usuario ];
				with: [ html strong: self session usuario username ] ].
	html span: ' | '.
	html span
		with: [ html anchor
				callback: [ self call: CuooraLoginComponent logout ];
				with: [ html strong: 'Cerrar Sesión' ] ]
]

{ #category : #style }
CuooraPageComponent >> renderPreguntasOn: html preguntas: unasPreguntas [
	"| preg |
	html
		unorderedList: [ unasPreguntas
				do: [ :pregunta | 
					preg := self.
					html anchor
						callback: [ self verPregunta: pregunta ];
						with: [ html div
								id: 'pregunta-home';
								with: [ preg renderPreguntaOn: html ] ].
					html horizontalRule ] ]"
]

{ #category : #style }
CuooraPageComponent >> style [
	^ '
body {
	font: 11pt Arial, Helvetica, sans-serif, Times New Roman;
	margin:0;
}
p { 
margin-left: 2%;
 }

#username{
font-weight: bold;
color:white;
}
#buscador{
	font-weight: bold;
	padding: 1%;
}
#cuoora-header{
padding: 0.4%;
background-color:black;
}


#cuoora-header a{
color:white;
}
#cuoora-header a:hover{
color:#d8d5d4;
}
#titulo-header { 
	font-size: 16pt;
	font-weight: bold;
	color:white;
	width:45%;
 }

#header-info {
	float: right;
	margin-top: -24px;
}
#crearPregunta{
padding-left:2%;
}
#pregunta-home a{ 
	text-decoration: none;
	color: black;
	font-family:"Times New Roman", Times, serif;
	font-size: 18px;
}
#pregunta-home:hover{
	border-radius:15px;
	border:0.5px solid grey;
	padding-left:2%;
}
#likes{
color:blue !important;
}
#likes:hover{
background-color:#d8d5d4;
}
#descripcion{
border: 0.5px solid #d8d5d4;
background-color:#d8d5d4;
border-radius:8px;
width: 55%;
margin-left: 4%;
font-family:"Times New Roman", Times, serif;
font-size: 18px;
}
#descripcion-crear{
border: 0.5px solid #d8d5d4;
background-color:#d8d5d4;
border-radius:8px;
width: 24%;
height: 110px;
}
#topico{
color:#747373;
}
#verPregunta{
	margin-left:5%;

}
#verRespuesta{
margin-left:1.5%;
}
#agregarPregunta{
margin-left:7.5%;
}
#agregarPregunta textarea{
	border: 1px solid #d8d5d4;
	padding: 5px 5px 5px 15px;
	height:105px;
	width: 340px;
	border-radius:14px;
}

#respuesta{
	margin-bottom: 1.5%;
	border: 1px solid #d8d5d4;
	border-radius: 14px;
	padding-left: 2%;
	padding-top: 1%;
}

#respuesta-titulo{
	font-size:12pt;
}

#respuesta-texto{
margin-top:1%;
padding-left:2%;
max-width:45%;
}

#perfil-title{
	margin-left:2%;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 28px;
}
#puntaje { 
	margin-left:2.5%;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 20px;
 }
#header-perfil {
float:left;
	width:50%;
}
#topicos-interes{
	margin-top:2%;
	margin-left:20%;
	float:right;
	width:30%;
}
#sin-preguntas{
    max-width: 50%;
    margin-top: 8%;
    padding-left: 2%;
}
#preguntas-prev{
	float:left;
	width: 50%;
}
#titulo-pregunta{
	font-weight: bold;
	font-size: 17pt;
}
#seguir{
	float:rigth;
}
'
]

{ #category : #actions }
CuooraPageComponent >> updateRoot: anHtmlRoot title: aTitle [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: aTitle.
]

{ #category : #accessing }
CuooraPageComponent >> user [
	^ user
]

{ #category : #accessing }
CuooraPageComponent >> user: anUser [
	user := anUser.
]

{ #category : #callbacks }
CuooraPageComponent >> verPerfil: unUsuario [
	"self call: (CuooraPerfilComponent conPerfil: unUsuario)"
]

{ #category : #callbacks }
CuooraPageComponent >> verPregunta: unaPregunta [
	"self call: (VerPreguntaComponent pregunta: unaPregunta)"
]
