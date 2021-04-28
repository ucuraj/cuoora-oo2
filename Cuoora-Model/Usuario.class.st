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
	#category : #'Cuoora-Model-Cuoora-Components'
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
	Preguntar soleInstance de cuoora.
	http://forum.world.st/sum-detectSum-sumNumbers-td4864461.html
	#sum:
- uses #inject:into: with #anyOne as the injected element and will thus fail for empty collections
^((self preguntas) sum:[:eachPregunta | eachPregunta calcularPuntaje]) + ((Cuoora soleInstance getRespuestasDeUnUsuario: self) sum:[:eachPregunta | eachPregunta calcularPuntaje])
"

	| puntaje rtasPropias rtas|
	rtasPropias := Set new.
	rtas:=((Cuoora soleInstance getRespuestasDeUnUsuario: self) asSet).
	puntaje := self preguntas
		sumNumbers: [ :eachPregunta | 
			eachPregunta calcularPuntaje ].
	rtasPropias := self preguntas flatCollect: [ :eachPregunta | eachPregunta respuestas collect:[:eachRespuesta | eachRespuesta usuario = self ] ] .
	^ puntaje
		+ ((rtas removeAll:rtasPropias)
		sumNumbers: [ :eachRespuesta | eachRespuesta calcularPuntaje ])
]

{ #category : #'as yet unclassified' }
Usuario >> checkUser:unUsuario unaPass:unaPass [
(user = unUsuario & ( pass = unaPass))
ifTrue: [  ^true ]
ifFalse: [ ^false ]
]

{ #category : #'instance creation' }
Usuario >> conNombre: unNombre Password: unaPassword [
	self user: unNombre.
	self pass: unaPassword.
]

{ #category : #methods }
Usuario >> dejarDeSeguirUsuario: unUsuario [
	"Elimino un usuario a la lista de usuarios seguidos."

	unUsuario = self
		ifTrue: [ ^ false ].
		
	^ self seguidos remove: unUsuario ifAbsent: false.
]

{ #category : #accessing }
Usuario >> fechaCreacion [
	^ fechaCreacion
]

{ #category : #accessing }
Usuario >> fechaCreacion: anObject [
	fechaCreacion := anObject
]

{ #category : #private }
Usuario >> getPreguntasInteres: unNumero [
	"Devuelve una colección preguntas ordenadas 
	por fecha de creación(mayor a menor) de longitud unNumero
	Utiliza preguntasInteres para obtener las preguntas de interes."

	| preg |
	preg := self preguntasInteres asSortedCollection reverse.
	preg size >= unNumero
		ifTrue: [ ^ preg first: unNumero ].
	^preg
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

{ #category : #private }
Usuario >> preguntasInteres [
	"Recorre los usuarios seguidos y obtiene las preguntas realizadas por cada uno de ellos. 
	Recorre los topicos de interes y obtiene las preguntas de cada tópico, a través de Cuoora.
	Devuelve un set de preguntas para evitar repetidos" 

	| pregs |
	pregs := self topicosInteres
		collectAll: [ :topico | Cuoora soleInstance getPreguntasDeTopico: topico ].
	self seguidos do: [ :seguido | pregs addAll: seguido preguntas ].
	^ pregs asSet
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

	unUsuario = self
		ifTrue: [ ^ false ].
		
	(self seguidos includes: unUsuario)
		ifFalse: [ self seguidos add: unUsuario ]
]

{ #category : #methods }
Usuario >> sigueA: unUsuario [
	unUsuario = self
		ifTrue: [ ^ false ].
	^ self seguidos includes: unUsuario
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
