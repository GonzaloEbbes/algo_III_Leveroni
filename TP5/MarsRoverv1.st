!classDefinition: #TestMarsRover category: 'MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'testsDeUnComando' stamp: 'GFC 5/30/2022 01:08:19'!
test01RoverEnPosicionCeroCero

	| rover |
	
	rover := MarsRover new.
	
	self assert: (rover estaEnPosicionMarciana: (0@0) ).
	self assert: (rover miraEnDireccion: Norte).
	! !

!TestMarsRover methodsFor: 'testsDeUnComando' stamp: 'GFC 5/29/2022 23:43:02'!
test02MoverHaciaAdelanteCambiaLaPosicion

	| rover |
	
	rover := MarsRover new.
	rover recibirComando: 'f'.
	self assert: (rover estaEnPosicionMarciana: (0@1) ).
	! !

!TestMarsRover methodsFor: 'testsDeUnComando' stamp: 'GFC 5/29/2022 23:43:08'!
test03MoverHaciaAtrasCambiaLaPosicion

	| rover |
	
	rover := MarsRover new.
	rover recibirComando: 'b'.
	self assert: (rover estaEnPosicionMarciana: (0@-1) ).
	! !

!TestMarsRover methodsFor: 'testsDeUnComando' stamp: 'GFC 5/30/2022 01:24:00'!
test04Rotar90gradosAlaIzquierda

	| rover |
	
	rover := MarsRover new.
	rover recibirComando: 'l'.
	self assert: (rover miraEnDireccion: Oeste).
	! !

!TestMarsRover methodsFor: 'testsDeUnComando' stamp: 'GFC 5/30/2022 01:24:06'!
test05Rotar90gradosAlaDerecha

	| rover |
	
	rover := MarsRover new.
	rover recibirComando: 'r'.
	self assert: (rover miraEnDireccion: Este).
	! !


!TestMarsRover methodsFor: 'testsAccionesCruzadas' stamp: 'GFC 5/30/2022 01:24:56'!
test10GiroAIzquierdaYMuevoHaciaAdelante
	| rover |
	rover := MarsRover new.
	
	rover recibirComando: 'lf'.
	
	self assert: (rover miraEnDireccion: Oeste).
	self assert: (rover estaEnPosicionMarciana: (-1@0)).! !


!TestMarsRover methodsFor: 'testsVariosComandos' stamp: 'GFC 5/30/2022 00:28:30'!
test06AvanzoVariasVeces
	| rover |
	rover := MarsRover new.
	
	rover recibirComando: 'fff'.
	
	self assert: (rover estaEnPosicionMarciana: (0@3)).! !

!TestMarsRover methodsFor: 'testsVariosComandos' stamp: 'GFC 5/30/2022 00:32:02'!
test07RetrocedoVariasVeces
	| rover |
	rover := MarsRover new.
	
	rover recibirComando: 'bbb'.
	
	self assert: (rover estaEnPosicionMarciana: (0@-3)).! !

!TestMarsRover methodsFor: 'testsVariosComandos' stamp: 'GFC 5/30/2022 01:24:17'!
test08RotarVariasVecesALaIzquierda
	| rover |
	rover := MarsRover new.
	
	rover recibirComando: 'lll'.
	
	self assert: (rover miraEnDireccion: Este).! !

!TestMarsRover methodsFor: 'testsVariosComandos' stamp: 'GFC 5/30/2022 01:24:20'!
test09RotarVariasVecesALaDerecha
	| rover |
	rover := MarsRover new.
	
	rover recibirComando: 'rrr'.
	
	self assert: (rover miraEnDireccion: Oeste).! !

!TestMarsRover methodsFor: 'testsVariosComandos' stamp: 'GFC 5/30/2022 01:24:24'!
test10WTFAvanzarHaciaAdelanteRotarIzquierdaYRetroceder
	| rover |
	rover := MarsRover new.
	rover recibirComando: 'flb'.
	
	self assert: (rover estaEnPosicionMarciana: (1@1)).
	self assert: (rover miraEnDireccion: Oeste).
	! !


!classDefinition: #DireccionCardinalDelMarsRover category: 'MarsRover'!
Object subclass: #DireccionCardinalDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DireccionCardinalDelMarsRover methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:07:36'!
esLaMismaDireccionCardinalQue: unaDireccionCardinal
	^(self class = unaDireccionCardinal)! !

!DireccionCardinalDelMarsRover methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:11:28'!
moverHaciaAdelanteElRover: marsRover
	self subclassResponsibility.! !

!DireccionCardinalDelMarsRover methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:29:32'!
moverHaciaAtrasElRover: marsRover
	self subclassResponsibility.! !

!DireccionCardinalDelMarsRover methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:38:32'!
rotarHaciaLaDerechaElRover: marsRover
	self subclassResponsibility.! !

!DireccionCardinalDelMarsRover methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:46:13'!
rotarHaciaLaIzquierdaElRover: marsRover
	self subclassResponsibility.! !


!classDefinition: #Este category: 'MarsRover'!
DireccionCardinalDelMarsRover subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:14:01'!
moverHaciaAdelanteElRover: marsRover
	marsRover moverHaciaAdelanteMirandoAlEste.! !

!Este methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:30:19'!
moverHaciaAtrasElRover: marsRover
	marsRover moverHaciaAtrasMirandoAlEste.! !

!Este methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:40:21'!
rotarHaciaLaDerechaElRover: marsRover
	marsRover rotarHaciaLaDerechaMirandoAlEste.! !

!Este methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:46:38'!
rotarHaciaLaIzquierdaElRover: marsRover
	marsRover rotarHaciaLaIzquierdaMirandoAlEste.! !


!classDefinition: #Norte category: 'MarsRover'!
DireccionCardinalDelMarsRover subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:14:41'!
moverHaciaAdelanteElRover: marsRover
	marsRover moverHaciaAdelanteMirandoAlNorte.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:30:37'!
moverHaciaAtrasElRover: marsRover
	marsRover moverHaciaAtrasMirandoAlNorte.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:41:08'!
rotarHaciaLaDerechaElRover: marsRover
	marsRover rotarHaciaLaDerechaMirandoAlNorte.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:46:55'!
rotarHaciaLaIzquierdaElRover: marsRover
	marsRover rotarHaciaLaIzquierdaMirandoAlNorte.! !


!classDefinition: #Oeste category: 'MarsRover'!
DireccionCardinalDelMarsRover subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:14:52'!
moverHaciaAdelanteElRover: marsRover
	marsRover moverHaciaAdelanteMirandoAlOeste.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:31:02'!
moverHaciaAtrasElRover: marsRover
	marsRover moverHaciaAtrasMirandoAlOeste.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:41:18'!
rotarHaciaLaDerechaElRover: marsRover
	marsRover rotarHaciaLaDerechaMirandoAlOeste.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:47:25'!
rotarHaciaLaIzquierdaElRover: marsRover
	marsRover rotarHaciaLaIzquierdaMirandoAlOeste.! !


!classDefinition: #Sur category: 'MarsRover'!
DireccionCardinalDelMarsRover subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:31:20'!
moverHaciaAdelanteElRover: marsRover
	marsRover moverHaciaAdelanteMirandoAlSur.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:31:29'!
moverHaciaAtrasElRover: marsRover
	marsRover moverHaciaAtrasMirandoAlSur.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:41:28'!
rotarHaciaLaDerechaElRover: marsRover
	marsRover rotarHaciaLaDerechaMirandoAlSur.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'GFC 5/30/2022 01:47:33'!
rotarHaciaLaIzquierdaElRover: marsRover
	marsRover rotarHaciaLaIzquierdaMirandoAlSur.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccionDeAvance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'Initialization' stamp: 'GFC 5/30/2022 00:59:43'!
initialize
	posicion := (0@0).
	direccionDeAvance  := Norte new.! !


!MarsRover methodsFor: 'Public - Comando' stamp: 'GFC 5/30/2022 00:48:29'!
recibirComando: secuenciaDeComandos 
	1 to: secuenciaDeComandos size do: [ :numeroDeComandoRecibido |
		|unComando|
		unComando  := (secuenciaDeComandos at: numeroDeComandoRecibido).
		unComando = $f ifTrue: [self moverHaciaAdelanteUnPunto.].
		unComando = $b ifTrue: [self moverHaciaAtrasUnPunto ].
		unComando = $l ifTrue: [self rotarHaciaLaIzquierda ].
		unComando = $r ifTrue: [self rotarHaciaLaDerecha ].
		].
	
	"secuenciaDeComandos do:[ :unComando |
		
		unComando = 'f' ifTrue: [posicion := (0@1)].
		unComando = 'b' ifTrue: [posicion := (0@-1)].
		unComando = 'l' ifTrue: [direccionDeAvance := #Oeste].
		unComando = 'r' ifTrue: [direccionDeAvance := #Este].
	
	]."! !


!MarsRover methodsFor: 'Booleanos' stamp: 'GFC 5/29/2022 23:42:23'!
estaEnPosicionMarciana: puntoCoordenado
	^(posicion = puntoCoordenado)! !

!MarsRover methodsFor: 'Booleanos' stamp: 'GFC 5/30/2022 01:07:36'!
miraEnDireccion: unaDireccionCardinal
	^(direccionDeAvance esLaMismaDireccionCardinalQue: unaDireccionCardinal)! !


!MarsRover methodsFor: 'moverHaciaAtras' stamp: 'GFC 5/30/2022 01:32:48'!
moverHaciaAtrasMirandoAlEste
	posicion := ((posicion x - 1)@(posicion y)).! !

!MarsRover methodsFor: 'moverHaciaAtras' stamp: 'GFC 5/30/2022 01:33:14'!
moverHaciaAtrasMirandoAlNorte
	posicion := ((posicion x)@(posicion y - 1)).! !

!MarsRover methodsFor: 'moverHaciaAtras' stamp: 'GFC 5/30/2022 01:33:48'!
moverHaciaAtrasMirandoAlOeste
	posicion := ((posicion x + 1)@(posicion y)).! !

!MarsRover methodsFor: 'moverHaciaAtras' stamp: 'GFC 5/30/2022 01:33:30'!
moverHaciaAtrasMirandoAlSur
	posicion := ((posicion x)@(posicion y + 1)).! !

!MarsRover methodsFor: 'moverHaciaAtras' stamp: 'GFC 5/30/2022 01:29:08'!
moverHaciaAtrasUnPunto

	direccionDeAvance moverHaciaAtrasElRover: self.

	"direccionDeAvance = #Norte ifTrue: [
		posicion := ((posicion x)@(posicion y - 1)). ].
	direccionDeAvance = #Sur ifTrue: [
		posicion := ((posicion x)@(posicion y + 1)). ].
	direccionDeAvance = #Este ifTrue: [
		posicion := ((posicion x - 1)@(posicion y)).].
	direccionDeAvance = #Oeste ifTrue: [
		posicion := ((posicion x + 1)@(posicion y)).]."! !


!MarsRover methodsFor: 'moverHaciaAdelante' stamp: 'GFC 5/30/2022 01:27:09'!
moverHaciaAdelanteMirandoAlEste
	posicion := ((posicion x + 1)@(posicion y)).! !

!MarsRover methodsFor: 'moverHaciaAdelante' stamp: 'GFC 5/30/2022 01:18:26'!
moverHaciaAdelanteMirandoAlNorte
	posicion := ((posicion x)@(posicion y + 1)).! !

!MarsRover methodsFor: 'moverHaciaAdelante' stamp: 'GFC 5/30/2022 01:27:23'!
moverHaciaAdelanteMirandoAlOeste
	posicion := ((posicion x - 1)@(posicion y)).! !

!MarsRover methodsFor: 'moverHaciaAdelante' stamp: 'GFC 5/30/2022 01:26:48'!
moverHaciaAdelanteMirandoAlSur
	posicion := ((posicion x)@(posicion y - 1)).! !

!MarsRover methodsFor: 'moverHaciaAdelante' stamp: 'GFC 5/30/2022 01:17:28'!
moverHaciaAdelanteUnPunto.
	direccionDeAvance moverHaciaAdelanteElRover: self.
	
	"direccionDeAvance = #Norte ifTrue: [
		posicion := ((posicion x)@(posicion y + 1)). ].
	direccionDeAvance = #Sur ifTrue: [
		posicion := ((posicion x)@(posicion y - 1)). ].
	direccionDeAvance = #Este ifTrue: [
		posicion := ((posicion x + 1)@(posicion y)).].
	direccionDeAvance = #Oeste ifTrue: [
		posicion := ((posicion x - 1)@(posicion y)).]."! !


!MarsRover methodsFor: 'rotarHaciaLaDerecha' stamp: 'GFC 5/30/2022 01:35:33'!
rotarHaciaLaDerecha
	
	direccionDeAvance rotarHaciaLaDerechaElRover: self.

	"direccionDeAvance = #Norte ifTrue: [^direccionDeAvance := #Este].
	direccionDeAvance = #Sur ifTrue: [^direccionDeAvance := #Oeste].
	direccionDeAvance = #Este ifTrue: [^direccionDeAvance := #Sur].
	direccionDeAvance = #Oeste ifTrue: [^direccionDeAvance := #Norte].	"! !

!MarsRover methodsFor: 'rotarHaciaLaDerecha' stamp: 'GFC 5/30/2022 01:43:23'!
rotarHaciaLaDerechaMirandoAlEste
	^direccionDeAvance := Sur new.! !

!MarsRover methodsFor: 'rotarHaciaLaDerecha' stamp: 'GFC 5/30/2022 01:44:05'!
rotarHaciaLaDerechaMirandoAlNorte
	^direccionDeAvance := Este new.! !

!MarsRover methodsFor: 'rotarHaciaLaDerecha' stamp: 'GFC 5/30/2022 01:43:40'!
rotarHaciaLaDerechaMirandoAlOeste
	^direccionDeAvance := Norte new.! !

!MarsRover methodsFor: 'rotarHaciaLaDerecha' stamp: 'GFC 5/30/2022 01:43:54'!
rotarHaciaLaDerechaMirandoAlSur
	^direccionDeAvance := Oeste new.! !


!MarsRover methodsFor: 'rotarHaciaLaIzquierda' stamp: 'GFC 5/30/2022 01:45:46'!
rotarHaciaLaIzquierda
	direccionDeAvance  rotarHaciaLaIzquierdaElRover: self.
	
	"direccionDeAvance = #Norte ifTrue: [^direccionDeAvance := #Oeste].
	direccionDeAvance = #Sur ifTrue: [^direccionDeAvance := #Este].
	direccionDeAvance = #Este ifTrue: [^direccionDeAvance := #Norte].
	direccionDeAvance = #Oeste ifTrue: [^direccionDeAvance := #Sur].	"! !

!MarsRover methodsFor: 'rotarHaciaLaIzquierda' stamp: 'GFC 5/30/2022 01:49:03'!
rotarHaciaLaIzquierdaMirandoAlEste
	direccionDeAvance := Norte new.! !

!MarsRover methodsFor: 'rotarHaciaLaIzquierda' stamp: 'GFC 5/30/2022 01:49:29'!
rotarHaciaLaIzquierdaMirandoAlNorte
	direccionDeAvance := Oeste new.! !

!MarsRover methodsFor: 'rotarHaciaLaIzquierda' stamp: 'GFC 5/30/2022 01:49:15'!
rotarHaciaLaIzquierdaMirandoAlOeste
	direccionDeAvance := Sur new.! !

!MarsRover methodsFor: 'rotarHaciaLaIzquierda' stamp: 'GFC 5/30/2022 01:48:49'!
rotarHaciaLaIzquierdaMirandoAlSur
	direccionDeAvance := Este new.! !
