Class {
	#name : #CuooraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
CuooraTest >> setUp [
|usuarios topicos user1 user2 user3 topic1 topic2 topic3|
 super setUp.
	usuarios := Set new.
	topicos := Set new.
	user1 := Usuario conNombre: 'user1' Password: 'pass1'.
	user2 := Usuario conNombre: 'user2' Password: 'pass2'.
	user3 := Usuario conNombre: 'user3' Password: 'pass3'.
	topic1 := Topico conNombre: 'topico1' Descripcion: 'descripcion topico 1'.
	topic2 := Topico conNombre: 'topico2' Descripcion: 'descripcion topico 2'.
	topic3 := Topico conNombre: 'topico3' Descripcion: 'descripcion topico 3'.
	usuarios addAll:(OrderedCollection with: user1 with: user2 with: user3).
   	topicos addAll:(OrderedCollection with: topic1 with: topic2 with: topic3).
	 cuoora := Cuoora conUsuarios: usuarios Topicos: topicos.
]

{ #category : #tests }
CuooraTest >> testAgregarTopico [
	| topico |
	topico := Topico
		conNombre: 'topico 4'
		Descripcion: 'descripcion topico 4'.
	cuoora agregarTopico: topico.
	self assert: cuoora topicos size equals: 4
]

{ #category : #tests }
CuooraTest >> testAgregarUsuario [
	| usuario |
	usuario := Usuario conNombre: 'user 4' Password: 'pass 4'.
	cuoora agregarUsuario: usuario.
	self assert: cuoora usuariosCreados size equals: 4
]

{ #category : #tests }
CuooraTest >> testConUsuariosTopicos [
	self assert: cuoora usuariosCreados size equals: 3.
	self assert: cuoora topicos size equals: 3
]

{ #category : #tests }
CuooraTest >> testExisteTopico [
|topico4|
topico4 := Topico conNombre: 'topico 4' Descripcion: 'pass4'.
cuoora agregarTopico: topico4.
self assert: (cuoora existeTopico: 'topico 4') equals: topico4.
self assert: (cuoora existeTopico: 'topico4') equals: nil.
]

{ #category : #tests }
CuooraTest >> testExisteUsuario [
|usuario4|
usuario4 := Usuario conNombre: 'usuario 4' Password: 'pass4'.
cuoora agregarUsuario: usuario4.
self assert: (cuoora existeUsuario: 'usuario 4') equals: usuario4.
self assert: (cuoora existeUsuario: 'usuario4') equals: nil.
]

{ #category : #tests }
CuooraTest >> testGetPreguntasDeTopico [
	|pregunta topico4 topico5 usuario|
	usuario := Usuario conNombre: 'usuario 4' Password: 'pass 4'.
	pregunta := Pregunta
		conTitulo: '¿Para qué sirve el método SetUp?'
		Descripcion: 'Lorem ipsum dolor sit amet.'.
	topico4 := Topico conNombre: 'topico 4' Descripcion: 'Descripcion 4'.
	topico5 := Topico conNombre: 'topico 5' Descripcion: 'Descripcion 5'.
	pregunta agregarTopico: topico4.
	usuario agregarPregunta: pregunta.
	cuoora agregarUsuario: usuario.
	self assert: (cuoora getPreguntasDeTopico: topico4) size equals:1.
	self assert: (cuoora getPreguntasDeTopico: topico5) size equals:0.
]

{ #category : #tests }
CuooraTest >> testGetPreguntasDeTopicos [
	|pregunta pregunta2 topico4 topico5 topicos usuario|
	usuario := Usuario conNombre: 'usuario 4' Password: 'pass 4'.
	pregunta := Pregunta
		conTitulo: '¿Para qué sirve el método SetUp?'
		Descripcion: 'Lorem ipsum dolor sit amet.'.
	pregunta2 := Pregunta
		conTitulo: '¿Para qué sirve el método SetUp2?'
		Descripcion: 'Lorem ipsum dolor sit amet.'.
	topico4 := Topico conNombre: 'topico 4' Descripcion: 'Descripcion 4'.
	topico5 := Topico conNombre: 'topico 5' Descripcion: 'Descripcion 5'.
	pregunta agregarTopico: topico4.
	pregunta2 agregarTopico: topico4.
	pregunta agregarTopico: topico5.
	topicos := Set with: topico4 with: topico5.
	usuario agregarPregunta: pregunta.
	usuario agregarPregunta: pregunta2.
	cuoora agregarUsuario: usuario.
	self assert: (cuoora getPreguntasDeTopicos: topicos) size equals:2.
	topicos remove:topico4.
	self assert: (cuoora getPreguntasDeTopicos: topicos) size equals:1.
]

{ #category : #tests }
CuooraTest >> testGetRespuestasDeUnUsuario [
	|pregunta pregunta2 rta1 rta2 rta3 rta4 user1 user2|	
	user1 := Usuario conNombre: 'usuario1' Password: 'password1'.
	user2 := Usuario conNombre: 'usuario2' Password: 'password2'.
	pregunta := Pregunta
		conTitulo: '¿Para qué sirve el método SetUp?'
		Descripcion: 'Lorem ipsum dolor sit amet.'.
	pregunta2 := Pregunta
		conTitulo: '¿Para qué sirve el método SetUp2?'
		Descripcion: 'Lorem ipsum dolor sit amet.'.
	rta1 := Respuesta conTexto: 'Respuesta 1' Usuario: user1.
	rta2 := Respuesta conTexto: 'Respuesta 2' Usuario: user1.
	rta3 := Respuesta conTexto: 'Respuesta 3' Usuario: user2.
	rta4 := Respuesta conTexto: 'Respuesta 4' Usuario: user1.
	user1 agregarPregunta: pregunta.
	user2 agregarPregunta: pregunta2.
	pregunta agregarRespuesta: rta1.
	pregunta agregarRespuesta: rta2.
	pregunta2 agregarRespuesta: rta3.
	pregunta2 agregarRespuesta: rta4.
	cuoora agregarUsuario: user1.
	cuoora agregarUsuario: user2.
	self assert: (cuoora getRespuestasDeUnUsuario: user1) size equals:3.
	self assert: (cuoora getRespuestasDeUnUsuario: user2) size equals:1.
	pregunta2 respuestas remove:rta3.
	self assert: (cuoora getRespuestasDeUnUsuario: user2) size equals:0.
]

{ #category : #tests }
CuooraTest >> testLoginUsuarioPassword [
self assert: (cuoora loginUser: 'user1' password: 'pass1') user equals:'user1'.
self assert: (cuoora loginUser: 'user 1' password: 'pass1') equals:nil.
self assert: (cuoora loginUser: 'user2' password: 'pass2') user equals:'user2'.
self assert: (cuoora loginUser: 'user 2' password: 'pass2') equals:nil.
]
