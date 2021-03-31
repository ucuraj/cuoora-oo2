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
|pregunta|
pregunta := self new.
pregunta titulo:unTitulo.
pregunta descripcion:unaDescripcion.
pregunta usuario:unUsuario.
^pregunta.
]

{ #category : #'instance creation' }
Pregunta class >> newPregunta [
|pregunta|
pregunta := self new.
pregunta titulo:String new.
pregunta descripcion:String new.
pregunta usuario:Usuario new.
^pregunta.
]

{ #category : #'as yet unclassified' }
Pregunta >> agregarRespuesta:unaRespuesta [
(self respuestas) add:unaRespuesta.
]

{ #category : #'as yet unclassified' }
Pregunta >> agregarTopico:unTopico [
(self topicos) add:unTopico.
]

{ #category : #'as yet unclassified' }
Pregunta >> calcularPuntaje [

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

{ #category : #'as yet unclassified' }
Pregunta >> respuestasOrdenadas [
|rtas|
rtas := SortedCollection sortBlock: [:p1 :p2 | (p1 totalLikes - p1 totalDislikes)  >= (p2 totalLikes - p2 totalDislikes)].
rtas addAll: (self respuestas).
^rtas.
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

{ #category : #'as yet unclassified' }
Pregunta >> totalRespuestas [ 
^((self respuestas) length).
]
