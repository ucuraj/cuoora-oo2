Class {
	#name : #CuooraHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #callbacks }
CuooraHomeComponent >> callLogin [
	self call: CuooraLoginComponent new
]

{ #category : #actions }
CuooraHomeComponent >> logueado [
	^ self user isNotNil
]

{ #category : #model }
CuooraHomeComponent >> model [
	^ Cuoora soleInstance
]

{ #category : #rendering }
CuooraHomeComponent >> renderContentOn: html [
	self renderHeaderOn: html.
	self renderTitleOn: html.
]

{ #category : #rendering }
CuooraHomeComponent >> renderHeaderInfoOn: html [
	self renderNavigationOn: html.
	html text: ' | '.
	html span
		id: 'username';
		with: [ html anchor
				callback: [ self ];
				with: [ html strong: self session user user ] ].
	html span: ' | '.
	html span
		with: [ html anchor
				callback: [ self call: CuooraLoginComponent logout ];
				with: [ html strong: 'Cerrar Sesión' ] ]
]

{ #category : #rendering }
CuooraHomeComponent >> renderHeaderOn: html [
	html div
		id: 'cuoora-header';
		with: [ html div
				id: 'titulo-header';
				with: [ html anchor
						callback: [ self call: self class new ];
						with: 'CuOOra' ].
			html div
				id: 'header-info';
				with: [ self renderHeaderInfoOn: html ] ]
]

{ #category : #rendering }
CuooraHomeComponent >> renderNavigationOn: html [
	html anchor
		callback: [ self ];
		with: [ html strong: 'Buscar Usuarios' ].
	html span: ' | '.
	html anchor
		callback: [ self ];
		with: [ html strong: 'Agregar Topico' ].
	html span: ' | '.
	html anchor
		callback: [ self ];
		with: [ html strong: 'Agregar Pregunta' ]
]

{ #category : #rendering }
CuooraHomeComponent >> renderTitleOn: html [
	html
		heading: 'Bienvenido a cuOOra, ' , self session user user , '!'.
	html heading
		level: 3;
		with: 'La red social de preguntas y respuestas'
]

{ #category : #style }
CuooraHomeComponent >> style [
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
CuooraHomeComponent >> updateRoot: anHtmlRoot [ 
    self updateRoot: anHtmlRoot title: 'Home | cuOOra'
]

{ #category : #actions }
CuooraHomeComponent >> updateRoot: anHtmlRoot title: aTitle [
    super updateRoot: anHtmlRoot.
    anHtmlRoot title: aTitle.
]

{ #category : #accessing }
CuooraHomeComponent >> user [
	^ user
]

{ #category : #accessing }
CuooraHomeComponent >> user: unUser [
	user := unUser
]
