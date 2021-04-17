Class {
	#name : #PublicacionTest,
	#superclass : #TestCase,
	#instVars : [
		'publicacion',
		'publicacion2',
		'usuario',
		'usuario2',
		'usuario3'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
PublicacionTest >> setUp [
	super setUp.
	publicacion := Publicacion new.	
	usuario := Usuario conNombre: 'pepe' Password: '123'.
	usuario2 := Usuario conNombre: 'pepe2' Password: '123'.
	usuario3 := Usuario conNombre: 'pepe3' Password: '123'.
	publicacion2 := Publicacion new.
	
]

{ #category : #tests }
PublicacionTest >> testBuscarDislike [

	publicacion dislikeUsuario: usuario.
	
	self assert: (publicacion buscarDislike: usuario user) usuario user equals: usuario user. 
	self deny: (publicacion buscarDislike: usuario2 user) equals: usuario2 user. 
]

{ #category : #tests }
PublicacionTest >> testBuscarLike [

	publicacion likeUsuario: usuario.
	
	self assert: (publicacion buscarLike: usuario user) usuario user equals: usuario user. 
	self deny: (publicacion buscarLike: usuario2 user) equals: usuario2 user. 
]

{ #category : #tests }
PublicacionTest >> testDislikeUsuario [

	publicacion dislikeUsuario: usuario.
	publicacion dislikeUsuario: usuario2.
	
	self assert: (publicacion buscarDislike: usuario user) usuario user equals: usuario user. 
	self assert: publicacion dislikes size equals: 2. 
	self deny: publicacion dislikes size equals: 3 
]

{ #category : #tests }
PublicacionTest >> testLikeUsuario [

	publicacion likeUsuario: usuario.
	publicacion likeUsuario: usuario2.
	
	self assert: (publicacion buscarLike: usuario user) usuario user equals: usuario user. 
	self assert: publicacion likes size equals: 2. 
	self deny: publicacion likes size equals: 3 
]

{ #category : #tests }
PublicacionTest >> testTotalDislikes [

	publicacion dislikeUsuario: usuario.
	publicacion dislikeUsuario: usuario2.
	
	self assert: publicacion totalDislikes equals: '2'.
	self deny: publicacion totalDislikes equals: 2.
	self deny: publicacion totalDislikes equals: '3'. 

]

{ #category : #tests }
PublicacionTest >> testTotalLikes [

	publicacion likeUsuario: usuario.
	publicacion likeUsuario: usuario2.
	
	self assert: publicacion totalLikes equals: '2'.
	self deny: publicacion totalLikes equals: 2.
	self deny: publicacion totalLikes equals: '3'. 

]
