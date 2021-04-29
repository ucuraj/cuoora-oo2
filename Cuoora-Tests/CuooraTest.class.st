Class {
	#name : #CuooraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'topico4',
		'topico5',
		'topic1',
		'topic2',
		'topic3',
		'user1',
		'user2',
		'user3'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
CuooraTest >> setUp [
|usuarios topicos rta1 rta2 rta3 rta4 rta5 pregunta pregunta2 |
 super setUp.
	usuarios := Set new.
	topicos := Set new.
	user1 := Usuario conNombre: 'user1' Password: 'pass1'.
	user2 := Usuario conNombre: 'user2' Password: 'pass2'.
	user3 := Usuario conNombre: 'user3' Password: 'pass3'.
	topic1 := Topico conNombre: 'topico1' Descripcion: 'descripcion topico 1'.
	topic2 := Topico conNombre: 'topico2' Descripcion: 'descripcion topico 2'.
	topic3 := Topico conNombre: 'topico3' Descripcion: 'descripcion topico 3'.
	topico4 := Topico conNombre: 'topico 4' Descripcion: 'Descripcion 4'.
	topico5 := Topico conNombre: 'topico 5' Descripcion: 'Descripcion 5'.
	rta1 := Respuesta conTexto: 'Respuesta 1' Usuario: user1.
	rta2 := Respuesta conTexto: 'Respuesta 2' Usuario: user1.
	rta3 := Respuesta conTexto: 'Respuesta 3' Usuario: user2.
	rta4 := Respuesta conTexto: 'Respuesta 4' Usuario: user1.
	rta5 := Respuesta conTexto: 'Respuesta 5' Usuario: user2.
		pregunta := Pregunta
		conTitulo: '¿Para qué sirve el método SetUp?'
		Descripcion: 'Lorem ipsum dolor sit amet.'
		Usuario: user1.
	pregunta2 := Pregunta
		conTitulo: '¿Para qué sirve el método SetUp2?'
		Descripcion: 'Lorem ipsum dolor sit amet.'
		Usuario: user2.
	pregunta agregarTopico: topico4.
	pregunta2 agregarTopico: topico4.
	pregunta agregarTopico: topico5.
	pregunta agregarRespuesta: rta1.
	pregunta agregarRespuesta: rta2.
	pregunta2 agregarRespuesta: rta3.
	pregunta agregarRespuesta: rta4.
	pregunta2 agregarRespuesta: rta5.
	user1 agregarPregunta: pregunta.
	user2 agregarPregunta: pregunta2.
	usuarios addAll:(OrderedCollection with: user1 with: user2 with: user3).
   	topicos addAll:(OrderedCollection with: topic1 with: topic2 with: topic3 with: topico4 with: topico5).
	cuoora := Cuoora soleInstance.
	cuoora usuariosCreados: usuarios.
	cuoora topicos: topicos.
]

{ #category : #tests }
CuooraTest >> testAgregarTopico [
	| topico |
	topico := Topico
		conNombre: 'topico 4'
		Descripcion: 'descripcion topico 4'.
	cuoora agregarTopico: topico.
	self assert: cuoora topicos size equals: 5.
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
	self assert: cuoora topicos size equals: 5
]

{ #category : #tests }
CuooraTest >> testExisteTopico [
	| atopico40 |
	atopico40 := Topico conNombre: 'topico 40' Descripcion: 'pass4'.
	cuoora agregarTopico: atopico40.
	self assert: (cuoora existeTopico: 'topico 40') equals: atopico40.
	self assert: (cuoora existeTopico: 'topico4123') equals: nil
]

{ #category : #tests }
CuooraTest >> testExisteUsuario [
self assert: (cuoora existeUsuario: 'user1') user equals: 'user1'.
self assert: (cuoora existeUsuario: 'usuario4') equals: nil.
]

{ #category : #tests }
CuooraTest >> testGetPreguntasDeTopico [
	self assert: (cuoora getPreguntasDeTopico: topico4) size equals:2.
	self assert: (cuoora getPreguntasDeTopico: topico5) size equals:1.
	self assert: (cuoora getPreguntasDeTopico: topic3) size equals:0.

]

{ #category : #tests }
CuooraTest >> testGetPreguntasDeTopicos [
|topicos|
topicos :=(Set with:topico4 with:topico5).
	self assert: (cuoora getPreguntasDeTopicos: topicos) size equals:2.
	topicos remove:topico4.
	self assert: (cuoora getPreguntasDeTopicos: topicos) size equals:1.
]

{ #category : #tests }
CuooraTest >> testGetRespuestasDeUnUsuario [	
	cuoora agregarUsuario: user1.
	cuoora agregarUsuario: user2.
	self assert: (cuoora getRespuestasDeUnUsuario: user1) size equals:3.
	self assert: (cuoora getRespuestasDeUnUsuario: user2) size equals:2.
	self assert: (cuoora getRespuestasDeUnUsuario: user3) size equals:0.
]

{ #category : #tests }
CuooraTest >> testLoginUsuarioPassword [
self assert: (cuoora loginUser: 'user1' password: 'pass1') user equals:'user1'.
self assert: (cuoora loginUser: 'user 1' password: 'pass1') equals:nil.
self assert: (cuoora loginUser: 'user2' password: 'pass2') user equals:'user2'.
self assert: (cuoora loginUser: 'user 2' password: 'pass2') equals:nil.
]
