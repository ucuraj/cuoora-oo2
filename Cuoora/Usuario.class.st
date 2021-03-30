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
		'fechaCreacion'
	],
	#category : #Cuoora
}

{ #category : #accessing }
Usuario >> fechaCreacion [
	^ fechaCreacion
]

{ #category : #accessing }
Usuario >> fechaCreacion: anObject [
	fechaCreacion := anObject
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
Usuario >> user [
	^ user
]

{ #category : #accessing }
Usuario >> user: anObject [
	user := anObject
]
