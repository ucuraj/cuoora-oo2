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
	#category : #'Cuoora-Model-Cuoora-Components'
}

{ #category : #'instance creation' }
Pregunta class >> conTitulo: unTitulo Descripcion: unaDescripcion Usuario: unUsuario [
	^ self new
		conTitulo: unTitulo
		Descripcion: unaDescripcion
		Usuario: unUsuario
]

{ #category : #'instance creation' }
Pregunta class >> conTitulo: unTitulo Descripcion: unaDescripcion Usuario: unUsuario Topicos: unosTopicos [
	^ self new
		conTitulo: unTitulo
		Descripcion: unaDescripcion
		Usuario: unUsuario
		Topicos: unosTopicos
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
Pregunta >> agregarTopicos: unosTopicos [
	" recibe un string con topicos separados por coma, 
	los agrega a la lista de topicos"

	(unosTopicos splitOn: ',')
		do: [ :topico | 
			| t |
			(t := Cuoora soleInstance existeTopico: topico)
				ifNotNil: [ self agregarTopico: t ] ]
]

{ #category : #methods }
Pregunta >> calcularPuntaje [

	^ 20 + (self totalLikes asNumber - self totalDislikes asNumber)
]

{ #category : #'instance creation' }
Pregunta >> conTitulo: unTitulo Descripcion: unaDescripcion Usuario:unUsuario [
   self usuario: unUsuario.
	self titulo: unTitulo.
	self descripcion: unaDescripcion.
]

{ #category : #'instance creation' }
Pregunta >> conTitulo: unTitulo Descripcion: unaDescripcion Usuario:unUsuario Topicos: unosTopicos [.
   self usuario: unUsuario.
	self titulo: unTitulo.
	self descripcion: unaDescripcion.
	self agregarTopicos: unosTopicos.
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
	^ self respuestas size
]
