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
		'texto'
	],
	#category : #'Cuoora-Model-Cuoora-Components'
}

{ #category : #'instance creation' }
Respuesta class >> conTexto: unTexto Usuario: unUsuario [
	^ self new conTexto: unTexto Usuario: unUsuario
]

{ #category : #methods }
Respuesta >> calcularPuntaje [

	^ 50 + (self totalLikes asNumber - self totalDislikes asNumber)
]

{ #category : #'instance creation' }
Respuesta >> conTexto: unTexto Usuario: unUsuario [
	self texto: unTexto.
	self usuario: unUsuario
]

{ #category : #initialization }
Respuesta >> initialize [
	super initialize.
	self texto: ''.
]

{ #category : #accessing }
Respuesta >> texto [
	^ texto
]

{ #category : #accessing }
Respuesta >> texto: anObject [
	texto := anObject
]
