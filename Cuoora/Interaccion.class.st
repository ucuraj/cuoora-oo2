"
""a""
"
Class {
	#name : #Interaccion,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'publicacion',
		'fecha'
	],
	#category : #Cuoora
}

{ #category : #accessing }
Interaccion >> fecha [
	^ fecha
]

{ #category : #accessing }
Interaccion >> fecha: anObject [
	fecha := anObject
]

{ #category : #accessing }
Interaccion >> publicacion [
	^ publicacion
]

{ #category : #accessing }
Interaccion >> publicacion: anObject [
	publicacion := anObject
]

{ #category : #accessing }
Interaccion >> usuario [
	^ usuario
]

{ #category : #accessing }
Interaccion >> usuario: anObject [
	usuario := anObject
]
