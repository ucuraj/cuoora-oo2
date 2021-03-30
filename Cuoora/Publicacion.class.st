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

{ #category : #accessing }
Publicacion >> likes [
	^ likes
]

{ #category : #accessing }
Publicacion >> likes: anObject [
	likes := anObject
]
