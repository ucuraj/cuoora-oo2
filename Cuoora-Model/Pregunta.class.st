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
	#category : #'Cuoora-Model-Cuoora-Model'
}

{ #category : #'instance creation' }
Pregunta class >> conTitulo: unTitulo Descripcion: unaDescripcion [
	^ self new conTitulo: unTitulo Descripcion: unaDescripcion
]

{ #category : #methods }
Pregunta >> agregarRespuesta: unaRespuesta [
	self respuestas add: unaRespuesta
]

{ #category : #methods }
Pregunta >> agregarTopico: unTopico [
	self topicos add: unTopico
]

{ #category : #methods }
Pregunta >> calcularPuntaje [

	^ 20 + self likes size - self dislikes size
]

{ #category : #'instance creation' }
Pregunta >> conTitulo: unTitulo Descripcion: unaDescripcion [
	self titulo: unTitulo.
	self descripcion: unaDescripcion.
]

{ #category : #accessing }
Pregunta >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Pregunta >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #initialization }
Pregunta >> initialize [ 
	super initialize .
	self titulo: ''.
	self descripcion: ''.
	self topicos: Set new.
	self respuestas: Set new.
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
]

{ #category : #accessing }
Pregunta >> respuestas: anObject [
	respuestas := anObject
]

{ #category : #methods }
Pregunta >> respuestasOrdenadas [
	| rtas |
	rtas := SortedCollection
		sortBlock:
			[ :p1 :p2 | p1 totalLikes - p1 totalDislikes >= (p2 totalLikes - p2 totalDislikes) ].
	rtas addAll: self respuestas.
	^ rtas
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

{ #category : #methods }
Pregunta >> totalRespuestas [
	^ self respuestas length
]
