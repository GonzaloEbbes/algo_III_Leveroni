!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'GET 4/30/2022 01:28:42'!
CalculateTimeOf: aBlock
        
       |millisecondsBeforeRunning millisecondsAfterRunning|

	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ (millisecondsAfterRunning-millisecondsBeforeRunning)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GET 4/30/2022 01:33:20'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook|
		
	customerBook := CustomerBook new.
	
	self assert: (self CalculateTimeOf: [customerBook addCustomerNamed: 'John Lennon']) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GET 4/30/2022 01:35:45'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: 'Paul McCartney'.
	
	self assert: (self CalculateTimeOf: [customerBook removeCustomerNamed: 'Paul McCartney']) < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HAW 8/28/2017 08:57:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:25'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2020 09:08:46'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 9/19/2018 17:57:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'GET 4/30/2022 00:02:51'!
includesActiveCustomerNamed: aCustomerName

	^(active includes: aCustomerName)! !

!CustomerBook methodsFor: 'testing' stamp: 'GET 4/30/2022 00:05:28'!
includesCustomerNamed: aCustomerName

	^(self includesActiveCustomerNamed: aCustomerName) or:  (self includesSuspendedCustomerNamed:  aCustomerName)! !

!CustomerBook methodsFor: 'testing' stamp: 'GET 4/30/2022 00:02:41'!
includesSuspendedCustomerNamed: aCustomerName

	^(suspended includes: aCustomerName)! !

!CustomerBook methodsFor: 'testing' stamp: 'GET 4/30/2022 01:41:09'!
isEmpty
	
	^active isEmpty and: (suspended isEmpty )! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'GET 4/30/2022 00:52:09'!
addCustomerNamed: aCustomerName

	aCustomerName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aCustomerName ) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aCustomerName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'GET 4/29/2022 23:39:22'!
numberOfCustomers
	
	^ (self numberOfActiveCustomers + self numberOfSuspendedCustomers )! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'GET 4/30/2022 00:53:52'!
removeCustomerNamed: aCustomerName 
 
	(self includesActiveCustomerNamed: aCustomerName) ifTrue: [
	^(self removeFrom: active aCustomerNamed: aCustomerName)].

	(self includesSuspendedCustomerNamed: aCustomerName) ifTrue: [
	^(self removeFrom: suspended aCustomerNamed: aCustomerName)].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'GET 4/30/2022 01:06:05'!
removeFrom: aCollection aCustomerNamed: aCostumerNamed

       aCollection remove: aCostumerNamed ifAbsent: []! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'GET 4/30/2022 00:45:31'!
suspendCustomerNamed: aName 
	
	(self includesActiveCustomerNamed: aName) ifFalse: [^CantSuspend signal].
	
	self removeFrom: active  aCustomerNamed: aName .
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
