"
""a""
"
Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'fechaCreacion',
		'likes',
		'dislikes'
	],
	#category : #Cuoora
}

{ #category : #methods }
Publicacion >> buscarDislike: unUsername [
	"Busca dentro de los dislikes a unUsername."

	^ self dislikes
		detect: [ :interaccion | interaccion usuario user = unUsername ]
		ifNone: [ nil ]
]

{ #category : #methods }
Publicacion >> buscarLike: unUsername [
	"Busca dentro de los likes a unUsername."

	^ self likes
		detect: [ :interaccion | interaccion usuario user = unUsername ]
		ifNone: [ nil ]
]

{ #category : #methods }
Publicacion >> calcularPuntaje [ 
 	self subclassResponsibility.
]

{ #category : #methods }
Publicacion >> dislikeUsuario: unUsuario [
	"Busca primero si la publicacion tiene un like de unUsuario, si existe lo elimina.
	Chequea que no haya un dislike de unUsuario, si no existe lo agrega."

	| like dislike |
	like := self buscarLike: unUsuario user.
	like ifNotNil: [ self likes remove: like ].
	
	dislike := self buscarDislike: unUsuario user.
	dislike
		ifNil: [ self dislikes
				add: (Interaccion conUsuario: unUsuario Publicacion: self) ]
]

{ #category : #accessing }
Publicacion >> dislikes [
	^ dislikes
]

{ #category : #accessing }
Publicacion >> dislikes: anObject [
	dislikes := anObject
]

{ #category : #accessing }
Publicacion >> fechaCreacion [
	^ fechaCreacion
]

{ #category : #accessing }
Publicacion >> fechaCreacion: anObject [
	fechaCreacion := anObject
]

{ #category : #initialization }
Publicacion >> initialize [ 
	self likes: Set new.
	self dislikes: Set new.
	self fechaCreacion: DateAndTime now.

]

{ #category : #methods }
Publicacion >> likeUsuario: unUsuario [
	"Busca primero si la publicaciontiene un dislike de unUsuario, si existe lo elimina.
	Chequea que no haya un like de unUsuario, si no existe lo agrega."

	| dislike like |
	dislike := self buscarDislike: unUsuario user.
	dislike ifNotNil: [ self dislikes remove: dislike ].
	
	like := self buscarLike: unUsuario user.
	like
		ifNil: [ self likes
				add: (Interaccion conUsuario: unUsuario Publicacion: self) ]
]

{ #category : #accessing }
Publicacion >> likes [
	^ likes
]

{ #category : #accessing }
Publicacion >> likes: anObject [
	likes := anObject
]

{ #category : #methods }
Publicacion >> totalDislikes [
]

{ #category : #methods }
Publicacion >> totalLikes [
]
