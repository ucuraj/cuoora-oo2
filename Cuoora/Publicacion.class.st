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

{ #category : #'instance creation' }
Publicacion class >> newPublicacion [
| publicacion |
publicacion := self new.
publicacion likes: Set new.
publicacion dislikes: Set new.
^publicacion
]

{ #category : #'as yet unclassified' }
Publicacion >> calcularPuntaje [
]

{ #category : #'as yet unclassified' }
Publicacion >> dislikeUsuario:unUsuario [
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

{ #category : #'as yet unclassified' }
Publicacion >> likeUsuario:unUsuario [
]

{ #category : #accessing }
Publicacion >> likes [
	^ likes
]

{ #category : #accessing }
Publicacion >> likes: anObject [
	likes := anObject
]

{ #category : #'as yet unclassified' }
Publicacion >> totalDislikes [
]

{ #category : #'as yet unclassified' }
Publicacion >> totalLikes [
]
