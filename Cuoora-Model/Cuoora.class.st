"
""aaa""
"
Class {
	#name : #Cuoora,
	#superclass : #Object,
	#instVars : [
		'usuariosCreados',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Cuoora-Model-Cuoora-Components'
}

{ #category : #'instance creation' }
Cuoora class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'instance creation' }
Cuoora class >> conUsuarios: usuarios Topicos: topicos [
	^ self new conUsuarios: usuarios Topicos: topicos
]

{ #category : #'instance creation' }
Cuoora class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #methods }
Cuoora >> agregarTopico: unTopico [
	"Agrega un topico al set topicos, 
	Chequea que el nombre del topico 
	no existe en el sistema"

	(self existeTopico: unTopico nombre)
		ifNil: [ self topicos add: unTopico ]
]

{ #category : #methods }
Cuoora >> agregarUsuario: unUsuario [
	"Agrega un usuario al set 
	usuariosCreados. Chequea que el 
	nombre de usuario no exista."

	(self existeUsuario: unUsuario user)
		ifNil: [ self usuariosCreados add: unUsuario ]
]

{ #category : #'instance creation' }
Cuoora >> conUsuarios: unosUsuarios Topicos: unosTopicos [
	self usuariosCreados: unosUsuarios.
	self topicos: unosTopicos
]

{ #category : #methods }
Cuoora >> existeTopico: unNombre [
	"Busca un topico por nombre. Si existe 
	devuelve un objeto Topico sino nil"
	
	^ self topicos
		detect: [ :each | each nombre = unNombre ]
		ifNone: [ nil ]
]

{ #category : #methods }
Cuoora >> existeUsuario: unUsername [
	"Busca un usuario por nombre de usuario. 
	Si existe devuelve el objeto usuario, sino nil."
	
	^ self usuariosCreados
		detect: [ :each | each user = unUsername ]
		ifNone: [ nil ]
]

{ #category : #methods }
Cuoora >> getPreguntasDeTopico: unTopico [
	"Recorre todos los usuarios y obtiene las preguntas 
	cuyo topico sea unTopico. Devuelve a un set de preguntas"

	| preguntas |
	preguntas := Set new.
	
	self usuariosCreados
		do: [ :usuario | 
			preguntas
				addAll:
					(usuario preguntas
						select:
							[ :pregunta | pregunta topicos anySatisfy: [ :topico | topico = unTopico ] ]) ].
					
	^ preguntas
]

{ #category : #methods }
Cuoora >> getPreguntasDeTopicos: unosTopicos [
	| preguntas |
	preguntas := Set new.
	
	unosTopicos
		do: [ :topico | preguntas addAll: (self getPreguntasDeTopico: topico) ].
		
	^preguntas
]

{ #category : #methods }
Cuoora >> getRespuestasDeUnUsuario: unUsuario [
	"Recorre usuariosCreados. Por cada usuario 
	recorre sus preguntas, y a su vez las respuestas 
	de cada pregunta,  agregando a un conjunto las 
	preguntas que  hayan sido creadas por unUsuario "
	
	| rtas |
	rtas := Set new.
	
	self usuariosCreados
		do: [ :usuario | 
			usuario preguntas
				do: [ :eachPregunta | 
					rtas
						addAll:
							(eachPregunta respuestas
								select: [ :each | each usuario user = unUsuario user ]) ] ].
	^ rtas
]

{ #category : #initialization }
Cuoora >> initialize [
	self usuariosCreados: Set new.
	self topicos: Set new.
]

{ #category : #protocol }
Cuoora >> loginUser: unUser password: unaPass [
	^ self usuariosCreados
		detect:
			[ :eachUsuario | eachUsuario user = unUser & (eachUsuario pass = unaPass) ]
		ifNone: [ nil ]
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
