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
