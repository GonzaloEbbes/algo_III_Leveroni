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


!TestMarsRover methodsFor: 'testExcepciones' stamp: 'get 5/31/2022 21:33:03'!
test11ElProcesamientoDeComandosConComandosErroneosDevuelveError

	| rover |
	
	rover := MarsRover new.
	
	self 
		should: [ rover recibirComando: 'Alf'. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: MarsRover ErrorDeComandoInvalido equals: anError messageText ]
! !


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


!classDefinition: #ComandosDelMarsRover category: 'MarsRover'!
Object subclass: #ComandosDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandosDelMarsRover class' category: 'MarsRover'!
ComandosDelMarsRover class
	instanceVariableNames: ''!

!ComandosDelMarsRover class methodsFor: 'Public' stamp: 'get 5/31/2022 23:32:36'!
ejecutarComandoEnRover: marsRover
	
	self subclassResponsibility ! !

!ComandosDelMarsRover class methodsFor: 'Public' stamp: 'get 5/31/2022 23:33:06'!
esteComandoTeSirve: unCodigoDeComando
	
	self subclassResponsibility ! !


!classDefinition: #Avance category: 'MarsRover'!
ComandosDelMarsRover subclass: #Avance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avance class' category: 'MarsRover'!
Avance class
	instanceVariableNames: ''!

!Avance class methodsFor: 'Public' stamp: 'get 5/31/2022 23:27:26'!
ejecutarComandoEnRover: marsRover
	
	marsRover moverHaciaAdelanteUnPunto.! !

!Avance class methodsFor: 'Public' stamp: 'get 5/31/2022 23:27:00'!
esteComandoTeSirve: unCodigoDeComando
	
	^ (unCodigoDeComando = $f)! !


!classDefinition: #GiroDerecho category: 'MarsRover'!
ComandosDelMarsRover subclass: #GiroDerecho
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GiroDerecho class' category: 'MarsRover'!
GiroDerecho class
	instanceVariableNames: ''!

!GiroDerecho class methodsFor: 'Public' stamp: 'get 5/31/2022 23:27:57'!
ejecutarComandoEnRover: marsRover
	
	marsRover rotarHaciaLaDerecha.! !

!GiroDerecho class methodsFor: 'Public' stamp: 'get 5/31/2022 23:28:56'!
esteComandoTeSirve: unCodigoDeComando
	
	^ (unCodigoDeComando = $r)! !


!classDefinition: #GiroIzquierdo category: 'MarsRover'!
ComandosDelMarsRover subclass: #GiroIzquierdo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GiroIzquierdo class' category: 'MarsRover'!
GiroIzquierdo class
	instanceVariableNames: ''!

!GiroIzquierdo class methodsFor: 'Public' stamp: 'get 5/31/2022 23:29:20'!
ejecutarComandoEnRover: marsRover
	
	marsRover rotarHaciaLaIzquierda.! !

!GiroIzquierdo class methodsFor: 'Public' stamp: 'get 5/31/2022 23:29:07'!
esteComandoTeSirve: unCodigoDeComando
	
	^ (unCodigoDeComando = $l)! !


!classDefinition: #Retroceso category: 'MarsRover'!
ComandosDelMarsRover subclass: #Retroceso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Retroceso class' category: 'MarsRover'!
Retroceso class
	instanceVariableNames: ''!

!Retroceso class methodsFor: 'Public' stamp: 'get 5/31/2022 23:29:35'!
ejecutarComandoEnRover: marsRover
	
	marsRover moverHaciaAtrasUnPunto.! !

!Retroceso class methodsFor: 'Public' stamp: 'get 5/31/2022 23:29:51'!
esteComandoTeSirve: unCodigoDeComando
	
	^ (unCodigoDeComando = $b)! !


!classDefinition: #DireccionCardinalDelMarsRover category: 'MarsRover'!
Object subclass: #DireccionCardinalDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DireccionCardinalDelMarsRover methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:02:08'!
indicarAlRoverQueMuevaHaciaAtras: marsRover
	self subclassResponsibility.! !

!DireccionCardinalDelMarsRover methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:56'!
indicarAlRoverQueRoteHaciaLaDerecha: marsRover
	self subclassResponsibility.! !

!DireccionCardinalDelMarsRover methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:34'!
indicarAlRoverQueRoteHaciaLaIzquierda: marsRover
	self subclassResponsibility.! !

!DireccionCardinalDelMarsRover methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:45'!
indicarAlRoverQueSeMuevaHaciaAdelante: marsRover
	self subclassResponsibility.! !


!DireccionCardinalDelMarsRover methodsFor: 'Testing' stamp: 'GFC 5/30/2022 01:07:36'!
esLaMismaDireccionCardinalQue: unaDireccionCardinal
	^(self class = unaDireccionCardinal)! !


!classDefinition: #Este category: 'MarsRover'!
DireccionCardinalDelMarsRover subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:02:08'!
indicarAlRoverQueMuevaHaciaAtras: marsRover
	marsRover moverHaciaAtrasMirandoAlEste.! !

!Este methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:56'!
indicarAlRoverQueRoteHaciaLaDerecha: marsRover
	marsRover rotarHaciaLaDerechaMirandoAlEste.! !

!Este methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:35'!
indicarAlRoverQueRoteHaciaLaIzquierda: marsRover
	marsRover rotarHaciaLaIzquierdaMirandoAlEste.! !

!Este methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:46'!
indicarAlRoverQueSeMuevaHaciaAdelante: marsRover
	marsRover moverHaciaAdelanteMirandoAlEste.! !


!classDefinition: #Norte category: 'MarsRover'!
DireccionCardinalDelMarsRover subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:02:08'!
indicarAlRoverQueMuevaHaciaAtras: marsRover
	marsRover moverHaciaAtrasMirandoAlNorte.! !

!Norte methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:56'!
indicarAlRoverQueRoteHaciaLaDerecha: marsRover
	marsRover rotarHaciaLaDerechaMirandoAlNorte.! !

!Norte methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:35'!
indicarAlRoverQueRoteHaciaLaIzquierda: marsRover
	marsRover rotarHaciaLaIzquierdaMirandoAlNorte.! !

!Norte methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:46'!
indicarAlRoverQueSeMuevaHaciaAdelante: marsRover
	marsRover moverHaciaAdelanteMirandoAlNorte.! !


!classDefinition: #Oeste category: 'MarsRover'!
DireccionCardinalDelMarsRover subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:02:09'!
indicarAlRoverQueMuevaHaciaAtras: marsRover
	marsRover moverHaciaAtrasMirandoAlOeste.! !

!Oeste methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:56'!
indicarAlRoverQueRoteHaciaLaDerecha: marsRover
	marsRover rotarHaciaLaDerechaMirandoAlOeste.! !

!Oeste methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:35'!
indicarAlRoverQueRoteHaciaLaIzquierda: marsRover
	marsRover rotarHaciaLaIzquierdaMirandoAlOeste.! !

!Oeste methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:46'!
indicarAlRoverQueSeMuevaHaciaAdelante: marsRover
	marsRover moverHaciaAdelanteMirandoAlOeste.! !


!classDefinition: #Sur category: 'MarsRover'!
DireccionCardinalDelMarsRover subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:02:09'!
indicarAlRoverQueMuevaHaciaAtras: marsRover
	marsRover moverHaciaAtrasMirandoAlSur.! !

!Sur methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:57'!
indicarAlRoverQueRoteHaciaLaDerecha: marsRover
	marsRover rotarHaciaLaDerechaMirandoAlSur.! !

!Sur methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:35'!
indicarAlRoverQueRoteHaciaLaIzquierda: marsRover
	marsRover rotarHaciaLaIzquierdaMirandoAlSur.! !

!Sur methodsFor: 'OrdenesParaElRover' stamp: 'get 6/1/2022 00:01:46'!
indicarAlRoverQueSeMuevaHaciaAdelante: marsRover
	marsRover moverHaciaAdelanteMirandoAlSur.! !


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


!MarsRover methodsFor: 'Public - Comando' stamp: 'get 5/31/2022 23:43:02'!
recibirComando: secuenciaDeComandos 
	
	
	secuenciaDeComandos do:[ :unComando  | | comandoAEjecutar |
	
	comandoAEjecutar := ComandosDelMarsRover subclasses detect: [:unTipoDeComando|
		unTipoDeComando esteComandoTeSirve: (unComando asCharacter) .] ifNone: 
		[self error: self class ErrorDeComandoInvalido].
	
	comandoAEjecutar ejecutarComandoEnRover: self.
		
	].! !


!MarsRover methodsFor: 'Testing' stamp: 'GFC 5/29/2022 23:42:23'!
estaEnPosicionMarciana: puntoCoordenado
	^(posicion = puntoCoordenado)! !

!MarsRover methodsFor: 'Testing' stamp: 'GFC 5/30/2022 01:07:36'!
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

!MarsRover methodsFor: 'moverHaciaAtras' stamp: 'get 6/1/2022 00:02:09'!
moverHaciaAtrasUnPunto

	direccionDeAvance indicarAlRoverQueMuevaHaciaAtras: self.! !


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

!MarsRover methodsFor: 'moverHaciaAdelante' stamp: 'get 6/1/2022 00:01:46'!
moverHaciaAdelanteUnPunto.
	direccionDeAvance indicarAlRoverQueSeMuevaHaciaAdelante: self.! !


!MarsRover methodsFor: 'rotarHaciaLaDerecha' stamp: 'get 6/1/2022 00:01:57'!
rotarHaciaLaDerecha
	
	direccionDeAvance indicarAlRoverQueRoteHaciaLaDerecha: self.! !

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


!MarsRover methodsFor: 'rotarHaciaLaIzquierda' stamp: 'get 6/1/2022 00:01:35'!
rotarHaciaLaIzquierda
	direccionDeAvance  indicarAlRoverQueRoteHaciaLaIzquierda: self.
	! !

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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'get 5/31/2022 21:35:56'!
ErrorDeComandoInvalido
	^'El comando ingresado es invalido.'! !
