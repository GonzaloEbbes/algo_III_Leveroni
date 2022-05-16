!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GET 5/16/2022 18:08:59'!
test01ElPrefijoEnviadoNoPuedeSerVacio
	| finder stack |
	
	finder := SentenceFinderByPrefix new.
	stack := OOStack new.
	self AddDefaultSentencesInStack: stack	.
	
	self with: finder find: '' in: stack ifNotDo: SentenceFinderByPrefix emptyPrefixErrorDescription.
	
		
		
		
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GET 5/16/2022 18:09:05'!
test02ElPrefijoNoPuedeContenerEspaciosVacios
	| finder stack |
	
	finder := SentenceFinderByPrefix new.
	stack := OOStack new.
	self AddDefaultSentencesInStack: stack	.
	
	self with: finder find: 'is ' in: stack ifNotDo: SentenceFinderByPrefix emptySpacesInPrefixErrorDescription.
	
		
		
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GET 5/16/2022 18:49:37'!
test03SeEncuentraUnaOracionParaLaSubcadenaIngresadaConCriterioCaseSensitive
	| finder stack expectedCollection |
	
	finder := SentenceFinderByPrefix new.          "No pudimos modularizar las inicializaciones, Smalltalk no lo aceptaba"
	stack := OOStack new.                                   "devolvia: Cannot store into:"
	self AddDefaultSentencesInStack: stack	.               
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'Winter is here'.
	
	self assert: (finder find: 'Wint' inSentenceStack: stack) = expectedCollection.
	

	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GFC 5/16/2022 01:31:36'!
test04SeEncuentraMasDeUnaOracionParaLaSubcadenaIngresadaConCriterioCaseSensitive
	| finder stack expectedCollection resultCollection |
	
	finder := SentenceFinderByPrefix new.
	stack := OOStack new.
	stack push: 'Winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'Winter is here'.
	expectedCollection add: 'Winter is coming'.
	
	resultCollection := finder find: 'Wint' inSentenceStack: stack.
	
	self assert: resultCollection = expectedCollection.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GET 5/16/2022 18:28:34'!
test05NoFuncionaCriterioCaseInsensitive

	| finder stack |
	
	finder := SentenceFinderByPrefix new.
	stack := OOStack new.
	self AddDefaultSentencesInStack: stack.

	
	self assert: (finder find: 'the' inSentenceStack: stack) size = 0.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GET 5/16/2022 18:34:31'!
test06ElStackNoCambiaDeOrdenCuandoEncuentraOracion

	| finder usedStack originalStack|
	
	finder := SentenceFinderByPrefix new.
	usedStack := OOStack new.
	self AddDefaultSentencesInStack: usedStack	.
	
	
	originalStack := OOStack new.
	self AddDefaultSentencesInStack: originalStack	.
	
	finder find: 'winning' inSentenceStack: usedStack.
	
	self compare: originalStack with: usedStack .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GET 5/16/2022 18:34:39'!
test07ElStackNoCambiaDeOrdenCuandoNoEncuentraOracion

	| finder usedStack originalStack|
	
	finder := SentenceFinderByPrefix new.
	usedStack := OOStack new.
	self AddDefaultSentencesInStack: usedStack	.
	
	originalStack := OOStack new.
	self AddDefaultSentencesInStack: originalStack	.
	
	finder find: 'WeLoveLeveroniCatedra' inSentenceStack: usedStack.
	
	self compare: originalStack with: usedStack .! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'GFC 5/16/2022 01:24:54'!
test08LaSubcadenaNoSeEncuentraEnNingunaOracion
	| finder stack expectedCollection |
	
	finder := SentenceFinderByPrefix new.
	stack := OOStack new.
	self AddDefaultSentencesInStack: stack	.
	
	expectedCollection := OrderedCollection new.
	
	self assert: (finder find: 'Nada' inSentenceStack: stack) = expectedCollection.
	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'GFC 5/16/2022 00:27:24'!
AddDefaultSentencesInStack: aStack	 
	aStack push: 'winter is coming'.
	aStack push: 'winning is everything'.
	aStack push: 'The winds of Winter'.
	aStack push: 'Winter is here'.! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'GET 5/16/2022 18:33:01'!
compare: aStack with: anotherStack
	
	[aStack size > 0] whileTrue: [ | elementFromOriginalStack elementFromUsedStack |
		elementFromOriginalStack := aStack pop.
		elementFromUsedStack := anotherStack pop.
		self assert: elementFromUsedStack = elementFromOriginalStack.
		].	

	! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'GET 5/16/2022 18:05:07'!
with: aFinder find: aPrefix in: aStack ifNotDo: expectedError
	
	
	self
		should: [ aFinder find: aPrefix inSentenceStack: aStack. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ : anError |
			self assert: anError messageText = expectedError ].
		
		
		
		! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'public - Initialization' stamp: 'GFC 5/15/2022 22:11:00'!
initialize
	estado := EmptyState new.
	stack := OrderedCollection new.! !


!OOStack methodsFor: 'public - Operations' stamp: 'GFC 5/15/2022 22:13:22'!
isEmpty
	^estado isEmptyTheStack: self.! !

!OOStack methodsFor: 'public - Operations' stamp: 'GFC 5/15/2022 22:50:31'!
isEmptyTheOrderedCollection
	^self size = 0. 

	! !

!OOStack methodsFor: 'public - Operations' stamp: 'GFC 5/15/2022 22:37:29'!
pop
	^estado popInStack: self.
	


	
	
	! !

!OOStack methodsFor: 'public - Operations' stamp: 'GFC 5/15/2022 22:37:23'!
push: aString 

	estado push: aString InStack: self.
! !

!OOStack methodsFor: 'public - Operations' stamp: 'GFC 5/15/2022 22:23:56'!
size
	^estado sizeOfStack: self.! !

!OOStack methodsFor: 'public - Operations' stamp: 'GFC 5/15/2022 22:37:16'!
top
	^estado topOfStack: self.
	! !


!OOStack methodsFor: 'private - EmptyStack Operations' stamp: 'GFC 5/15/2022 22:12:59'!
isEmptyWhenStackIsEmpty
	^true
	! !

!OOStack methodsFor: 'private - EmptyStack Operations' stamp: 'GFC 5/15/2022 21:58:23'!
popInEmptyStack
	^self error: self class stackEmptyErrorDescription .! !

!OOStack methodsFor: 'private - EmptyStack Operations' stamp: 'GFC 5/15/2022 22:01:34'!
pushInEmptyStack: aString
	estado := NotEmptyState new.
	stack add: aString .! !

!OOStack methodsFor: 'private - EmptyStack Operations' stamp: 'GFC 5/15/2022 22:16:38'!
sizeWhenStackisEmpty
	^0.! !

!OOStack methodsFor: 'private - EmptyStack Operations' stamp: 'GFC 5/15/2022 22:00:02'!
topOfEmptyStack
	^self error: self class stackEmptyErrorDescription .! !


!OOStack methodsFor: 'private - NotEmptyStack Operations' stamp: 'GFC 5/15/2022 23:10:49'!
isEmptyWhenStackIsNotEmpty
	^false. 

	! !

!OOStack methodsFor: 'private - NotEmptyStack Operations' stamp: 'GET 5/16/2022 18:50:21'!
popInNotEmptyStack
	|poppedElement|
	
	poppedElement := stack removeLast.
	
	estado := (State subclasses detect: [:aState | (aState IsTheCorrectStateForStack: self)]) new.
	
	^ poppedElement .! !

!OOStack methodsFor: 'private - NotEmptyStack Operations' stamp: 'GFC 5/15/2022 21:59:24'!
pushInNotEmptyStack: aString
	stack add: aString .! !

!OOStack methodsFor: 'private - NotEmptyStack Operations' stamp: 'GFC 5/15/2022 22:17:00'!
sizeWhenStackisNotEmpty
	^ stack size.! !

!OOStack methodsFor: 'private - NotEmptyStack Operations' stamp: 'GFC 5/15/2022 21:59:48'!
topOfNotEmptyStack
	^ stack at: self size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'find - private' stamp: 'GET 5/16/2022 18:48:32'!
findPrefix: aPrefix inStack: aStackObject andKeepPoppedElementsIn: auxiliarStack
	| matchedSentences sentence |
	
	matchedSentences := OrderedCollection new.
		
	[aStackObject size > 0] whileTrue: [  
		sentence := aStackObject pop.
		(sentence beginsWith: aPrefix) ifTrue: [ matchedSentences add: sentence.].
		auxiliarStack push: sentence.
	].

		
	^matchedSentences.! !

!SentenceFinderByPrefix methodsFor: 'find - private' stamp: 'GET 5/16/2022 18:38:47'!
restoreStack: aStackObject withStack: auxiliarStack

	[auxiliarStack size > 0] whileTrue: [ | sentence |
		sentence := auxiliarStack pop.
		aStackObject push: sentence.
		].
! !

!SentenceFinderByPrefix methodsFor: 'find - private' stamp: 'GET 5/16/2022 18:43:30'!
validateIfEmptyPrefixIn: aPrefix

	(aPrefix = '') ifTrue: [^self error: self class emptyPrefixErrorDescription.].! !

!SentenceFinderByPrefix methodsFor: 'find - private' stamp: 'GET 5/16/2022 18:42:26'!
validateIfEmptySpacesInPrefix: aPrefix

	((aPrefix indexOf: $ ) = 0) ifFalse: [^self error: self class emptySpacesInPrefixErrorDescription.].
	! !

!SentenceFinderByPrefix methodsFor: 'find - private' stamp: 'GET 5/16/2022 18:49:01'!
validateInPrefix: aPrefix
	
	self validateIfEmptySpacesInPrefix: aPrefix.
	self validateIfEmptyPrefixIn: aPrefix.
! !


!SentenceFinderByPrefix methodsFor: 'find - public' stamp: 'GET 5/16/2022 18:47:55'!
find: aPrefix inSentenceStack: aStackObject
	
	| matchedSentences auxiliarStack|
	
	self validateInPrefix: aPrefix.
	auxiliarStack := OOStack new.
	
	matchedSentences := self findPrefix: aPrefix inStack: aStackObject andKeepPoppedElementsIn: auxiliarStack.
	
	self restoreStack: aStackObject withStack: auxiliarStack.
	
	^matchedSentences.
	
	
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'GFC 5/15/2022 23:44:55'!
emptyPrefixErrorDescription
	^'No se puede buscar un prefijo vacio'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'GFC 5/15/2022 23:47:03'!
emptySpacesInPrefixErrorDescription
	^'No se puede buscar un prefijo con espacios vacios'! !


!classDefinition: #State category: 'Stack-Exercise'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!State methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:14:18'!
isEmptyTheStack: aStackObject
	self subclassResponsibility.! !

!State methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:31:59'!
popInStack: stackObject
	self subclassResponsibility .! !

!State methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:31:46'!
push: aString InStack: stackObject 
	self subclassResponsibility. ! !

!State methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:17:25'!
sizeOfStack: aStackObject
	self subclassResponsibility .! !

!State methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:31:23'!
topOfStack: stackObject
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'State class' category: 'Stack-Exercise'!
State class
	instanceVariableNames: ''!

!State class methodsFor: 'as yet unclassified' stamp: 'GFC 5/15/2022 23:05:36'!
isEmptyTheStack: aStackObject
	self subclassResponsibility.! !


!classDefinition: #EmptyState category: 'Stack-Exercise'!
State subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:15:13'!
isEmptyTheStack: aStackObject
	^aStackObject  isEmptyWhenStackIsEmpty.! !

!EmptyState methodsFor: 'DoubleDispatch' stamp: 'GET 5/16/2022 18:50:48'!
popInStack: StackObject
	^StackObject popInEmptyStack.
	! !

!EmptyState methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:31:46'!
push: aString InStack: aStackObject
	 aStackObject pushInEmptyStack: aString.! !

!EmptyState methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:17:53'!
sizeOfStack: aStackObject
	^aStackObject sizeWhenStackisEmpty.! !

!EmptyState methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:31:23'!
topOfStack: stackObject
	^stackObject  topOfEmptyStack.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: 'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'as yet unclassified' stamp: 'GFC 5/15/2022 23:04:47'!
IsTheCorrectStateForStack: aStackObject
	^(aStackObject isEmptyTheOrderedCollection).! !


!classDefinition: #NotEmptyState category: 'Stack-Exercise'!
State subclass: #NotEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyState methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:15:28'!
isEmptyTheStack: aStackObject
	^aStackObject  isEmptyWhenStackIsNotEmpty.! !

!NotEmptyState methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:31:59'!
popInStack: StackObject
	^StackObject popInNotEmptyStack.
	! !

!NotEmptyState methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:31:46'!
push: aString InStack: aStackObject
	 aStackObject pushInNotEmptyStack: aString.! !

!NotEmptyState methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:18:00'!
sizeOfStack: aStackObject
	^aStackObject sizeWhenStackisNotEmpty.! !

!NotEmptyState methodsFor: 'DoubleDispatch' stamp: 'GFC 5/15/2022 22:31:23'!
topOfStack: stackObject
	^stackObject  topOfNotEmptyStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyState class' category: 'Stack-Exercise'!
NotEmptyState class
	instanceVariableNames: ''!

!NotEmptyState class methodsFor: 'as yet unclassified' stamp: 'GFC 5/15/2022 23:05:15'!
IsTheCorrectStateForStack: aStackObject
	^(aStackObject isEmptyTheOrderedCollection) = false.! !
