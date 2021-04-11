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
CuooraPageComponent >> proceedWithHome: unUsuario [
	self session user: unUsuario.
	self call: CuooraHomeComponent new.
]

{ #category : #rendering }
CuooraPageComponent >> renderContentOn: html [
	(self session user) isNotNil 
	ifTrue:[self renderNavBarOn:html.]. 
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
CuooraPageComponent >> renderNavBarDropdownUserOn: html [
	html navigationItem dropdown
		with: [ html navigationLink
				dropdownToggle;
				dataToggle: 'dropdown';
				with: [ html span class: 'bi bi-person-circle nav-user mr-2'.
					html span with: 'pepe' ].
			html dropdownMenu
				attributeAt: 'aria-labelledby' put: 'navbarDropdown';
				with: [ html dropdownItem: self session user user.
					html dropdownDivider.
					html dropdownItem
						callback: [ self call: CuooraLoginComponent logout ];
						with: [ html span: 'Cerrar Sesión' ] ] ]
]

{ #category : #rendering }
CuooraPageComponent >> renderNavBarLinksOn: html [
	html navigationLink
		callback: [ self proceedWithHome: self session user ];
		with: 'Home'.
	html navigationLink
		url: '';
		with: 'Agregar Pregunta'.
	html navigationLink
		url: '';
		with: 'Buscar Usuario'.
	html navigationLink
		url: '';
		with: 'Agregar Topico'.
	self renderNavBarDropdownUserOn: html.

]

{ #category : #rendering }
CuooraPageComponent >> renderNavBarOn: html [
	
	html navigationBar
		class: 'navbar-bg';
		beLight;
		expandLarge;
		with: [ html navigationBarBrand: 'CuOOra'.
			html navigationBarToggler
				beButtonType;
				collapse;
				dataTarget: '#navbarCollapsed';
				with: [ html navigationBarTogglerIcon ].
			html navigationBarCollapse collapse class:'justify-content-end pr-5 mr-5';
				id: 'navbarCollapsed';
				with: [ html
						navigationBarNavigation: [ html navigation
								with: [self renderNavBarLinksOn: html] ] ] ]
]

{ #category : #rendering }
CuooraPageComponent >> rendererClass [
	
	^ SBSHtmlCanvas 
]

{ #category : #style }
CuooraPageComponent >> style [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Quicksand&display=swap");
	
@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css");

html, body {
	height: 100%;
	width:100%
}

.fill { 
	padding-top: 100px;
	min-height: 100%;
	height: fit-content;
	width:100%;
	min-width: 100%;
	background: url("https://source.unsplash.com/random/1920x1080");
	background-size:cover;
	box-shadow:inset 0 0 0 2000px rgba(0, 0, 0, 0.5);
}	

.navbar {
	position: fixed;
   width: inherit;
}

.nav-user { 
	font-size: 18px;
}

.page-bg { 
	background-color: rgba(0,0,0,0.5);
	max-width: 80%;
	margin-left: 10%;
	color: white;
	text-align: center;
}

.informacion-pregunta{
	text-align:left
}

.respuesta-titulo{
	text-align:left
}

.respuesta-texto{
	text-align:left
}

.respuesta{
  border:2px solid grey;
  border-radius:15px;
  margin-left:15%;
  padding-left:1%;
  margin-bottom:3%;
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

.navbar-bg { 
    background-color: rgb(255,255,255,0.8) !important;
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
