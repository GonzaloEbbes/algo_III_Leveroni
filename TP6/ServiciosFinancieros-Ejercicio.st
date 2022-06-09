!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'contains transaction' stamp: 'GET 6/8/2022 23:25:58'!
test04SearchingForATransactionInAnEmptyPortfolioReturnsFalse

	| portfolio account aTransaction |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	aTransaction := Deposit register: 400 * peso on: account.
	
	self assert: (portfolio containsTransaction: aTransaction) equals: false.! !

!PortfolioTest methodsFor: 'contains transaction' stamp: 'GET 6/9/2022 16:15:20'!
test05SearchingForATransactionOnAPortfolioThatContainsTheAccountThatContainsTheTransactionReturnsTrue

	| portfolio account aTransaction |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	aTransaction := Deposit register: 400 * peso on: account.
	
	portfolio addAccount: account.
	
	self assert: (portfolio containsTransaction: aTransaction) equals: true.! !

!PortfolioTest methodsFor: 'contains transaction' stamp: 'GET 6/9/2022 16:12:14'!
test06SearchingForATransactionOnAPortfolioWhichContainsAPortfolioThatContainsTheTransactionReturnsTrue

	| portfolio account aTransaction anotherPortfolio |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	anotherPortfolio := Portfolio new.
	
	aTransaction := Deposit register: 400 * peso on: account.
	
	anotherPortfolio addAccount: account.
	portfolio addAccount: anotherPortfolio.
	
	self assert: (portfolio containsTransaction: aTransaction) equals: true.! !


!PortfolioTest methodsFor: 'transactions from an account' stamp: 'GET 6/9/2022 01:23:13'!
test07AskingTransactionsFromAnEmptyReceptiveAccountContainedInAPortfolioReturnsEmptyContainer
	| portfolio account transactions |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	transactions := account transactions.
	
	portfolio addAccount: account.
	
	self assert: transactions equals: (portfolio getTransactionsFrom: account).! !

!PortfolioTest methodsFor: 'transactions from an account' stamp: 'GET 6/9/2022 01:23:22'!
test08AskingTransactionsFromANonEmptyReceptiveAccountContainedInAPortfolioReturnsNonEmptyContainer
	| portfolio account transactions |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	Deposit register: 400 * peso on: account .
	
	transactions := account transactions.
	
	portfolio addAccount: account.
	
	self assert: transactions equals: (portfolio getTransactionsFrom: account).! !

!PortfolioTest methodsFor: 'transactions from an account' stamp: 'GET 6/9/2022 16:25:14'!
test09AskingTransactionsFromAReceptiveAccountCointainedInAPortfolioCointainedInAPortfolioReturnsTheReceptiveAccountTransactions
	| portfolio account anotherPortfolio transactions |
	
	portfolio := Portfolio new.
	
	anotherPortfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	Deposit register: 400 * peso on: account .
	
	transactions := account transactions.
	
	anotherPortfolio addAccount: account.
	
	portfolio addAccount: anotherPortfolio.
	
	self assert: transactions equals: (portfolio getTransactionsFrom: account).! !

!PortfolioTest methodsFor: 'transactions from an account' stamp: 'GET 6/9/2022 01:35:21'!
test10AskingTransactionsFromAPortfolioContainedInAPorfolioReturnsThePortfolioTransactions
	
	| portfolio account anotherPortfolio transactions |
	
	portfolio := Portfolio new.
	
	anotherPortfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	Deposit register: 400 * peso on: account .
	
	anotherPortfolio addAccount: account.
	
	portfolio addAccount: anotherPortfolio.
	
	transactions := anotherPortfolio transactions.
	
	self assert: transactions equals: (portfolio getTransactionsFrom: anotherPortfolio).! !

!PortfolioTest methodsFor: 'transactions from an account' stamp: 'GET 6/9/2022 01:14:59'!
test11CannotAskTransactionsFromAReceptiveAccountThatIsNotContainedInThePortfolio

	| portfolio account  |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	Deposit register: 400 * peso on: account .
	
	self
		should: [ portfolio getTransactionsFrom: account]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio accountIsNotContained ]! !


!PortfolioTest methodsFor: 'basic and balance' stamp: 'GET 6/6/2022 20:54:44'!
test01AnEmptyPortfolioHasZeroBalance
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'basic and balance' stamp: 'GET 6/6/2022 20:58:25'!
test02APortfolioWithAnAccountHasTheAccountBalanceInPortfolioBalance
	| portfolio account |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	portfolio addAccount: account.
	
	self assert: 100 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'basic and balance' stamp: 'GET 6/6/2022 21:23:11'!
test03APortfolioWithManyAccountsHasAllTheAccountBalancesInThePortfolioBalance
	| portfolio account anotherAccount |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	anotherAccount := ReceptiveAccount new.
	Withdraw register: 400 * peso on: anotherAccount.
	
	portfolio addAccount: account.
	portfolio addAccount: anotherAccount.
	
	self assert: (-300) * peso equals: portfolio balance.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'get 6/3/2022 23:47:28'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) transactionValue
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'GET 6/8/2022 22:57:52'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account containsTransaction: deposit).
	self assert: (account containsTransaction: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'GET 6/8/2022 22:57:52'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit transactionFor: 100 * peso.
	withdraw := Withdraw transactionFor: 50 * peso.
		
	self deny: (account containsTransaction: deposit).
	self deny: (account containsTransaction: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'get 6/3/2022 23:40:17'!
test07AccountKnowsItsTransactions 

	| account deposit anotherDeposit withdraw |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
	withdraw := Withdraw register: 20 * peso  on: account .
	anotherDeposit := Deposit register: 220 * peso  on: account .
	
		
	self assert: 3 equals: account transactions size.
	self assert: (account transactions includes: deposit).
	self assert: (account transactions includes: withdraw). 
	self assert: (account transactions includes: anotherDeposit). 

	
	
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'GET 6/4/2022 00:46:58'!
test1CanTransferZeroPesos

	| debitAccount creditAccount |
	
	debitAccount := ReceptiveAccount new.
	creditAccount := ReceptiveAccount new.
	
	Transfer register: 0* peso from: debitAccount  to: creditAccount .
	
	self assert: creditAccount balance equals: 0 * peso ! !

!TransferTest methodsFor: 'tests' stamp: 'GET 6/9/2022 01:44:09'!
test2TransferAffectsDebitAccountBalance

	| debitAccount creditAccount|
	
	debitAccount := ReceptiveAccount new.
	creditAccount := ReceptiveAccount new.
	
	self transfer: 0 * peso From: debitAccount  to: creditAccount  andCheckBalanceOf: debitAccount. 
	
	"Transfer register: 10* peso from: debitAccount  to: creditAccount .
	
	self assert: -10 * peso equals: debitAccount balance."! !

!TransferTest methodsFor: 'tests' stamp: 'GET 6/4/2022 00:48:23'!
test3TransferAffectsCreditAccountBalance

	| debitAccount creditAccount|
	
	debitAccount := ReceptiveAccount new.
	creditAccount := ReceptiveAccount new.
	
	Transfer register: 10* peso from: debitAccount  to: creditAccount .
	
	self assert: 10 * peso equals: creditAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'GET 6/4/2022 01:33:12'!
test4QueryTransferValue

	| debitAccount creditAccount transferOperation |
	
	debitAccount := ReceptiveAccount new.
	creditAccount := ReceptiveAccount new.
	
	transferOperation := Transfer register: 10* peso from: debitAccount  to: creditAccount .
	
	self assert: 10 * peso equals: transferOperation transactionValue .! !

!TransferTest methodsFor: 'tests' stamp: 'GET 6/4/2022 02:04:35'!
test5CreditAccountCounterpartIsDebitAccount

	| debitAccount creditAccount transferOperation |
	
	debitAccount := ReceptiveAccount new.
	creditAccount := ReceptiveAccount new.
	
	transferOperation := Transfer register: 10* peso from: debitAccount  to: creditAccount .
	
	self assert: debitAccount equals: (creditAccount counterpartIn: transferOperation ).
	
	! !

!TransferTest methodsFor: 'tests' stamp: 'GET 6/4/2022 02:04:24'!
test6DebitAccountCounterpartIsCreditAccount


	| debitAccount creditAccount transferOperation |
	
	debitAccount := ReceptiveAccount new.
	creditAccount := ReceptiveAccount new.
	
	transferOperation := Transfer register: 10* peso from: debitAccount  to: creditAccount .
	
	self assert: creditAccount equals: (debitAccount counterpartIn: transferOperation ).
	
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'get 6/3/2022 23:47:28'!
transactionValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'GET 6/4/2022 01:08:43'!
transactionValueForBalanceIn: anAccount

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'get 6/3/2022 23:25:34'!
register: aValue on: account

	| transaction |
	
	transaction := self transactionFor: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'get 6/3/2022 23:47:28'!
transactionValue

	^ value! !

!Deposit methodsFor: 'value' stamp: 'GET 6/4/2022 01:09:14'!
transactionValueForBalanceIn: anAccount

	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'get 6/3/2022 23:25:34'!
transactionFor: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'value debitAccount creditAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'GET 6/4/2022 00:36:08'!
initializeFor: aValue from: aDebitAccount to: aCreditAccount

	debitAccount := aDebitAccount.
	creditAccount := aCreditAccount .
	value := aValue.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'GET 6/4/2022 01:51:36'!
transactionCreditAccount

	^ creditAccount ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'GET 6/4/2022 01:52:07'!
transactionDebitAccount

	^ debitAccount ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'get 6/3/2022 23:47:28'!
transactionValue

	^ value! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'GET 6/4/2022 01:55:51'!
transactionValueForBalanceIn: anAccount

	( debitAccount  = anAccount) ifTrue: [^ value negated] .
	
	( creditAccount  = anAccount) ifTrue: [^ value ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'GET 6/4/2022 00:45:36'!
register: aValue from: aDebitAccount to: aCreditAccount

	| transaction |
	
	transaction := self transactionFor: aValue from: aDebitAccount  to: aCreditAccount .
	
	aDebitAccount register: transaction.
	aCreditAccount register: transaction.
		
	^ transaction! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'GET 6/4/2022 00:37:35'!
transactionFor: aValue from: aDebitAccount to: aCreditAccount

	^ self new initializeFor: aValue from: aDebitAccount to: aCreditAccount .! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'GET 6/2/2022 21:15:01'!
initializeFor: aValue

	value := aValue.! !


!Withdraw methodsFor: 'value' stamp: 'get 6/3/2022 23:47:28'!
transactionValue

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'GET 6/4/2022 01:08:43'!
transactionValueForBalanceIn: anAccount

	^ value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'get 6/3/2022 23:25:34'!
transactionFor: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'public' stamp: 'GET 6/6/2022 21:09:42'!
addAccount: anAccount
 
	accounts add: anAccount .! !

!Portfolio methodsFor: 'public' stamp: 'GET 6/6/2022 21:11:57'!
balance
	
	^accounts sum: [ :anAccount | 
		anAccount  balance .
	
		] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'public' stamp: 'GET 6/9/2022 16:08:31'!
containsTransaction: aTransaction 

	accounts detect: [ :anAccount | 
		anAccount containsTransaction: aTransaction.] 
		ifFound: [:anAccount | ^true.] 
		ifNone: [^false].! !

!Portfolio methodsFor: 'public' stamp: 'GET 6/6/2022 21:09:31'!
initialize
	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'public' stamp: 'GET 6/9/2022 16:41:31'!
isOrContainesAccount: anAccount
	self = anAccount ifTrue: [^ true].
	
	accounts do: [:anAccountFromPortfolio | 
		^ (anAccountFromPortfolio isOrContainesAccount: anAccount ).].
	
	^ false.! !

!Portfolio methodsFor: 'public' stamp: 'GET 6/9/2022 01:29:40'!
transactions
	| transactions |
	transactions := OrderedCollection new.
	accounts do: [:anAccount |
		transactions addAllLast: ( anAccount transactions).].
	
	^transactions.! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'GET 6/9/2022 16:50:54'!
getTransactionsFrom: expectedAccount
	self = expectedAccount ifTrue: [^ self transactions].
	
	accounts do: [:anAccount|
		(anAccount isOrContainesAccount: 	expectedAccount ) 
		ifTrue: [^anAccount getTransactionsFrom: expectedAccount ].].
	
	^self error: self class accountIsNotContained.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'GET 6/9/2022 01:10:36'!
accountIsNotContained
	^'The account searched is not in the portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'GET 6/4/2022 01:22:26'!
balance
	
	^transactions sum: [ :aTransaction | 
		aTransaction transactionValueForBalanceIn: self .
	
		] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'GET 6/8/2022 22:57:52'!
containsTransaction: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'GET 6/4/2022 01:56:41'!
counterpartIn: aTransfer
	
	aTransfer transactionCreditAccount = self ifTrue: [^aTransfer transactionDebitAccount ].
	
	aTransfer transactionDebitAccount = self ifTrue: [^aTransfer transactionCreditAccount ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'GET 6/9/2022 16:48:00'!
getTransactionsFrom: expectedAccount
	^ self transactions.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'GET 6/9/2022 16:46:34'!
isOrContainesAccount: anAccount
	^ self = anAccount .! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'GET 6/2/2022 21:15:38'!
register: aTransaction
	
	transactions add: aTransaction.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
