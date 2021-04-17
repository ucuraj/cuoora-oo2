Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'juan',
		'pedro',
		'topicoOO1',
		'topicoTU',
		'pregunta1',
		'pregunta2',
		'cuoora'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
UsuarioTest >> setUp [
	juan := Usuario conNombre: 'juan' Password: '1234'.
	pedro := Usuario conNombre: 'pedro' Password: '1234'.
	
	topicoOO1 := Topico
		conNombre: 'OO1'
		Descripcion: 'Topico de Orientación a Objetos 1'.
	topicoTU := Topico
		conNombre: 'Test de unidad'
		Descripcion: 'Topico de test de unidad'.
	
	pregunta1 := Pregunta
		conTitulo: 'Test'
		Descripcion: 'Testing'
		Usuario: pedro.
		
	pregunta2 := Pregunta
		conTitulo: 'Prueba'
		Descripcion: 'Esto es una prueba'
		Usuario: pedro.
	
	pregunta1 agregarTopico: topicoOO1.
	pregunta2 agregarTopico: topicoTU.
	
	pedro agregarPregunta: pregunta1.
	pedro agregarPregunta: pregunta2.
	
	cuoora := Cuoora new.
	
	cuoora agregarTopico: topicoOO1.
	cuoora agregarTopico: topicoTU.
	cuoora agregarUsuario: pedro.
	cuoora agregarUsuario: juan.
]

{ #category : #tests }
UsuarioTest >> testAgregarPregunta [
	
	self deny: pedro preguntas isEmpty.
	self assert: juan preguntas isEmpty.
	self assert: pedro preguntas size equals: 2.
	
	pedro agregarPregunta: (Pregunta conTitulo: 'pregunta nueva1' Descripcion: 'descripcion' Usuario:pedro).
	pedro agregarPregunta: (Pregunta conTitulo: 'pregunta nueva2' Descripcion: 'descripcion' Usuario:pedro).
	juan agregarPregunta: (Pregunta conTitulo: 'pregunta nueva3' Descripcion: 'descripcion' Usuario:juan).
	
	self assert: pedro preguntas size equals: 4.
	self assert:  juan preguntas size equals: 1.
]

{ #category : #tests }
UsuarioTest >> testBorrarPregunta [
	
	self deny: pedro preguntas isEmpty.
	self assert: juan preguntas isEmpty.
	self assert: pedro preguntas size equals: 2.
	
	pedro borrarPregunta: pregunta1.
	self assert: pedro preguntas size equals: 1.
	pedro borrarPregunta: pregunta2.
	self assert: pedro preguntas isEmpty.
	
	juan borrarPregunta: pregunta1.
	self assert: juan preguntas isEmpty.
]

{ #category : #tests }
UsuarioTest >> testBuscarPregunta [
	
	self assert: (pedro buscarPregunta: pregunta1 titulo) equals: pregunta1.
	self assert: (pedro buscarPregunta: pregunta2 titulo) equals: pregunta2.
	self assert: (juan buscarPregunta: pregunta1 titulo) equals: nil.
]

{ #category : #tests }
UsuarioTest >> testCalcularPuntaje [ 
	
	
	self assert: juan calcularPuntaje equals: 0.
	self assert: pedro calcularPuntaje equals: 40.
	
	pregunta2 likeUsuario: juan.
	self assert: pedro calcularPuntaje equals: 41.
	
	pedro borrarPregunta: pregunta1.
	self assert: pedro calcularPuntaje equals: 21.
	
	pregunta1 dislikeUsuario: juan.
	pregunta2 dislikeUsuario: juan.
	self assert: pedro calcularPuntaje equals: 19.
]

{ #category : #tests }
UsuarioTest >> testConNombrePassword [

	| jorge |
	jorge := Usuario conNombre: 'jorge' Password: '1234'.
	self assert: jorge user equals: 'jorge'.
	self assert: jorge pass equals: '1234'
]

{ #category : #tests }
UsuarioTest >> testDejarDeSeguirUsuario [
	
	self assert: pedro seguidos isEmpty.
	self assert: juan seguidos isEmpty.
	
	pedro seguirUsuario: juan.
	juan seguirUsuario: pedro.
	self assert: juan seguidos size equals: 1.
	self assert: juan seguidos size equals: 1.
	
	pedro dejarDeSeguirUsuario: juan.
	self assert: pedro seguidos size equals: 0.
	
	juan dejarDeSeguirUsuario: pedro.
	self assert: juan seguidos size equals: 0.
	
]

{ #category : #tests }
UsuarioTest >> testGetPreguntasInteres [
	
	self assert: juan preguntasInteres isEmpty.
	self assert: pedro preguntasInteres isEmpty.
	
	juan seguirUsuario: pedro.
	self assert: juan topicosInteres size equals: 0.
	self assert: (juan getPreguntasInteres:1 ) size equals: 1.
	self assert: (juan getPreguntasInteres:2 ) size equals: 2.
	self assert: (juan getPreguntasInteres:5 ) size equals: 2.	
	self assert: (juan getPreguntasInteres:0 ) isEmpty	
]

{ #category : #tests }
UsuarioTest >> testInitialize [

	| jorge |
	jorge := Usuario conNombre: 'jorge' Password: '1234'.
	self assert: jorge user equals: 'jorge'.
	self assert: jorge pass equals: '1234'.
	self assert: jorge calcularPuntaje equals: 0.
	self assert: jorge seguidos isEmpty.
	self assert: jorge topicosInteres isEmpty.
	self assert: jorge preguntas isEmpty
]

{ #category : #tests }
UsuarioTest >> testPreguntasInteres [
	
	self assert: juan preguntasInteres isEmpty.
	self assert: pedro preguntasInteres isEmpty.
	
	juan seguirUsuario: pedro.
	self assert: juan topicosInteres size equals: 0.
	self assert: juan preguntasInteres size equals: 2
	

]

{ #category : #tests }
UsuarioTest >> testRegistrarTopicoInteres [
	
	self assert: juan topicosInteres isEmpty.
	
	juan registrarTopicoInteres: topicoOO1.
	self assert: juan topicosInteres size equals: 1.
	
	juan registrarTopicoInteres: topicoOO1.
	self assert: juan topicosInteres size equals: 1.
	
	juan registrarTopicoInteres: topicoTU.
	self deny: juan topicosInteres size equals: 1.
	self assert: juan topicosInteres size equals: 2.
	

]

{ #category : #tests }
UsuarioTest >> testSeguirUsuario [
	
	self assert: pedro seguidos isEmpty.
	self assert: juan seguidos isEmpty.
	
	pedro seguirUsuario: juan.
	juan seguirUsuario: pedro.
	self assert: pedro seguidos size equals: 1.
	self assert: juan seguidos size equals: 1.
	
	pedro seguirUsuario: pedro.
	juan seguirUsuario: juan.
	self assert: pedro seguidos size equals: 1.
	self assert: juan seguidos size equals: 1.
	
	self assert: (pedro seguirUsuario: pedro) equals: false.
	self assert: (juan seguirUsuario: juan) equals: false.
]

{ #category : #tests }
UsuarioTest >> testSigueA [
	
	self assert: pedro seguidos isEmpty.
	self assert: juan seguidos isEmpty.
	
	pedro seguirUsuario: juan.
	juan seguirUsuario: pedro.
	
	self assert: (pedro sigueA: juan) equals: true.
	self assert: (juan sigueA: pedro) equals: true.
	
	pedro dejarDeSeguirUsuario: juan.
   self assert: (pedro sigueA: juan) equals: false. 
]
