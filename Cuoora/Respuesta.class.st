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
	descripcion:		<Object>
	texto:		<Object>
	topicos:		<Object>


    Implementation Points""
"
Class {
	#name : #Respuesta,
	#superclass : #Publicacion,
	#instVars : [
		'texto',
		'descripcion',
		'topicos'
	],
	#category : #Cuoora
}

{ #category : #'as yet unclassified' }
Respuesta class >> conTexto:unTexto conUsuario:unUsuario [
|respuesta|
respuesta := self new.
respuesta texto:unTexto.
respuesta usuario:unUsuario.
^respuesta.
]

{ #category : #'instance creation' }
Respuesta class >> newRespuesta [
|respuesta|
respuesta := self new.
respuesta texto: String new.
respuesta usuario: Usuario new.
^respuesta.
]

{ #category : #'as yet unclassified' }
Respuesta >> calcularPuntaje [
]

{ #category : #accessing }
Respuesta >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Respuesta >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #accessing }
Respuesta >> texto [
	^ texto
]

{ #category : #accessing }
Respuesta >> texto: anObject [
	texto := anObject
]

{ #category : #accessing }
Respuesta >> topicos [
	^ topicos
]

{ #category : #accessing }
Respuesta >> topicos: anObject [
	topicos := anObject
]
