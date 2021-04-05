Class {
	#name : #InteraccionTest,
	#superclass : #TestCase,
	#instVars : [
		'pedro',
		'pregunta',
		'juan',
		'respuesta'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
InteraccionTest >> setUp [
	super setUp.
	pedro := Usuario conNombre: 'pedro' Password: 'pedro'.
	juan := Usuario conNombre: 'juan' Password: 'juan'.
	pregunta := Pregunta
		conTitulo: '¿Para qué sirve el método SetUp?'
		Descripcion: 'Lorem ipsum dolor sit amet.'.
	pregunta
		agregarRespuesta: (Respuesta conTexto: 'Sirve para instaniar...' Usuario: juan).
	respuesta := Respuesta
		conTexto: 'Sirve para instaniar ....'
		Usuario: juan
]

{ #category : #tests }
InteraccionTest >> testConUsuarioPublicacion [
	| interaccionPregunta interaccionRespuesta interaccion|
	
	interaccionPregunta := Interaccion conUsuario: pedro Publicacion: pregunta.
	interaccionRespuesta := Interaccion conUsuario: juan Publicacion: respuesta. 
	
	interaccion := Interaccion new.
	
	self assert: interaccionPregunta publicacion equals: pregunta.
	self assert: interaccionPregunta usuario equals: pedro.
	
	self assert: interaccionRespuesta usuario equals: juan.
	self assert: interaccionRespuesta publicacion equals: respuesta.
	
	self deny: interaccion fecha equals: nil.
	self assert: interaccion usuario equals: nil.
	self assert: interaccion publicacion equals: nil. 
]
