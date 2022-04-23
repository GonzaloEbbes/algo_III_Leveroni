!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'Reproduccion - public' stamp: 'GFC 4/23/2022 19:25:56'!
intentarReproducirse
	|firmaGeneticaDelHuevoARobar|
	firmaGeneticaDelHuevoARobar := self verSiHayHuevosParaRobar.
	
	(firmaGeneticaDelHuevoARobar = 'ninguno') ifFalse: [
	habitat agregarHuevoConFirmaGenetica: 'Lara'.
	habitat eliminarHuevoConFirmaGenetica: firmaGeneticaDelHuevoARobar
	].! !


!AvispaLara class methodsFor: 'Reproduccion - private' stamp: 'GFC 4/23/2022 18:29:43'!
verSiHayHuevosParaRobar
	|firmaGeneticaDelHuevoARobar|
	firmaGeneticaDelHuevoARobar := 'ninguno'.
	(habitat CantidadDeHuevosConFirmaGeneticaDeTipo: 'OrianaYOrnella')  > 0 ifTrue: [
	firmaGeneticaDelHuevoARobar := 'OrianaYOrnella'	].
	(habitat CantidadDeHuevosConFirmaGeneticaDeTipo: 'Polly')  > 0 ifTrue: [
	firmaGeneticaDelHuevoARobar := 'Polly'	].
	^firmaGeneticaDelHuevoARobar.
! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'Reproduccion - public' stamp: 'GFC 4/23/2022 19:23:42'!
intentarReproducirse
	self hayOrugasSuficientes ifTrue: [
	habitat agregarUnHuevo. 
	habitat agregarHuevoConFirmaGenetica: 'OrianaYOrnella'.
	habitat eliminarUnaOruga.
	].! !


!AvispaOriana class methodsFor: 'Reproduccion - private' stamp: 'GFC 4/23/2022 19:23:20'!
hayOrugasSuficientes
	^(habitat cantidadDeOrugas  > 0)! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOrnella class' category: 'AvispasYAbejasParte2'!
AvispaOrnella class
	instanceVariableNames: ''!

!AvispaOrnella class methodsFor: 'Reproduccion - public' stamp: 'GFC 4/23/2022 19:22:49'!
intentarReproducirse
	self hayOrugasSuficientes ifTrue: [
	habitat agregarUnHuevo. 
	habitat agregarHuevoConFirmaGenetica: 'OrianaYOrnella'.
	habitat eliminarUnaOruga.
	].! !


!AvispaOrnella class methodsFor: 'Reproduccion - private' stamp: 'GFC 4/23/2022 19:22:03'!
hayOrugasSuficientes
	^(habitat cantidadDeOrugas  > 0)! !


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'Reproduccion - private' stamp: 'GFC 4/23/2022 19:25:13'!
hayPolillasSuficientes
	^(habitat cantidadDePolillas  > 0).! !


!AvispaPolly class methodsFor: 'Reproduccion - public' stamp: 'GFC 4/23/2022 19:25:33'!
intentarReproducirse
	self hayPolillasSuficientes ifTrue: [
	habitat agregarUnHuevo. 
	habitat agregarHuevoConFirmaGenetica: 'Polly'.
	habitat eliminarUnaPolilla.
	].! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'GFC 4/21/2022 19:29:26'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'GFC 4/21/2022 19:29:26'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'GFC 4/21/2022 19:29:26'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'GFC 4/21/2022 19:29:26'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'GFC 4/21/2022 19:29:26'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'GFC 4/21/2022 19:29:26'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'GFC 4/21/2022 19:29:26'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'GFC 4/21/2022 19:29:26'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'GFC 4/21/2022 19:29:26'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'GFC 4/21/2022 19:29:26'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'GFC 4/21/2022 19:29:26'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'GFC 4/21/2022 19:29:26'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'GFC 4/21/2022 19:29:26'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 17:57:09'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^(habitat CantidadDeHuevosConFirmaGeneticaDeTipo: 'Lara').! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 17:57:22'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^(habitat CantidadDeHuevosConFirmaGeneticaDeTipo: 'OrianaYOrnella').! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 17:57:33'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^(habitat CantidadDeHuevosConFirmaGeneticaDeTipo: 'OrianaYOrnella').! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 17:57:41'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^(habitat CantidadDeHuevosConFirmaGeneticaDeTipo: 'Polly').! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/21/2022 19:47:31'!
habitat
	^habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 16:19:11'!
hacerQueElHabitatTengaLosRecursosSuficientes
	habitat queHayaRecursosSuficientes.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 18:01:16'!
laAvispaLara
	^AvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/21/2022 19:53:06'!
laAvispaOriana
	^AvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 16:35:32'!
laAvispaOrnella
	^AvispaOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 16:40:43'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 19:15:38'!
queElHabitatTengaDosOrugasMas
	habitat agregarOrugas: 2! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 19:15:53'!
queElHabitatTengaDosPolillasMas
	habitat agregarPolillas: 2. ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/21/2022 20:14:58'!
queElHabitatTengaUnaOrugaMas
	habitat agregarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/23/2022 16:41:40'!
queElHabitatTengaUnaPolillaMas
	habitat agregarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GFC 4/21/2022 20:04:36'!
retrocederElHabitatAlInicioDeLosTiempos
	habitat inicializarHabitat! !


!classDefinition: #habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'habitat class' category: 'AvispasYAbejasParte2'!
habitat class
	instanceVariableNames: 'cantidadDePolillas cantidadDeHuevos cantidadDeOrugas cantidadDeHuevosPorFirmaGenetica'!

!habitat class methodsFor: 'huevos - public' stamp: 'GFC 4/23/2022 17:54:25'!
CantidadDeHuevosConFirmaGeneticaDeTipo: FirmaGenetica 
	^(cantidadDeHuevosPorFirmaGenetica at: FirmaGenetica).! !

!habitat class methodsFor: 'huevos - public' stamp: 'GFC 4/23/2022 17:50:12'!
agregarHuevoConFirmaGenetica: FirmaGenetica 
	|cantidadNuevaDeHuevosDeFirmaGenetica|
	cantidadNuevaDeHuevosDeFirmaGenetica := (cantidadDeHuevosPorFirmaGenetica at: FirmaGenetica) + 1.
	
	cantidadDeHuevosPorFirmaGenetica at: FirmaGenetica put: cantidadNuevaDeHuevosDeFirmaGenetica.! !

!habitat class methodsFor: 'huevos - public' stamp: 'GFC 4/21/2022 20:09:04'!
agregarUnHuevo
	cantidadDeHuevos := cantidadDeHuevos + 1.! !

!habitat class methodsFor: 'huevos - public' stamp: 'GFC 4/21/2022 19:59:00'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevos! !

!habitat class methodsFor: 'huevos - public' stamp: 'GFC 4/23/2022 18:15:40'!
eliminarHuevoConFirmaGenetica: FirmaGenetica 
	|cantidadNuevaDeHuevosDeFirmaGenetica|
	cantidadNuevaDeHuevosDeFirmaGenetica := (cantidadDeHuevosPorFirmaGenetica at: FirmaGenetica) - 1.
	
	cantidadDeHuevosPorFirmaGenetica at: FirmaGenetica put: cantidadNuevaDeHuevosDeFirmaGenetica.! !


!habitat class methodsFor: 'Condiciones - public' stamp: 'GFC 4/23/2022 17:25:41'!
inicializarHabitat
	cantidadDeHuevos  := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas  := 0.
	cantidadDeHuevosPorFirmaGenetica := Dictionary new.
	cantidadDeHuevosPorFirmaGenetica at: 'OrianaYOrnella' put:  0.
	cantidadDeHuevosPorFirmaGenetica at: 'Polly' put: 0.
	cantidadDeHuevosPorFirmaGenetica at: 'Lara' put:  0.
	
	! !

!habitat class methodsFor: 'Condiciones - public' stamp: 'GFC 4/23/2022 17:04:04'!
queHayaRecursosSuficientes
	self agregarOrugas: 10.
	self agregarPolillas: 10.! !


!habitat class methodsFor: 'Polillas - public' stamp: 'GFC 4/23/2022 17:07:43'!
agregarPolillas: PolillasAAgregar 
	cantidadDePolillas := cantidadDePolillas + PolillasAAgregar.! !

!habitat class methodsFor: 'Polillas - public' stamp: 'GFC 4/23/2022 16:59:06'!
agregarUnaPolilla
	cantidadDePolillas  := cantidadDePolillas + 1.! !

!habitat class methodsFor: 'Polillas - public' stamp: 'GFC 4/23/2022 17:00:59'!
cantidadDePolillas
	^cantidadDePolillas.! !

!habitat class methodsFor: 'Polillas - public' stamp: 'GFC 4/23/2022 17:02:53'!
eliminarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !


!habitat class methodsFor: 'Orugas - public' stamp: 'GFC 4/23/2022 16:29:37'!
agregarOrugas: OrugasAAgregar 
	cantidadDeOrugas := cantidadDeOrugas + OrugasAAgregar.! !

!habitat class methodsFor: 'Orugas - public' stamp: 'GFC 4/21/2022 20:16:50'!
agregarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas + 1! !

!habitat class methodsFor: 'Orugas - public' stamp: 'GFC 4/21/2022 20:19:36'!
cantidadDeOrugas
	^cantidadDeOrugas! !

!habitat class methodsFor: 'Orugas - public' stamp: 'GFC 4/21/2022 20:21:37'!
eliminarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !


!habitat class methodsFor: '--** private fileout/in **--' stamp: 'GFC 4/23/2022 19:30:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDePolillas := 0.
	cantidadDeHuevos := 0.
	cantidadDeOrugas := 0.
	cantidadDeHuevosPorFirmaGenetica := ((Dictionary new) add: ('Lara'->0); add: ('OrianaYOrnella'->0); add: ('Polly'->0); yourself).! !

habitat initializeAfterFileIn!