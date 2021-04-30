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
	#name : #Cuoora,
	#superclass : #Object,
	#instVars : [
		'usuariosCreados',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Cuoora-Model-Cuoora-Components'
}

{ #category : #'instance creation' }
Cuoora class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'instance creation' }
Cuoora class >> conUsuarios: usuarios Topicos: topicos [
	^self soleInstance; conUsuarios: usuarios Topicos: topicos
]

{ #category : #'instance creation' }
Cuoora class >> initialData [
   "Instancia un objeto Cuoora con datos por defecto"
 
	^self new initialData
]

{ #category : #'instance creation' }
Cuoora class >> soleInstance [
	"^ soleInstance ifNil: [ soleInstance := self new ]"
	
	^ soleInstance ifNil: [ soleInstance := self initialData ]
]

{ #category : #methods }
Cuoora >> agregarTopico: unTopico [
	"Agrega un topico al set topicos, 
	Chequea que el nombre del topico 
	no existe en el sistema"

	(self existeTopico: unTopico nombre)
		ifNil: [ self topicos add: unTopico ]
]

{ #category : #methods }
Cuoora >> agregarUsuario: unUsuario [
	"Agrega un usuario al set 
	usuariosCreados. Chequea que el 
	nombre de usuario no exista."

	(self existeUsuario: unUsuario user)
		ifNil: [ self usuariosCreados add: unUsuario ]
]

{ #category : #'instance creation' }
Cuoora >> conUsuarios: unosUsuarios Topicos: unosTopicos [
	self usuariosCreados: unosUsuarios.
	self topicos: unosTopicos
]

{ #category : #methods }
Cuoora >> existeTopico: unNombre [
	"Busca un topico por nombre. Si existe 
	devuelve un objeto Topico sino nil"
	
	^ self topicos
		detect: [ :each | each nombre = unNombre ]
		ifNone: [ nil ]
]

{ #category : #methods }
Cuoora >> existeUsuario: unUsername [
	"Busca un usuario por nombre de usuario. 
	Si existe devuelve el objeto usuario, sino nil."
	
	^ self usuariosCreados
		detect: [ :each | each user = unUsername ]
		ifNone: [ nil ]
]

{ #category : #methods }
Cuoora >> getPreguntasDeTopico: unTopico [
	"Recorre todos los usuarios y obtiene las preguntas 
	cuyo topico sea unTopico. Devuelve a un set de preguntas"
	
	^ (self usuariosCreados
		flatCollect: [ :usuario |
					usuario preguntas
						select:
							[ :pregunta | pregunta topicos anySatisfy: [ :topico | topico = unTopico ] ] ])
]

{ #category : #methods }
Cuoora >> getPreguntasDeTopicos: unosTopicos [
	^ (unosTopicos
		collectAll: [ :topico | self getPreguntasDeTopico: topico ]) asSet.
]

{ #category : #methods }
Cuoora >> getRespuestasDeUnUsuario: unUsuario [
	"Recorre usuariosCreados. Por cada usuario 
	recorre sus preguntas, y a su vez las respuestas 
	de cada pregunta,  agregando a un conjunto las 
	preguntas que  hayan sido creadas por unUsuario "
	
	^ self usuariosCreados
		flatCollect: [ :usuario | 
			(usuario preguntas)
				flatCollect: [ :eachPregunta | 
							eachPregunta respuestas
								select: [ :each | each usuario user = unUsuario user ] ] ].
]

{ #category : #'as yet unclassified' }
Cuoora >> getRespuestasParaPuntaje: unUsuario [
	"Recorre usuariosCreados. Por cada usuario 
	recorre sus preguntas, y a su vez las respuestas 
	de cada pregunta,  agregando a un conjunto las 
	preguntas que  hayan sido creadas por unUsuario "
	
	^ ((self usuariosCreados))
		flatCollect: [ :usuario | 
			(usuario preguntas)
				flatCollect: [ :eachPregunta | 
							eachPregunta respuestas
								select: [ :each | each usuario user = unUsuario user ] ] ].
]

{ #category : #initialization }
Cuoora >> initialData [
	"Carga datos de prueba a la instancia actual de cuoora"

	| juan diego pedro topicoOO1 topicoTU topicoST preguntaPedro preguntaDiego r1 r2 |
	pedro := Usuario
		conNombre: 'pedro@cuoora.com'
		Password: 'pedro@cuoora.com'.
	juan := Usuario
		conNombre: 'juan@cuoora.com'
		Password: 'juan@cuoora.com'.
	diego := Usuario
		conNombre: 'diego@cuoora.com'
		Password: 'diego@cuoora.com'.
	juan seguirUsuario: diego.
	pedro seguirUsuario: juan.
	preguntaPedro := Pregunta
		conTitulo: '¿Para qué sirve el método SetUp?'
		Descripcion:
			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget turpis fringilla metus dictum consequat. Quisque leo augue, suscipit in commodo vitae, viverra quis magna. Suspendisse ultrices lobortis metus, a ullamcorper dui mattis eget. Nulla ut erat at enim dictum laoreet sit amet ut lacus. Maecenas posuere, nisi nec faucibus aliquam, lorem ligula feugiat purus, et finibus ipsum tortor bibendum leo'
		Usuario: pedro.
	preguntaDiego := Pregunta
		conTitulo: '¿Qué significa #messageNotUnderstood?'
		Descripcion:
			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget turpis fringilla metus dictum consequat. Quisque leo augue, suscipit in commodo vitae, viverra quis magna. Suspendisse ultrices lobortis metus, a ullamcorper dui mattis eget. Nulla ut erat at enim dictum laoreet sit amet ut lacus. Maecenas posuere, nisi nec faucibus aliquam, lorem ligula feugiat purus, et finibus ipsum tortor bibendum leo'
		Usuario: diego.
	topicoOO1 := Topico conNombre: 'OO1' Descripcion: ''.
	topicoTU := Topico conNombre: 'Test de unidad' Descripcion: ''.
	topicoST := Topico conNombre: 'Smalltalk' Descripcion: ''.
	preguntaPedro
		agregarTopico: topicoOO1;
		agregarTopico: topicoTU.
	preguntaDiego
		agregarTopico: topicoOO1;
		agregarTopico: topicoST.
	r1 := Respuesta
		conTexto:
			'Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test.'
		Usuario: diego.
	r2 := Respuesta
		conTexto:
			'Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta'
		Usuario: pedro.
	preguntaPedro agregarRespuesta: r1.
	preguntaDiego agregarRespuesta: r2.
	pedro agregarPregunta: preguntaPedro.
	diego agregarPregunta: preguntaDiego.
	self
		agregarUsuario: pedro;
		agregarUsuario: diego;
		agregarUsuario: juan.
	self
		agregarTopico: topicoOO1;
		agregarTopico: topicoTU;
		agregarTopico: topicoST
]

{ #category : #initialization }
Cuoora >> initialize [
	self usuariosCreados: Set new.
	self topicos: Set new.
]

{ #category : #protocol }
Cuoora >> loginUser: unUser password: unaPass [

	^ self usuariosCreados
		detect:
			[ :eachUsuario | (eachUsuario checkUser:unUser unaPass:unaPass) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
Cuoora >> topicos [
	^ topicos
]

{ #category : #accessing }
Cuoora >> topicos: anObject [
	topicos := anObject
]

{ #category : #accessing }
Cuoora >> usuariosCreados [
	^ usuariosCreados
]

{ #category : #accessing }
Cuoora >> usuariosCreados: anObject [
	usuariosCreados := anObject
]
