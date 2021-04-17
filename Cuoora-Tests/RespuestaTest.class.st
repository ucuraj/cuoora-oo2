Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'respuesta',
		'usuario',
		'usuario2',
		'usuario3'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
RespuestaTest >> setUp [
	super setUp.
	respuesta := Respuesta new.	
	usuario := Usuario conNombre: 'pepe' Password: '123'.
	usuario2 := Usuario conNombre: 'pepe2' Password: '123'.
	usuario3 := Usuario conNombre: 'pepe3' Password: '123'.
]

{ #category : #tests }
RespuestaTest >> testCalcularPuntaje [
	
	respuesta dislikeUsuario: usuario.
	respuesta dislikeUsuario: usuario2.
	respuesta likeUsuario: usuario3.
	
	self assert: respuesta calcularPuntaje equals: 50-2+1 "20 - dislikes + likes"
]

{ #category : #tests }
RespuestaTest >> testConTextoUsuario [
	| r |
	r := Respuesta conTexto: 'Probando la respuestilla' Usuario: usuario.
	self assert: r usuario user equals: usuario user.
	self assert: r texto equals: 'Probando la respuestilla'
]

{ #category : #tests }
RespuestaTest >> testDisLikes [

	respuesta dislikeUsuario: usuario.
	respuesta dislikeUsuario: usuario.
	self assert: respuesta totalDislikes equals: '1'.
	
	respuesta dislikeUsuario: usuario2.
	self assert: respuesta totalDislikes equals: '2'.
	
	respuesta likeUsuario: usuario2.
	self assert: respuesta totalDislikes equals: '1'.
]

{ #category : #tests }
RespuestaTest >> testLikes [
	respuesta likeUsuario: usuario.
	respuesta likeUsuario: usuario.
	self assert: respuesta totalLikes equals: '1'.
	
	respuesta dislikeUsuario: usuario.
	self assert: respuesta totalLikes equals: '0'.
	
	respuesta likeUsuario: usuario.
	respuesta likeUsuario: usuario2.
	
	self assert: respuesta totalLikes equals: '2'.
]
