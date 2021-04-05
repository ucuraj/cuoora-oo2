"
""Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	fechaCreacion:		<Object>
	pass:		<Object>
	user:		<Object>


    Implementation Points""
"
Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'user',
		'pass',
		'fechaCreacion',
		'topicosInteres',
		'preguntas',
		'seguidos'
	],
	#category : #'Cuoora-Model-Cuoora-Model'
}

{ #category : #'instance creation' }
Usuario class >> conNombre: unNombre Password: unaPassword [
	^ self new conNombre: unNombre Password: unaPassword
]

{ #category : #methods }
Usuario >> agregarPregunta: unaPregunta [
	self preguntas add: unaPregunta 
]

{ #category : #methods }
Usuario >> borrarPregunta: unaPregunta [
	"Intenta eliminar una pregunta, 
	devuelve true si la elimina.
	Si no existe la pregunta devuelve false"

	^ (self preguntas remove: unaPregunta ifAbsent: nil) isNotNil
]

{ #category : #methods }
Usuario >> buscarPregunta: unTitulo [
	"Busca una pregunta por titulo en las preguntas
	 realizadas por el usuario. 
	
	Devuelve la primer coincidencia en caso de que 
	haya mas de una pregunta con el mismo titulo."
	
	^ self preguntas
		detect: [ :pregunta | pregunta titulo = unTitulo ]
		ifNone: [ nil ]
]

{ #category : #methods }
Usuario >> calcularPuntaje [
	"Recorre las preguntas de un usuario y llama a calcularPuntaje
	Obtiene las respuestas de un usuario y llama a calcularPuntaje.
	
	Preguntar soleInstance de cuoora."
	
	| puntaje cuoora |
	puntaje := 0.
	cuoora := Cuoora soleInstance.
	
	self preguntas
		inject: puntaje
		into: [ :punt :eachPregunta | punt + eachPregunta calcularPuntaje ].
	
	(cuoora getRespuestasDeUnUsuario: self)
		inject: puntaje
		into: [ :punt :eachRespuesta | punt + eachRespuesta calcularPuntaje ]
]

{ #category : #'instance creation' }
Usuario >> conNombre: unNombre Password: unaPassword [
	self user: unNombre.
	self pass: unaPassword.
]

{ #category : #accessing }
Usuario >> fechaCreacion [
	^ fechaCreacion
]

{ #category : #accessing }
Usuario >> fechaCreacion: anObject [
	fechaCreacion := anObject
]

{ #category : #initialization }
Usuario >> initialize [
	self fechaCreacion: DateAndTime now.
	self topicosInteres: OrderedCollection new.
	self seguidos: OrderedCollection new.
	self preguntas: OrderedCollection new.
]

{ #category : #accessing }
Usuario >> pass [
	^ pass
]

{ #category : #accessing }
Usuario >> pass: anObject [
	pass := anObject
]

{ #category : #accessing }
Usuario >> preguntas [
	^ preguntas
]

{ #category : #accessing }
Usuario >> preguntas: anObject [
	preguntas := anObject
]

{ #category : #methods }
Usuario >> preguntasInteres [
	"Recorre los usuarios seguidos y obtiene las preguntas realizadas por cada uno de ellos. 
	Recorre los topicos de interes y obtiene las preguntas de cada tópico, a través de Cuoora.
	Devuelve un set de preguntas"

	| pregs cuoora |
	pregs := Set new.
	cuoora := Cuoora soleInstance. "preguntar"
	
	
	self topicosInteres
		do: [ :topico | pregs addAll: (cuoora getPreguntasDeTopico: topico) ].
		
	"get preguntas topicos de interes desde cuoora"
	
	self seguidos do: [ :seguido | pregs addAll: seguido preguntas ].
	^ pregs
]

{ #category : #methods }
Usuario >> registrarTopicoInteres: unTopico [
	(self topicosInteres includes: unTopico)
		ifFalse: [ self topicosInteres add: unTopico ]
]

{ #category : #accessing }
Usuario >> seguidos [
	^ seguidos
]

{ #category : #accessing }
Usuario >> seguidos: anObject [
	seguidos := anObject
]

{ #category : #methods }
Usuario >> seguirUsuario: unUsuario [
	"Agrega un usuario a la lista de usuarios seguidos."
	
	(self seguidos includes: unUsuario)
		ifFalse: [ self seguidos add: unUsuario ]
]

{ #category : #accessing }
Usuario >> topicosInteres [
	^ topicosInteres
]

{ #category : #accessing }
Usuario >> topicosInteres: anObject [
	topicosInteres := anObject
]

{ #category : #accessing }
Usuario >> user [
	^ user
]

{ #category : #accessing }
Usuario >> user: anObject [
	user := anObject
]
