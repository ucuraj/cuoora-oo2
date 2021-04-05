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
	nombre:		<Object>


    Implementation Points""
"
Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'Cuoora-Model-Cuoora-Components'
}

{ #category : #'instance creation' }
Topico class >> conNombre: aName Descripcion: aDescription [
	^ self new conNombre: aName Descripcion: aDescription
]

{ #category : #initialization }
Topico >> conNombre: unNombre Descripcion: unaDescripcion [
	self nombre: unNombre.
	self descripcion: unaDescripcion.
]

{ #category : #accessing }
Topico >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Topico >> descripcion: unaDescripcion [
	descripcion := unaDescripcion
]

{ #category : #initialization }
Topico >> initialize [
	self descripcion: ''.
	self nombre: ''.
]

{ #category : #accessing }
Topico >> nombre [
	^ nombre
]

{ #category : #accessing }
Topico >> nombre: unNombre [
	nombre := unNombre
]
