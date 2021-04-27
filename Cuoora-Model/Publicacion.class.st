"
""a""
"
Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'fechaCreacion',
		'likes',
		'dislikes'
	],
	#category : #'Cuoora-Model-Cuoora-Components'
}

{ #category : #comparing }
Publicacion >> < unaPregunta [

	^ self fechaCreacion < unaPregunta fechaCreacion.
]

{ #category : #comparing }
Publicacion >> <= unaPregunta [

	^ self fechaCreacion <= unaPregunta fechaCreacion.
]

{ #category : #comparing }
Publicacion >> > unaPregunta [
	
	^ self fechaCreacion > unaPregunta fechaCreacion.
]

{ #category : #comparing }
Publicacion >> >= unaPregunta [
	
	^ self fechaCreacion >= unaPregunta fechaCreacion.
]

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

{ #category : #methods }
Publicacion >> formatearFecha [
	| f |
	f := self fechaCreacion.
	^ '{1} {2} de {3} del {4} a las {5}:{6}'
		format:
			{f dayOfWeekName asString.
			f dayOfMonth asString.
			f monthName asString.
			f year asString.
			(f hour24 < 10
				ifTrue: [ '0' , f hour24 asString ]
				ifFalse: [ f hour24 asString ]).
			(f minute < 10
				ifTrue: [ '0' , f minute asString ]
				ifFalse: [ f minute asString ])}
]

{ #category : #initialization }
Publicacion >> initialize [ 
	self likes: Set new.
	self dislikes: Set new.
	self fechaCreacion: DateAndTime now.

]

{ #category : #'as yet unclassified' }
Publicacion >> iteraccionConUsuario:unUsuario unTipo:unString [
	"Busca primero si la publicacion tiene un like de unUsuario, si existe lo elimina.
	Chequea que no haya un dislike de unUsuario, si no existe lo agrega."
	| like dislike |
	like := self buscarLike: unUsuario user.
	like ifNotNil: [ self likes remove: like ].
	dislike  := self buscarDislike: unUsuario user.
	dislike ifNotNil: [ self dislikes remove: dislike ].
	(unString = 'Like')
	ifTrue:[self likes
				add: (Interaccion conUsuario: unUsuario Publicacion: self)]
	ifFalse:[ self dislikes
				add: (Interaccion conUsuario: unUsuario Publicacion: self)].
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
	^ self dislikes size. 
]

{ #category : #methods }
Publicacion >> totalLikes [
	^ self likes size.
]

{ #category : #accessing }
Publicacion >> usuario [
	^ usuario
]

{ #category : #accessing }
Publicacion >> usuario: anObject [
	usuario := anObject
]
