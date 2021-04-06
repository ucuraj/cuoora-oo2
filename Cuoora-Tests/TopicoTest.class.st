Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#instVars : [
		'topico1',
		'topico2'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #tests }
TopicoTest >> testConNombreDescripcion [
	topico1 := Topico
		conNombre: 'Topico de prueba'
		Descripcion: 'Este topico se utiliza para pruebas'.
	self assert: topico1 nombre equals: 'Topico de prueba'.
	self
		assert: topico1 descripcion
		equals: 'Este topico se utiliza para pruebas'.
	topico2 := Topico new.
	self assert: topico2 nombre equals: ''.
	self assert: topico2 descripcion equals: ''.
]
