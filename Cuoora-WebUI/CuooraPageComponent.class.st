"
- Metacello new
-      baseline:'Bootstrap4';
-      repository: 'github://astares/Seaside-Bootstrap4:master/src';
-      load.
-
- cuoora := WAAdmin register: CuooraLoginComponent asApplicationAt: 'cuoora'.
- cuoora sessionClass: CuooraSession.
"
Class {
	#name : #CuooraPageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #actions }
CuooraPageComponent >> logueado [
	^ self user isNotNil.
	
]

{ #category : #model }
CuooraPageComponent >> model [ 
	^ Cuoora soleInstance
]

{ #category : #private }
CuooraPageComponent >> proceedWith: unObjeto [
	self subclassResponsibility. 
]

{ #category : #rendering }
CuooraPageComponent >> renderContentOn: html [
	html container
		class: 'fill';
		with: [ html jumbotron
				class: 'page-bg';
				with: [ self renderContentPageOn: html ] ]
]

{ #category : #rendering }
CuooraPageComponent >> renderContentPageOn: html [
	self subclassResponsibility. 
]

{ #category : #rendering }
CuooraPageComponent >> rendererClass [
	
	^ SBSHtmlCanvas 
]

{ #category : #style }
CuooraPageComponent >> style [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Quicksand&display=swap");
	
html, body {
	height: 100%;
	width:100%
}

.fill { 
	padding-top: 100px;
	min-height: 100%;
	height: 100%;
	width:100%;
	min-width: 100%;
	background: url("https://source.unsplash.com/random/1920x1080");
	background-size:cover;
	box-shadow:inset 0 0 0 2000px rgba(0, 0, 0, 0.5);
}	
	
.page-bg { 
	background-color: rgba(0,0,0,0.5);
	max-width: 80%;
	margin-left: 10%;
	color: white;
	text-align: center;
 }

.page-bg h1, h2, h3, h4, h5, h6{
	font-family: "Quicksand", sans-serif;
}

.page-bg hr{
	background-color: white;
 }

 .login-input{
	max-width: 400px;
	margin: auto;
}

.home-list{
	
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

{ #category : #'as yet unclassified' }
CuooraPageComponent >> verPregunta: unaPregunta [
	self call: (CuooraVerPreguntaComponent pregunta: unaPregunta).
]
