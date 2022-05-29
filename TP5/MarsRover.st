!classDefinition: #TestMarsRover category: 'MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'tests' stamp: 'GFC 5/28/2022 22:47:14'!
test01RoverEnPosicionCeroCero

	| rover |
	
	rover := MarsRover new.
	
	self assert: (rover position = (0@0) ).
	! !

!TestMarsRover methodsFor: 'tests' stamp: 'GFC 5/28/2022 22:50:04'!
test02MoverHaciaAdelanteCambiaLaPosicion

	| rover |
	
	rover := MarsRover new.
	rover recibirComando: 'f'.
	self assert: (rover position = (0@1) ).
	! !

!TestMarsRover methodsFor: 'tests' stamp: 'GFC 5/28/2022 22:50:19'!
test03MoverHaciaAtrasCambiaLaPosicion

	| rover |
	
	rover := MarsRover new.
	rover recibirComando: 'b'.
	self assert: (rover position = (0@-1) ).
	! !

!TestMarsRover methodsFor: 'tests' stamp: 'GFC 5/28/2022 22:58:52'!
test04Rotar90gradosAlaIzquierda

	| rover |
	
	rover := MarsRover new.
	rover recibirComando: 'l'.
	self assert: (rover direccion = #West).
	! !

!TestMarsRover methodsFor: 'tests' stamp: 'GFC 5/28/2022 23:00:13'!
test05Rotar90gradosAlaDerecha

	| rover |
	
	rover := MarsRover new.
	rover recibirComando: 'r'.
	self assert: (rover direccion = #East).
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'xxx' stamp: 'GFC 5/28/2022 23:02:28'!
direccion
	^#West! !

!MarsRover methodsFor: 'xxx' stamp: 'GFC 5/28/2022 22:44:23'!
initialize
	position := (0@0).! !

!MarsRover methodsFor: 'xxx' stamp: 'GFC 5/28/2022 22:43:26'!
position
	^position! !

!MarsRover methodsFor: 'xxx' stamp: 'GFC 5/28/2022 22:51:59'!
recibirComando: secuenciaDeComandos 
	secuenciaDeComandos = 'f' ifTrue: [position := (0@1)].
	secuenciaDeComandos = 'b' ifTrue: [position := (0@-1)].! !
