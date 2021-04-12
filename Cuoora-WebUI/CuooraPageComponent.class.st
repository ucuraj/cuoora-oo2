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

{ #category : #private }
CuooraPageComponent >> callCrearPreguntaComponent [
	self call: CrearPreguntaComponent new.
]

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
	self session user isNotNil
		ifTrue: [ self renderNavBarOn: html ].
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
		callback: [ self callCrearPreguntaComponent ];
		with: 'Agregar Pregunta'.
	html navigationLink
		url: '';
		with: 'Buscar Usuario'.
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
			html navigationBarCollapse collapse
				class: 'justify-content-end pr-5 mr-5';
				id: 'navbarCollapsed';
				with: [ html
						navigationBarNavigation: [ html navigation with: [ self renderNavBarLinksOn: html ] ] ] ]
]

{ #category : #rendering }
CuooraPageComponent >> rendererClass [
	
	^ SBSHtmlCanvas 
]

{ #category : #style }
CuooraPageComponent >> style [
	^ '
/* imports */

@import url("https://fonts.googleapis.com/css2?family=Quicksand&display=swap");
  
@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css");

html, body {
  height: 100%;
  width:100%
}

/* template main */
.col-md-5{
  background-color:#00000073;
  border-radius:20px;
}

.col-md-5:hover{
  background-color:#000000ad;
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

/* .page-bg hr {
  border-width: 0 0 2px;
  color: white;
  border-image: linear-gradient(90deg, rgba(255, 255, 255, 0), white 50%, rgba(135, 206, 235, 0) 100%) 0 0 100%;
  border-style: solid;
 }
*/
#topicos{
 color:grey;
}
.page-bg hr {
  border-image: none;
  border-color: rgb(255,255,255,.3);
  color: white;
  border-width: 0 0 2px;
  border-style: solid;
}


.hr-fade { 
  height: 1px;
  color: white;
  background-image: linear-gradient(90deg, rgba(255, 0, 0, 0), white 50%, rgba(255, 0, 0, 0) 100%);
 }

.hr-dots {
  color: white !important;
  border-width: 0 0 10px !important;
  border-style: solid !important;
  border-image: url(''data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2 1" width="8" height="4"><circle fill="rgba(255,255,255,0.7)" cx="1" cy="0.5" r="0.5"/></svg>'') 0 0 100% repeat !important;
  width: 54px !important;
}

.hr-pregunta { 
  border-image: none !important;
  border-color: rgb(255,255,255,.3);
  max-width: 65%;
}

/* nav */

.navbar {
  position: fixed;
  width: inherit;
z-index: 100000;
}

.navbar-bg { 
  background-color: rgb(255,255,255,0.95) !important;
}

.nav-user { 
  font-size: 18px;
}


/* respuesta */

.respuesta-titulo{
  text-align:left;
  font-size: 16px;
}

.respuesta-texto{
  text-align:left;
  padding-left: 20px;
  font-size: 14px;
}

.respuesta{
  border:2px solid grey;
  border-radius:15px;
  margin: 1% 15% 3% 15%;  
  padding: 1%;
}

.respuesta-input {
  max-width: 650px;
  width: 100%;
  min-height: 150px;
  height: 100%;
  margin: auto;
}

/* pregunta */

.pregunta-anchor a{
  text-decoration: none; 
  color: white;
}

.pregunta-input{
  max-width: 650px;
  width: 100%;
  margin: auto;
}

.pregunta-input{
  max-width: 650px;
  margin: auto;
}

.pregunta-textinput{
  min-height: 400px;
  align-items: start !important;
}

.titulo-pregunta{
	font-size: 2rem !important;
	font-family: "Quicksand", sans-serif;
}

.titulo-pregunta a {
	color: inherit;
}

.descripcion-pregunta {
    padding-top: 20px; 
	font-size: 1.2rem !important;
}

/* login */

.login-input{
  max-width: 400px;
  margin: auto;
}

/* home */

.home-list { 
	font-size: 14px; 
}

.home-col {
	background: rgba(0,0,0,.7);
}

/* interaccion */

.texto-interaccion {
	font-size: 12px;
}

'
]

{ #category : #actions }
CuooraPageComponent >> updateRoot: anHtmlRoot title: aTitle [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: aTitle, ' | CuOOra'.
]

{ #category : #accessing }
CuooraPageComponent >> user [
	^ user
]

{ #category : #accessing }
CuooraPageComponent >> user: anUser [
	user := anUser.
]
