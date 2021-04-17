Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'usuario',
		'usuario2',
		'usuario3'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	super setUp.
	pregunta := Pregunta new.	
	usuario := Usuario conNombre: 'pepe' Password: '123'.
	usuario2 := Usuario conNombre: 'pepe2' Password: '123'.
	usuario3 := Usuario conNombre: 'pepe3' Password: '123'.
]

{ #category : #tests }
PreguntaTest >> testAgregarRespuesta [
	| respuesta|
	respuesta := Respuesta conTexto: 'Respuesta 4' Usuario: (Usuario conNombre: 'pepe' Password: '123').
	self assert: pregunta respuestas size equals: 0.
	pregunta agregarRespuesta: respuesta.
	self assert: pregunta respuestas size equals: 1.
]

{ #category : #tests }
PreguntaTest >> testAgregarTopico [
	| topico |
	topico := Topico
		conNombre: 'topico 4'
		Descripcion: 'descripcion topico 4'.
	pregunta agregarTopico: topico.
	self assert: pregunta topicos size equals: 1.
]

{ #category : #tests }
PreguntaTest >> testAgregarTopicos [
	| topico topico1|
	topico := Topico
		conNombre: 'topico4'
		Descripcion: 'descripcion topico 4'.
		topico1 := Topico
		conNombre: 'topico5'
		Descripcion: 'descripcion topico 5'.
	self assert: pregunta topicos size equals: 0.
	pregunta agregarTopicos: topico nombre,',',topico1 nombre.
	self assert: pregunta topicos size equals: 2.
]

{ #category : #tests }
PreguntaTest >> testCalcularPuntaje [

	pregunta dislikeUsuario: usuario.
	pregunta dislikeUsuario: usuario2.
	pregunta likeUsuario: usuario3.
	
	self assert: pregunta calcularPuntaje equals: 20-2+1 "20 - dislikes + likes"
]

{ #category : #tests }
PreguntaTest >> testConTituloDescripcionUsuario [
	
	| preg user|
	user := Usuario conNombre: 'USUARIO NUEVO' Password: '1234'.
	preg := Pregunta conTitulo: 'pregunta testing' Descripcion: 'esto es una descripcion!' Usuario:user.
	 
	self assert: preg titulo equals: 'pregunta testing'.
	self assert: preg descripcion equals: 'esto es una descripcion!'.
]

{ #category : #tests }
PreguntaTest >> testConTituloDescripcionUsuarioTopicos [
	| preg user topico topico1|
	user := Usuario conNombre: 'USUARIO NUEVO' Password: '1234'.
	topico := Topico
		conNombre: 'topico4'
		Descripcion: 'descripcion topico 4'.
		topico1 := Topico
		conNombre: 'topico5'
		Descripcion: 'descripcion topico 5'.
	 preg := Pregunta conTitulo: 'pregunta testing' Descripcion: 'esto es una descripcion!' Usuario:user Topicos: topico nombre,',',topico1 nombre.
	self assert: preg titulo equals: 'pregunta testing'.
	self assert: preg descripcion equals: 'esto es una descripcion!'.
]

{ #category : #tests }
PreguntaTest >> testDisLikes [

	pregunta dislikeUsuario: usuario.
	pregunta dislikeUsuario: usuario.
	self assert: pregunta totalDislikes equals: '1'.
	
	pregunta dislikeUsuario: usuario2.
	self assert: pregunta totalDislikes equals: '2'.
	
	pregunta likeUsuario: usuario2.
	self assert: pregunta totalDislikes equals: '1'.
]

{ #category : #tests }
PreguntaTest >> testLikes [

	pregunta likeUsuario: usuario.
	pregunta likeUsuario: usuario.
	self assert: pregunta totalLikes equals: '1'.
	
	pregunta dislikeUsuario: usuario.
	self assert: pregunta totalLikes equals: '0'.
	
	pregunta likeUsuario: usuario.
	pregunta likeUsuario: usuario2.
	
	self assert: pregunta totalLikes equals: '2'.
]

{ #category : #tests }
PreguntaTest >> testRespuestasOrdenadas [
| respuesta respuesta1 respuesta2|
	respuesta := Respuesta conTexto: 'Respuesta 1' Usuario: (Usuario conNombre: 'pepe' Password: '123').
	respuesta1 := Respuesta conTexto: 'Respuesta 2' Usuario: (Usuario conNombre: 'pepe5' Password: '123').
	respuesta2 := Respuesta conTexto: 'Respuesta 3' Usuario: (Usuario conNombre: 'pepe6' Password: '123').
	pregunta agregarRespuesta: respuesta.
	pregunta agregarRespuesta: respuesta1.
	pregunta agregarRespuesta: respuesta2.
	respuesta likeUsuario: (Usuario conNombre: 'pepe' Password: '123').
	respuesta likeUsuario: (Usuario conNombre: 'pepe1' Password: '123').
	respuesta1 likeUsuario: (Usuario conNombre: 'pepe' Password: '123').
	respuesta1 likeUsuario: (Usuario conNombre: 'pepe1' Password: '123').
	respuesta1 dislikeUsuario: (Usuario conNombre: 'pepe2' Password: '123').
	respuesta2 likeUsuario: (Usuario conNombre: 'pepe' Password: '123').
	respuesta2 likeUsuario: (Usuario conNombre: 'pepe1' Password: '123').
	respuesta2 likeUsuario: (Usuario conNombre: 'pepe2' Password: '123').
	self assert: ((((pregunta respuestasOrdenadas) at:1) usuario user)) equals: 'pepe6'.
]
