!classDefinition: #AccountReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountReportTest
	instanceVariableNames: 'destinationAccount originAccount transactionGenericAccount familyPortfolio myAccount childrenPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountReportTest methodsFor: 'Account Summary Tests' stamp: 'GFC 6/15/2022 00:23:54'!
test01AccountSummaryEmptyForEmptyAccount
	transactionGenericAccount _ ReceptiveAccount new.
	self assert: (self createExpectedReportOfEmptyAccount) equals: (AccountSummary of: transactionGenericAccount ).
	
	
! !

!AccountReportTest methodsFor: 'Account Summary Tests' stamp: 'GFC 6/15/2022 00:22:07'!
test02AccountSummaryReportsDeposit
	self setTransactionAccountAndDoTrasactionOf19PesosNamed: Deposit.	
	self assert: (self createExpectedReportOf: 'Depósito' withAnExpectedBalanceOf: 19 ) equals: (AccountSummary of: transactionGenericAccount ).
	
	
! !

!AccountReportTest methodsFor: 'Account Summary Tests' stamp: 'GFC 6/15/2022 00:19:05'!
test03AccountSummaryReportsWithdraw
	self setTransactionAccountAndDoTrasactionOf19PesosNamed: Withdraw.	
	self assert: (self createExpectedReportOf: 'Extracción' withAnExpectedBalanceOf: -19 ) equals: (AccountSummary of: transactionGenericAccount ).
	
	
! !

!AccountReportTest methodsFor: 'Account Summary Tests' stamp: 'GFC 6/15/2022 00:19:51'!
test04AccountSummaryReportsWithdrawTransferLeg
	self setTransferAccountsAndDoTransferOf19Pesos	.
	self assert: (self createExpectedReportOf: 'Salida por transferencia' withAnExpectedBalanceOf: -19) equals: (AccountSummary of: originAccount).
	
	
! !

!AccountReportTest methodsFor: 'Account Summary Tests' stamp: 'GFC 6/15/2022 00:19:55'!
test05AccountSummaryReportsDepositTransferLeg
	self setTransferAccountsAndDoTransferOf19Pesos.
	self assert: (self createExpectedReportOf: 'Entrada por transferencia' withAnExpectedBalanceOf: 19) equals: (AccountSummary of: destinationAccount ).
	
	
! !


!AccountReportTest methodsFor: 'Transfer Net Report Tests' stamp: 'GFC 6/15/2022 00:24:24'!
test06EmptyAccountHasZeroTransferNet
	transactionGenericAccount _ ReceptiveAccount new.
	self assert: 0 equals: (TransferNetReport of: transactionGenericAccount).
	
	
! !

!AccountReportTest methodsFor: 'Transfer Net Report Tests' stamp: 'GFC 6/15/2022 00:26:21'!
test07TransferWithdrawAffectsTransferNet
	self setTransferAccountsAndDoTransferOf19Pesos.
	self assert: -19 * peso equals: (TransferNetReport of: originAccount).
	
	! !

!AccountReportTest methodsFor: 'Transfer Net Report Tests' stamp: 'GFC 6/15/2022 00:26:59'!
test08TransferDepositAffectsTransferNet
	self setTransferAccountsAndDoTransferOf19Pesos.
	self assert: 19 * peso equals: (TransferNetReport of: destinationAccount).
	
	! !


!AccountReportTest methodsFor: 'private' stamp: 'GFC 6/14/2022 23:36:51'!
createExpectedReportOf: transactionStringName withAnExpectedBalanceOf: BalanceValue 
	| expectedReport |
	expectedReport _ OrderedCollection new.
	expectedReport add: (transactionStringName,' por 19 * pesos').
	expectedReport add: ('Balance = ',BalanceValue asString ,' * pesos').
	^expectedReport
! !

!AccountReportTest methodsFor: 'private' stamp: 'GFC 6/15/2022 00:10:51'!
createExpectedReportOfEmptyAccount
	| expectedReport |
	expectedReport _ OrderedCollection new.
	expectedReport add: 'Balance = 0 * pesos'.
	^expectedReport .
	
! !

!AccountReportTest methodsFor: 'private' stamp: 'GFC 6/16/2022 03:25:58'!
createTreeExpectedReportWith: nameOfAccount

	| expectedReport |
	expectedReport := OrderedCollection new.
	expectedReport add: nameOfAccount.
	^expectedReport.
	! !

!AccountReportTest methodsFor: 'private' stamp: 'GFC 6/16/2022 03:20:04'!
createTreeExpectedReportWith: nameOfAccount with: nameOfSecondAccount

	| expectedReport |
	expectedReport := OrderedCollection new.
	expectedReport add: nameOfAccount.
	expectedReport add: nameOfSecondAccount.
	^expectedReport.
	! !

!AccountReportTest methodsFor: 'private' stamp: 'GFC 6/16/2022 03:20:39'!
createTreeExpectedReportWith: nameOfAccount with: nameOfSecondAccount with: nameOfThirdAccount

	| expectedReport |
	expectedReport := OrderedCollection new.
	expectedReport add: nameOfAccount.
	expectedReport add: nameOfSecondAccount.
	expectedReport add: nameOfThirdAccount.
	^expectedReport.
	! !

!AccountReportTest methodsFor: 'private' stamp: 'GFC 6/15/2022 00:17:44'!
setTransactionAccountAndDoTrasactionOf19PesosNamed: classOfTransaction
	transactionGenericAccount _ ReceptiveAccount new.
	classOfTransaction register: 19 * peso on: transactionGenericAccount .
	
! !

!AccountReportTest methodsFor: 'private' stamp: 'GFC 6/15/2022 00:04:16'!
setTransferAccountsAndDoTransferOf19Pesos	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer amount: 19 * peso from: originAccount to: destinationAccount.
	! !


!AccountReportTest methodsFor: 'PortfolioTreePrinter Tests' stamp: 'GFC 6/16/2022 03:27:17'!
test09ShowEmptyPortfolioTree
	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	self assert: (self createTreeExpectedReportWith:  'Portfolio de la familia') equals: (PortfolioTreePrinter of: familyPortfolio).
	! !

!AccountReportTest methodsFor: 'PortfolioTreePrinter Tests' stamp: 'GFC 6/16/2022 03:27:21'!
test10ShowPortfolioWithOneAccount
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	self assert: (self createTreeExpectedReportWith: 'Portfolio de la familia' with: '   Cuenta mia') equals: (PortfolioTreePrinter of: familyPortfolio).
	! !

!AccountReportTest methodsFor: 'PortfolioTreePrinter Tests' stamp: 'GFC 6/16/2022 03:27:24'!
test11ShowPortfolioWithAnAccountAndAPortfolioInside
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	self assert: (self createTreeExpectedReportWith: 'Portfolio de la familia' with: '   Cuenta mia' with: '   Portfolio de hijos' ) equals: (PortfolioTreePrinter of: familyPortfolio).
	! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'nameOfAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'GFC 6/16/2022 01:04:12'!
accountsName
	^nameOfAccount. ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'initialization' stamp: 'GFC 6/15/2022 00:55:03'!
initializeWithName: aNameOfAccount
	nameOfAccount := aNameOfAccount.
	! !


!Account methodsFor: 'Visitor Pattern - private' stamp: 'GFC 6/16/2022 02:34:47'!
defineReportAction: aReport
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'GFC 6/15/2022 01:00:01'!
named: aNameofAccount
	self subclassResponsibility. ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'GFC 6/15/2022 00:46:41'!
initialize
	"super intialize: "
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'GFC 6/15/2022 00:49:19'!
initializeWithName: aNameOfAccount
	super initializeWithName: aNameOfAccount.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'GFC 6/16/2022 01:14:44'!
accounts
	^accounts ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'Visitor Pattern - private' stamp: 'GFC 6/16/2022 02:36:03'!
defineReportAction: aReport
	aReport doReportActionInPortfolio: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'GFC 6/15/2022 00:59:46'!
named: aNameofAccount
	| anAccount |
	anAccount _ Portfolio new.
	anAccount initializeWithName: aNameofAccount.
	^anAccount! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'GFC 6/16/2022 01:25:56'!
named: aNameOfAccount with: anAccount 

	| aPortfolio |
	aPortfolio _ Portfolio  new.
	aPortfolio initializeWithName: aNameOfAccount.
	aPortfolio add: anAccount.
	^aPortfolio.
	! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'GFC 6/15/2022 01:11:59'!
named: aNameOfAccount with: anAccount with: anotherAccount

	| aPortfolio |
	aPortfolio _ Portfolio  new.
	aPortfolio initializeWithName: aNameOfAccount.
	aPortfolio add: anAccount.
	aPortfolio add: anotherAccount.
	^aPortfolio.
	! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'GFC 6/15/2022 00:49:19'!
initializeWithName: aNameOfAccount

	super initializeWithName: aNameOfAccount.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'GFC 6/14/2022 23:08:50'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'Visitor Pattern - private' stamp: 'GFC 6/16/2022 02:36:25'!
defineReportAction: aReport
	aReport doReportActionInReceptiveAccount: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'GFC 6/15/2022 00:59:35'!
named: aNameofAccount
	| anAccount |
	anAccount _ ReceptiveAccount new.
	anAccount initializeWithName: aNameofAccount.
	^anAccount! !


!classDefinition: #AccountReport category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: 'reportAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountReport methodsFor: 'initialization' stamp: 'GFC 6/14/2022 21:05:42'!
initializeWith: account
	reportAccount := account .
! !


!AccountReport methodsFor: 'public' stamp: 'GET 6/13/2022 21:08:58'!
report
	self subclassResponsibility.! !


!AccountReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 21:57:47'!
doReportActionInDeposit: aDepositValue
	self subclassResponsibility .! !

!AccountReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/16/2022 02:39:32'!
doReportActionInPortfolio: aPortfolio
	self subclassResponsibility.! !

!AccountReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/16/2022 02:40:12'!
doReportActionInReceptiveAccount: aReceptiveAccount
	self subclassResponsibility.! !

!AccountReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 22:01:33'!
doReportActionInTransferDepositLeg: aTransferDepositLegValue
	self subclassResponsibility .! !

!AccountReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 22:01:04'!
doReportActionInTransferWithdrawLeg: aTransferWithdrawLegLegValue
	self subclassResponsibility .! !

!AccountReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 21:59:43'!
doReportActionInWithdraw: aWithdrawValue
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'ServiciosFinancieros-Solucion'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'as yet unclassified' stamp: 'GFC 6/15/2022 01:20:27'!
of: account
	| accountReport |
	
	accountReport _ self new initializeWith: account.
	
	^accountReport report. ! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #AccountSummary
	instanceVariableNames: 'summaryLines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'public' stamp: 'GFC 6/16/2022 02:32:14'!
report
	reportAccount transactions do: [:aTransaction |
		aTransaction defineReportAction: self.
	].
	summaryLines add: ('Balance = ',(reportAccount balance) asString).
	^summaryLines! !


!AccountSummary methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 22:57:01'!
doReportActionInDeposit: aDeposit
 	summaryLines add: ('Depósito por ', aDeposit value asString).! !

!AccountSummary methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 23:43:36'!
doReportActionInTransferDepositLeg: aTransferDepositLeg
 	summaryLines add: ('Entrada por transferencia por ', aTransferDepositLeg value asString).! !

!AccountSummary methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 23:43:42'!
doReportActionInTransferWithdrawLeg: aTransferWithdrawLeg
 	summaryLines add: ('Salida por transferencia por ', aTransferWithdrawLeg value asString).! !

!AccountSummary methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 22:59:05'!
doReportActionInWithdraw: aWithdraw
 	summaryLines add: ('Extracción por ', aWithdraw value asString).! !


!AccountSummary methodsFor: 'initialization' stamp: 'GFC 6/14/2022 21:06:47'!
initializeWith: account
	super initializeWith: account .
	summaryLines := OrderedCollection new.
	
	! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #PortfolioTreePrinter
	instanceVariableNames: 'treePrintingCollection numberOfRecursiveLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'private' stamp: 'GFC 6/16/2022 02:58:49'!
indentationLevel
	| indentation |
	indentation _ String new.
	numberOfRecursiveLevel timesRepeat: [indentation := indentation appendToString: '   '].
	^indentation ! !


!PortfolioTreePrinter methodsFor: 'public' stamp: 'GFC 6/16/2022 04:02:52'!
printAccount: anAccountToPrint

	anAccountToPrint defineReportAction: self.
	
	! !

!PortfolioTreePrinter methodsFor: 'public' stamp: 'GFC 6/16/2022 03:00:59'!
printAccount: anAccountToPrint ofTreeDepthLevel: numberOfRecursiveLevels

	anAccountToPrint defineReportAction: self.
	
	! !

!PortfolioTreePrinter methodsFor: 'public' stamp: 'GFC 6/16/2022 04:03:11'!
report
	treePrintingCollection := OrderedCollection new.
	numberOfRecursiveLevel  := 0.
	self printAccount: reportAccount.
	^treePrintingCollection 
	
	
	
	! !


!PortfolioTreePrinter methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/16/2022 02:59:15'!
doReportActionInPortfolio: aPortfolio
	treePrintingCollection add: ((self indentationLevel) ,(aPortfolio accountsName)).
		aPortfolio accounts do: [ :anAccount | 
			numberOfRecursiveLevel  _ numberOfRecursiveLevel  + 1.
			self printAccount: anAccount ofTreeDepthLevel: numberOfRecursiveLevel.
			numberOfRecursiveLevel _ numberOfRecursiveLevel  - 1.
			]! !

!PortfolioTreePrinter methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/16/2022 02:59:07'!
doReportActionInReceptiveAccount: aReceptiveAccount
	treePrintingCollection add: ((self indentationLevel) ,(aReceptiveAccount accountsName)).! !


!classDefinition: #TransferNetReport category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #TransferNetReport
	instanceVariableNames: 'netTransferCount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 23:00:58'!
doReportActionInDeposit: aDeposit
	! !

!TransferNetReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 22:59:40'!
doReportActionInTransferDepositLeg: aTransferDepositLeg
	
	netTransferCount := netTransferCount + (aTransferDepositLeg value).! !

!TransferNetReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 22:59:53'!
doReportActionInTransferWithdrawLeg: aTransferWithdrawLeg
	netTransferCount := netTransferCount - (aTransferWithdrawLeg value)! !

!TransferNetReport methodsFor: 'DD Visitor Pattern - private' stamp: 'GFC 6/14/2022 23:01:02'!
doReportActionInWithdraw: aWithdraw! !


!TransferNetReport methodsFor: 'initialization' stamp: 'GFC 6/14/2022 22:11:01'!
initializeWith: account
	super initializeWith: account .
	netTransferCount _ 0.! !


!TransferNetReport methodsFor: 'public' stamp: 'GFC 6/16/2022 00:43:59'!
report
	reportAccount transactions do: [:aTransaction |
		aTransaction defineReportAction: self.		
		].
	^netTransferCount .! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'Visitor Patern - private' stamp: 'GFC 6/14/2022 21:53:59'!
defineReportAction: aReport
	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'Visitor Pattern - private' stamp: 'GFC 6/14/2022 22:54:32'!
defineReportAction: aReport
	aReport doReportActionInDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'Visitor Patern - private' stamp: 'GFC 6/14/2022 21:53:59'!
defineReportAction: aReport
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'Visitor Patern - private' stamp: 'GFC 6/14/2022 22:55:27'!
defineReportAction: aReport
	aReport doReportActionInTransferDepositLeg: self .! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'Visitor Patern - private' stamp: 'GFC 6/14/2022 22:55:37'!
defineReportAction: aReport
	aReport doReportActionInTransferWithdrawLeg: self.! !


!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'Visitor Patern - private' stamp: 'GFC 6/14/2022 22:55:43'!
defineReportAction: aReport
	aReport doReportActionInWithdraw: self .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
