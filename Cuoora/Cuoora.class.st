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

{ #category : #accessing }
Cuoora >> cuoora [
	^ cuoora
]

{ #category : #accessing }
Cuoora >> cuoora: anObject [
	cuoora := anObject
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
