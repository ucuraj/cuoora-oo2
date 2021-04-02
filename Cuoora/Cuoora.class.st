"
""aaa""
"
Class {
	#name : #Cuoora,
	#superclass : #Object,
	#instVars : [
		'cuoora',
		'usuariosCreados',
		'topicos'
	],
	#category : #Cuoora
}

{ #category : #'as yet unclassified' }
Cuoora class >> conUsuarios:usuarios conTopicos:topicos [
  | cuoora |
  cuoora := self new.
  cuoora usuariosCreados: usuarios.
  cuoora topicos: topicos.
  ^cuoora
]

{ #category : #'as yet unclassified' }
Cuoora class >> newCuoora [
  | cuoora |
  cuoora := self new.
  cuoora usuariosCreados: Set new.
  cuoora topicos: Set new.
  ^cuoora
]

{ #category : #'as yet unclassified' }
Cuoora >> agregarTopico:unTopico [
(self topicos) add:unTopico
]

{ #category : #'as yet unclassified' }
Cuoora >> agregarUsuario:unUsuario [
(self usuariosCreados) add:unUsuario
]

{ #category : #'as yet unclassified' }
Cuoora >> buscarUsuarioCon:unUser [
^(self usuariosCreados) collect: [ :each | ((each user) == unUser) ].
]

{ #category : #accessing }
Cuoora >> cuoora [
	^ cuoora
]

{ #category : #accessing }
Cuoora >> cuoora: anObject [
	cuoora := anObject
]

{ #category : #'as yet unclassified' }
Cuoora >> existeTopico:unNombre [
^(self topicos) detect: [ :each | ((each nombre) == unNombre) ]
ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
Cuoora >> existeUsuario:unUser [
^(self usuariosCreados) detect: [ :each | ((each user) == unUser) ]
ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
Cuoora >> getPreguntasDeTopicos:unosTopicos [
^(unosTopicos) collect:[ :eachTopico |
((self usuariosCreados) preguntas) do: [ :eachPregunta |
		(eachPregunta topicos) do: [ :each | (each nombre) == (eachTopico nombre) ].
		]
	]

]

{ #category : #'as yet unclassified' }
Cuoora >> getRespuestasDeUnUsuario:unUsuario [
|rtas|
rtas := Set new.
^((self usuariosCreados) preguntas) collect: [ :eachPregunta |
		(eachPregunta respuestas) collect: [ :each | (each usuario) == (unUsuario) ]
		]
]

{ #category : #protocol }
Cuoora >> loginUser:unUser  password:unaPass [ 
^(self usuariosCreados) detect:[ :eachUsuario | ((eachUsuario user == unUser) & (eachUsuario pass == unaPass)) ]
ifNone:[nil].
]

{ #category : #accessing }
Cuoora >> topicos [
	^ topicos
]

{ #category : #accessing }
Cuoora >> topicos: anObject [
	topicos := anObject
]

{ #category : #accessing }
Cuoora >> usuariosCreados [
	^ usuariosCreados
]

{ #category : #accessing }
Cuoora >> usuariosCreados: anObject [
	usuariosCreados := anObject
]
