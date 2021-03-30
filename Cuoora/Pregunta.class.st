"
""a""
"
Class {
	#name : #Pregunta,
	#superclass : #Publicacion,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos',
		'respuestas'
	],
	#category : #Cuoora
}

{ #category : #'as yet unclassified' }
Pregunta class >> conTitulo:unTitulo Descripcion:unaDescripcion Usuario:unUsuario [
|publicacion|
publicacion := self new.
publicacion titulo:unTitulo.
publicacion descripcion:unaDescripcion.
publicacion usuario:unUsuario.
^publicacion.
]

{ #category : #accessing }
Pregunta >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Pregunta >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
]

{ #category : #accessing }
Pregunta >> respuestas: anObject [
	respuestas := anObject
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
Pregunta >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]

{ #category : #accessing }
Pregunta >> topicos: anObject [
	topicos := anObject
]
