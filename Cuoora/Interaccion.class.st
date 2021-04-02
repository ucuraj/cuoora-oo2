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

{ #category : #'instance creation' }
Interaccion class >> conUsuario: unUsuario Publicacion: unaPublicacion [
	^ self new conUsuario: unUsuario Publicacion: unaPublicacion
]

{ #category : #'instance creation' }
Interaccion >> conUsuario: unUsuario Publicacion: unaPublicacion [
	self usuario: unUsuario.
	self publicacion: unaPublicacion
]

{ #category : #accessing }
Interaccion >> fecha [
	^ fecha
]

{ #category : #accessing }
Interaccion >> fecha: anObject [
	fecha := anObject
]

{ #category : #initialization }
Interaccion >> initialize [
	fecha := DateAndTime now
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
