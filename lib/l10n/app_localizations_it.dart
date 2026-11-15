// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get account => 'Account';

  @override
  String get accounts => 'Accounts';

  @override
  String get ackBackedUp =>
      'Sei sicuro di aver fatto una copia della tua frase segreta?';

  @override
  String get add => 'Aggiungi';

  @override
  String get addAccount => 'Aggiungi account';

  @override
  String get addContact => 'Aggiungi contatto';

  @override
  String get addNode => 'Aggiungi nodo';

  @override
  String get addNodeFailed => 'Impossibile aggiungere nodo Hoosat';

  @override
  String addNodeFailedMessage(String error) {
    return 'Errore: $error';
  }

  @override
  String get addNodeSuccess => 'Nodo aggiunto con successo';

  @override
  String get addingNodeMessage => 'Attendi mentre contatto il nodo';

  @override
  String get addingNodeTitle => 'Aggiungendo il nodo';

  @override
  String get address => 'Indirizzo';

  @override
  String get addressCopied => 'Indirizzo copiato';

  @override
  String get addressCopiedFailed =>
      'La copia dell\'indirizzo non è andata a buon fine';

  @override
  String get addressHint => 'Inserisci indirizzo';

  @override
  String get addressMising => 'Inserisci un indirizzo';

  @override
  String get addressShare => 'Condividi indirizzo';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Avanzate';

  @override
  String get amount => 'Importo';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Importo $amount $coin';
  }

  @override
  String get amountMissing => 'Inserisci un importo';

  @override
  String get amountZero => 'L\'importo non può essere zero';

  @override
  String get areYouSure => 'Sei sicuro?';

  @override
  String get authBiometricMessage =>
      'Autenticazione necessaria per aggiungere un wallet';

  @override
  String get authMethod => 'Metodo di Autenticazione';

  @override
  String get authPinMessage => 'Inserisci il PIN per aggiungere il wallet';

  @override
  String get autoLockHeader => 'Blocca automaticamente';

  @override
  String get available => 'Disponibile';

  @override
  String get back => 'Indietro';

  @override
  String get backupConfirmButton => 'L\'ho salvata';

  @override
  String get backupSecretPhrase => 'Esegui backup della frase segreta';

  @override
  String get missingSecretPhrase => 'Frase segreta mancante';

  @override
  String get biometricsMethod => 'Biometrica';

  @override
  String get blockExplorer => 'Explorer';

  @override
  String get cancel => 'Annulla';

  @override
  String get change => 'Resto';

  @override
  String get changeAddress => 'Indirizzo del resto';

  @override
  String get changeAddressCopied => 'Indirizzo del resto copiato';

  @override
  String get changeIndex => 'Indice dei resti';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Resto $addressIndex';
  }

  @override
  String get checkCameraPermission =>
      'Controlla il permesso di accesso alla fotocamera';

  @override
  String get clipboardEmpty => 'Non hai copiato nulla';

  @override
  String get close => 'Chiudi';

  @override
  String get confirm => 'Conferma';

  @override
  String get confirmPasswordHint => 'Conferma la password';

  @override
  String confirmations(String confirmations) {
    return '$confirmations conferme';
  }

  @override
  String get confirmed => 'confermata';

  @override
  String get confirmedMaturing => 'confermata · in maturazione';

  @override
  String get confirming => 'in attesa di conferma';

  @override
  String contactAdded(String contactName) {
    return '$contactName è stato aggiunto ai contatti!';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address indirizzo copiato';
  }

  @override
  String get contactExists => 'Contatto già esistente';

  @override
  String get contactHeader => 'Contatto';

  @override
  String get contactInvalid => 'Nome contatto non valido';

  @override
  String get contactNameHint => 'Inserisci un nome @';

  @override
  String get contactNameMissing => 'Scegli un nome per questo contatto';

  @override
  String contactRemoved(String contactName) {
    return '$contactName è stato rimosso dai contatti!';
  }

  @override
  String get contactsHeader => 'Contatti';

  @override
  String get contactsImportErr => 'Importazione contatti fallita';

  @override
  String contactsImportSuccess(String noContacts) {
    return '$noContacts contatti importati con successo';
  }

  @override
  String get copied => 'Copiato';

  @override
  String get copy => 'Copia';

  @override
  String get copyAddress => 'Copia Indirizzo';

  @override
  String get copyErrorButton => 'Errore durante la copia';

  @override
  String get createAPasswordHeader => 'Crea una password';

  @override
  String get createPasswordFirstParagraph =>
      'Puoi creare una password per rendere il tuo wallet ancora più sicuro.';

  @override
  String get createPasswordHint => 'Crea una password';

  @override
  String get createPasswordSecondParagraph =>
      'La password è opzionale e il tuo wallet sarà comunque protetto dal PIN o dal riconoscimento biometrico.';

  @override
  String get createPasswordSheetHeader => 'Crea';

  @override
  String get currency => 'Valuta';

  @override
  String get currencyPoweredBy => 'Servizio offerto da CoinGecko';

  @override
  String get defaultAccountName => 'Indirizzo 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Account $addressIndex';
  }

  @override
  String get defaultWalletName => 'Il mio wallet';

  @override
  String get disablePasswordSheetHeader => 'Disattiva';

  @override
  String get disablePasswordSuccess => 'La password è stata disattivata';

  @override
  String get disableWalletPassword => 'Disattiva la password del wallet';

  @override
  String get doContinue => 'Continua';

  @override
  String get donate => 'Dona';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Non mostrare più';

  @override
  String get emptyCardIntroUtxos =>
      'Questa è la sezione dedicata agli UTXO. Tutti gli UTXO del tuo wallet appariranno qui';

  @override
  String get emptyResult => 'Nessun risultato';

  @override
  String get emptyWalletName => 'Devi per forza dare un nome al wallet';

  @override
  String get encryptionFailedError =>
      ' \nImpostazione della password non riuscita';

  @override
  String get enterAddress => 'Inserisci indirizzo';

  @override
  String get enterAmount => 'Inserisci importo';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Inserisci note';

  @override
  String get enterPasswordHint => 'Inserisci la tua password';

  @override
  String get errorMessageCopied => 'Messaggio d\'errore copiato';

  @override
  String get exampleCardIntro =>
      'Questa è la sezione dedicata alle transazioni. Quando invierai o riceverai una transazione, sarà visualizzata qui.';

  @override
  String get export => 'Esporta';

  @override
  String get fee => 'Commissione';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Commissioni: $amount $coin';
  }

  @override
  String get feeTitle => 'COMMISSIONE';

  @override
  String get fetchingTransactions => 'Sto recuperando le transazioni';

  @override
  String get fingerprintSeedBackup =>
      'Conferma l\'impronta per eseguire il backup della frase segreta';

  @override
  String get goBackButton => 'Indietro';

  @override
  String get gotItButton => 'Ho capito!';

  @override
  String get import => 'Importa';

  @override
  String get importSecretPhrase => 'Importa frase segreta';

  @override
  String get importSecretPhraseHint =>
      'Inserisci la tua frase segreta di 24 parole.';

  @override
  String get importSecretPhraseHintCombo =>
      'Inserisci qui sotto le tue 12 o 24 parole chiave';

  @override
  String get importSecretPhraseHintLegacy =>
      'Inserisci qui sotto le tue 12 parole chiave';

  @override
  String get importWallet => 'Importa wallet';

  @override
  String get importWalletDescription =>
      'Seleziona una delle opzioni disponibili sotto';

  @override
  String get instantly => 'Subito';

  @override
  String get insufficientBalance => 'Saldo insufficiente';

  @override
  String get insufficientBalanceDetails =>
      'Non hai abbastanza HTN per questa transazione';

  @override
  String get invalidAddress => 'L\'indirizzo inserito non è valido';

  @override
  String get invalidAmount => 'L\'importo inserito non è valido';

  @override
  String get invalidChecksumMessage =>
      'Verifica che la tua frase segreta\n sia inserita correttamente!';

  @override
  String get invalidKpubMessage =>
      'Please check that your extended public key is entered correctly!';

  @override
  String get invalidDestinationAddress =>
      'L\'indirizzo di destinazione inserito non è valido';

  @override
  String get invalidPassword => 'La password inserita non è valida';

  @override
  String get hoosatDevFund => 'Fondo dei developer di Hoosat';

  @override
  String get hoosatMobile => 'Hoosat Mobile Wallet';

  @override
  String get language => 'Lingua';

  @override
  String get loadingTransactions => 'Caricamento delle transazioni in corso...';

  @override
  String get lockAppSetting => 'Autenticazione all\'avvio';

  @override
  String get locked => 'Bloccato';

  @override
  String get loggingOutMessage => 'Disconnessione in corso...';

  @override
  String get logout => 'Disconnesso';

  @override
  String get logoutDialogContent =>
      'Sei sicuro di volerti disconnettere da questo wallet?';

  @override
  String get logoutOrSwitchWallet => 'Disconnessione / Cambia Wallet';

  @override
  String get manage => 'Gestisci';

  @override
  String get manualEntry => 'Inserisci manualmente';

  @override
  String get networkHeader => 'Rete';

  @override
  String get newAddress => 'Nuovo indirizzo';

  @override
  String get newWallet => 'Nuovo wallet';

  @override
  String get nextButton => 'Avanti';

  @override
  String get no => 'No';

  @override
  String get noContactsExport => 'Non ci sono contatti da esportare';

  @override
  String get noContactsImport => 'Non ci sono nuovi contatti da importare';

  @override
  String get noQrCodeFound => 'Nessun codice QR trovato';

  @override
  String get noSkipButton => 'No, salta';

  @override
  String get noUppercase => 'NO';

  @override
  String get nodeAddress => 'Nodo Hoosat';

  @override
  String get nodeDeleteMessage => 'Sei sicuro di voler cancellare?';

  @override
  String get nodeDeleteTitle =>
      'Vuoi cancellare la configurazione del nodo Hoosat?';

  @override
  String get nodeNameEmpty => 'Il nome del nodo non può essere vuoto';

  @override
  String get nodeNameHint => 'Inserisci il nome del nodo';

  @override
  String get nodeUrlHint => 'Inserisci l\'URL del nodo';

  @override
  String get nodeUrlInvalid => 'L\'URL inserito non è valido';

  @override
  String get nodesSheetTitle => 'Nodi Hoosat';

  @override
  String get off => 'Off';

  @override
  String get on => 'On';

  @override
  String get paperWallet => 'Wallet cartaceo';

  @override
  String get passwordBlank => 'La password non può essere vuota';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Non avrai bisogno di una password per aprire questo wallet.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Questa password ti sarà richiesta per aprire questo wallet.';

  @override
  String get passwordsDontMatch => 'Le password non corrispondono';

  @override
  String get pasteMnemonicError =>
      'Il contenuto copiato non è una frase segreta valida';

  @override
  String get pending => 'in attesa';

  @override
  String get pinConfirmError => 'I PIN non corrispondono';

  @override
  String get pinConfirmTitle => 'Conferma il tuo PIN';

  @override
  String get pinCreateTitle => 'Crea un PIN a 6 cifre';

  @override
  String get pinEnterTitle => 'Inserisci PIN';

  @override
  String get pinInvalid => 'Il PIN inserito non è valido';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup =>
      'Inserisci il PIN per eseguire il backup della frase segreta';

  @override
  String get preferences => 'Preferenze';

  @override
  String get privacyPolicy => 'Politiche sui dati sensibili';

  @override
  String get qrInvalidAddress =>
      'Il codice QR non contiene un indirizzo valido';

  @override
  String get qrInvalidSeed =>
      'Il codice QR non contiene un seed o una chiave privata validi';

  @override
  String get qrMnemonicError =>
      'Il codice QR non contiene una frase segreta valida';

  @override
  String get receive => 'Ricevi';

  @override
  String get receiveAddress => 'Indirizzo di ricezione';

  @override
  String get receiveAddressCopied => 'Indirizzo di ricezione copiato';

  @override
  String get receiveIndex => 'Indirizzo di ricezione';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Ricevi $addressIndex';
  }

  @override
  String get received => 'Ricevuti';

  @override
  String get removeContact => 'Rimuovi contatto';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Sei sicuro di voler rimuovere $contactName?';
  }

  @override
  String get removeWalletAction => 'Elimina wallet';

  @override
  String get removeWalletBiometricsMessage =>
      'Autenticati per eliminare il wallet';

  @override
  String get removeWalletDetail =>
      'Eliminando questo wallet la frase segreta e tutti i dati del wallet saranno rimossi da questo dispositivo. Se non hai effettuato un backup della frase segreta, non sarai più in grado di accedere ai tuoi fondi.';

  @override
  String get removeWalletPinMessage =>
      'Inserisci il PIN per eliminare il wallet';

  @override
  String get removeWalletReassurance =>
      'Se hai effettuato correttamente il backup della frase segreta, puoi stare tranquillo.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Vuoi impostare una password per accedere a questo wallet?';

  @override
  String get restartSetupButton => 'Riavvia l\'installazione';

  @override
  String get scanQrCode => 'Scansiona codice QR';

  @override
  String get scanQrCodeError => 'Non è possibile decifrare il codice QR';

  @override
  String get scanFromImage => 'Scansiona da immagine';

  @override
  String get toggleFlash => 'Accendi/spegni torcia';

  @override
  String get riskDisclosureHeader => 'Prima di iniziare';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet è un wallet non custodial. La tua frase segreta e le tue chiavi private vengono generate e conservate solo su questo dispositivo: non le vediamo mai, non le salviamo su nessun server e non possiamo recuperarle per te.';

  @override
  String get riskDisclosureWarning =>
      'Se perdi la tua frase segreta, non esiste alcun reset della password né un team di supporto in grado di recuperare i tuoi fondi. Sei l\'unico responsabile della sua custodia.';

  @override
  String get riskDisclosureAccept => 'Ho capito, continua';

  @override
  String get secretInfo =>
      'Nella prossima schermata, vedrai la tua frase segreta. È la password per accedere ai tuoi fondi. È fondamentale che tu ne faccia una copia e che non la condivida con nessuno.';

  @override
  String get secretInfoHeader => 'La sicurezza prima di tutto!';

  @override
  String get secretPhrase => 'Frase segreta';

  @override
  String get verifyBackupTitle => 'Verifica il tuo backup';

  @override
  String get verifyBackupInstruction =>
      'Seleziona la parola corretta per ogni posizione per confermare di aver salvato la tua frase segreta.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Qual è la parola n. $index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Non è del tutto corretto. Controlla il tuo backup e riprova.';

  @override
  String get secretPhrase12Words => '12 parole';

  @override
  String get secretPhrase24Words => '24 parole';

  @override
  String get secretWarning =>
      'Se perdi il tuo dispositivo o disinstalli l\'applicazione, avrai bisogno della tua frase segreta per recuperare i tuoi fondi!';

  @override
  String get securityHeader => 'Sicurezza';

  @override
  String get securitySettingsBiometrics =>
      'Autenticati per accedere alle impostazioni di sicurezza';

  @override
  String get securitySettingsPin =>
      'Inserisci il PIN per accedere alle impostazioni di sicurezza';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Firma messaggio';

  @override
  String get signMessageCopySignature => 'Copia firma';

  @override
  String get signMessageDescription =>
      'Firma un messaggio con uno degli indirizzi del tuo wallet';

  @override
  String get signMessageHint => 'Inserisci un messaggio da firmare';

  @override
  String get signMessageSignatureCopied => 'Firma copiata';

  @override
  String get signMessageSigned => 'Messaggio firmato';

  @override
  String get signMessageTooLong => 'Il messaggio è troppo lungo';

  @override
  String get seedInvalid => 'Seed non valido';

  @override
  String get nodeUnreachable =>
      'Impossibile raggiungere il tuo nodo. I saldi potrebbero non essere aggiornati.';

  @override
  String get nodeUnreachableRetry => 'Riprova';

  @override
  String get send => 'Invia';

  @override
  String get sendConfirm => 'Invia';

  @override
  String get sendError =>
      'Si è verificato un errore. Si prega di riprovare più tardi.';

  @override
  String get sendNote => 'NOTE';

  @override
  String get sendToAddressTitle => 'Invia a';

  @override
  String get sendTxProgressDescription => 'Attendi l\'invio della transazione';

  @override
  String get sendTxProgressTitle => 'Invio della transazione in corso';

  @override
  String get sending => 'Invio in corso';

  @override
  String get sent => 'Inviata';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Imposta Password';

  @override
  String get setPasswordSuccess =>
      'La password è stata impostata correttamente';

  @override
  String get setWalletPassword => 'Imposta la password del wallet';

  @override
  String get settingsHeader => 'Impostazioni';

  @override
  String get settingsTransfer => 'Recupera da wallet cartaceo';

  @override
  String get setupFailedMessage => 'Qualcosa è andato storto';

  @override
  String get shareHoosatMobile => 'Condividi Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject =>
      'Dai un\'occhiata al wallet Hoosat Mobile';

  @override
  String get shareHoosatMobileText =>
      'Dai un\'occhiata a Hoosat Mobile, il wallet mobile di Hoosat!\nWebsite - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Qualcosa è andato storto';

  @override
  String get systemDefault => 'Predefinito';

  @override
  String get tapToHide => 'Tocca qui per nascondere';

  @override
  String get tapToReveal => 'Tocca qui per visualizzare';

  @override
  String get themeDark => 'Tema scuro';

  @override
  String get themeHeader => 'Tema';

  @override
  String get themeLight => 'Tema chiaro';

  @override
  String get toggleTheme => 'Cambia tema';

  @override
  String get thisWallet => '#Questo wallet';

  @override
  String get to => 'A';

  @override
  String get toAddress => 'All\'indirizzo';

  @override
  String get tooManyFailedAttempts => 'Troppi tentativi di sblocco falliti.';

  @override
  String get totalValue => 'Valore totale';

  @override
  String get transactionId => 'ID transazione';

  @override
  String get transactionsUppercase => 'TRANSAZIONI';

  @override
  String get transfer => 'Trasferisci';

  @override
  String get transferClose => 'Premi dove vuoi per chiudere la finestra.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN trasferiti con successo al tuo wallet Hoosat Mobile.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'Rilevato un wallet con un saldo di $amount HTN.\n';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Premi Conferma per trasferire i fondi.\n';

  @override
  String get transferConfirmInfoThird =>
      'Il trasferimento potrebbe richiedere diversi secondi.';

  @override
  String get transferError =>
      'Si è verificato un errore durante il trasferimento. Riprova più tardi.';

  @override
  String get transferHeader => 'Trasferisci fondi';

  @override
  String transferIntro(String button) {
    return 'Questo processo trasferirà i fondi da un wallet cartaceo al tuo wallet Hoosat Mobile.\n\nPremi il pulsante \"$button\" per iniziare.';
  }

  @override
  String get transferLoading => 'Trasferimento in corso';

  @override
  String get transferManualHint => 'Inserisci il tuo seed.';

  @override
  String get transferNoFunds => 'Questo seed non contiene alcun HTN.';

  @override
  String get transferQrScanError =>
      'Questo codice QR non contiene un seed valido.';

  @override
  String get transferQrScanHint => 'Scansiona un seed \no una chiave privata';

  @override
  String get unconfirmed => 'non confermata';

  @override
  String get notAccepted => 'not accepted';

  @override
  String get accepted => 'accepted';

  @override
  String get unknown => 'sconosciuta';

  @override
  String get unlock => 'Sblocca';

  @override
  String get unlockBiometrics => 'Autenticati per sbloccare il wallet';

  @override
  String get unlockPin => 'Inserisci il PIN per sbloccare il wallet';

  @override
  String get utxosUppercase => 'UTXO';

  @override
  String get viewAddress => 'Visualizza indirizzo';

  @override
  String get viewTransaction => 'Visualizza transazione';

  @override
  String get walletAddresses => 'Indirizzi del wallet';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Nome del wallet';

  @override
  String get walletNameDescription => 'Inserisci un nome per il tuo wallet';

  @override
  String get walletNameHint => 'Nome del wallet';

  @override
  String get walletSetupAddressDiscovery => 'Analisi degli indirizzi in corso';

  @override
  String get walletSetupMessage => 'Configurazione del wallet in corso';

  @override
  String get walletsTitle => 'Wallet';

  @override
  String get warning => 'Attenzione';

  @override
  String welcomeMessage(String version) {
    return 'Benvenuto!\n\nQuesta è la versione $version di Hoosat Mobile - il wallet mobile per Hoosat ';
  }

  @override
  String get welcomeText =>
      'Benvenuto in Hoosat Mobile. Per iniziare, puoi creare un nuovo wallet o importare un wallet già esistente.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minuti',
      one: '1 minuto',
    );
    return 'Dopo $_temp0';
  }

  @override
  String get yes => 'Si';

  @override
  String get yesButton => 'Si';

  @override
  String get yesUppercase => 'SI';

  @override
  String get nodeNotSyncedException => 'Il nodo non è sincronizzato';

  @override
  String get nodeNoUTXOIndexException =>
      'Il nodo non sta indicizzando gli UTXO';

  @override
  String get nodeSecureConnection => 'Connessione sicura';

  @override
  String get hoosatUriInvalid => 'Invalid Hoosat URI';

  @override
  String get compoundUtxos => 'Compound transactions';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'Hai molti piccoli output non spesi. La consolidazione li unirà in un numero minore di UTXO più grandi, così i futuri invii saranno più veloci e potrebbero richiedere commissioni inferiori. Questa operazione crea una o più transazioni e comporta il pagamento delle commissioni di rete.';

  @override
  String get compoundUtxosDescription => 'Combine multiple UTXOs into one';

  @override
  String get compoundUtxosConfirmation => 'Compound transactions?';

  @override
  String get compoundingUtxos => 'Compounding transactions';

  @override
  String get compoundingMessage => 'Please wait...';

  @override
  String get compoundSuccess => 'Compound successful';

  @override
  String get compoundFailure => 'Failed to compound transactions';

  @override
  String get fundsStillConfirmingTitle => 'Fondi ancora in conferma';

  @override
  String get fundsStillConfirmingBody =>
      'Alcuni fondi di questo account sono stati ricevuti da troppo poco tempo per essere inviati: la rete richiede prima una breve attesa di maturazione, di solito pochi minuti. Puoi attendere e riprovare, oppure inviare da un altro account con fondi maturi.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Cambia account';

  @override
  String get compoundTooFewUtxos => 'At least two UTXOs are required';

  @override
  String get moveToMain => 'Raccogli su Principale';

  @override
  String get moveToMainDescription =>
      'Trasferisci il saldo di tutti gli altri indirizzi sul tuo indirizzo principale';

  @override
  String get moveToMainConfirmation => 'Spostare tutto su Principale?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Verranno spostati $amount $symbol da $count altro/i indirizzo/i al tuo indirizzo principale. Verranno create una o più transazioni e saranno applicate commissioni di rete.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Il saldo di tutti gli indirizzi è già su Principale';

  @override
  String get movingToMain => 'Raccolta su Principale';

  @override
  String get moveToMainSuccess => 'Trasferimento su Principale riuscito';

  @override
  String get moveToMainFailure => 'Trasferimento su Principale non riuscito';

  @override
  String get moveToMainUppercased => 'SPOSTA';

  @override
  String get manageAccounts => 'Account';

  @override
  String get manageAccountsDescription =>
      'Aggiungi e gestisci indirizzi con nome';

  @override
  String get mainAccountLabel => 'Principale';

  @override
  String get archiveAction => 'Archivia';

  @override
  String get restoreAction => 'Ripristina';

  @override
  String get archivedAccountsHeader => 'Archiviati';

  @override
  String get noAdditionalAccountsYet => 'Ancora nessun account aggiuntivo';

  @override
  String get renameAccount => 'Rinomina account';

  @override
  String get accountLabelHint => 'Nome dell\'account';

  @override
  String get saveUppercased => 'SALVA';

  @override
  String get addUppercased => 'AGGIUNGI';

  @override
  String get sendFromLabel => 'Da';

  @override
  String get sendFromAny => 'Qualsiasi';

  @override
  String get home => 'Home';

  @override
  String get activity => 'Attività';

  @override
  String get totalBalance => 'Saldo totale';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Disponibile ora $spendable · Ancora in arrivo $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Le monete ancora in arrivo sono tue e potranno essere spese presto.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Le monete ancora in arrivo potranno essere spese tra $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Disponibile ora $amount. Il resto potrà essere speso tra $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Disponibile ora $amount. Il resto è ancora in arrivo.';
  }

  @override
  String get txTagWaiting => 'in attesa di accettazione';

  @override
  String get txTagStatusUnknown => 'stato sconosciuto';

  @override
  String get txTagNotAccepted => 'non accettata';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'conferma $n / $total';
  }

  @override
  String get submittedTo => 'Inviata a';

  @override
  String get testConnection => 'Testa la connessione';

  @override
  String get accountsOtherWalletHeader =>
      'Salvati da un altro wallet (sola lettura)';

  @override
  String get accountsOtherWalletNote =>
      'Questo wallet non può spenderli, quindi non sono inclusi nel suo totale. Apri il wallet a cui appartengono per usarli.';

  @override
  String get noActivityTitle => 'Ancora nessuna attività';

  @override
  String get txTypeSent => 'Inviato';

  @override
  String get txTypeReceived => 'Ricevuto';

  @override
  String get txTypeThisWallet => 'All\'interno del wallet';

  @override
  String get txTypeMerged => 'Monete unite';

  @override
  String get noActivityMessage => 'Quando invii o ricevi HTN, appare qui.';

  @override
  String get seeAll => 'Vedi tutto';

  @override
  String get show => 'Mostra';

  @override
  String get myAccounts => 'I miei account';

  @override
  String homeGreeting(String walletName) {
    return 'Ciao, $walletName';
  }

  @override
  String get balance => 'Balance';

  @override
  String get maxSend => 'Max Send';

  @override
  String get compoundUppercased => 'COMPOUND';

  @override
  String get closeUppercased => 'CLOSE';

  @override
  String get scanMoreAddresses => 'Scan For More Addresses';

  @override
  String get addressDiscovery => 'Address Discovery';

  @override
  String get scanningTitle => 'Scanning';

  @override
  String get scanningDescription => 'Scanning for new addresses...';

  @override
  String get scanMore => 'SCAN MORE';

  @override
  String get scanFailedMessage => 'Scan failed, please try again later';

  @override
  String get indexHeader => 'Index';

  @override
  String get currentIndex => 'Current';

  @override
  String get scannedIndex => 'Scanned';

  @override
  String get newIndex => 'New';

  @override
  String get addressFilterDialogTitle => 'Address Filter';

  @override
  String get addressFilterDialogOptionAllAddresses => 'View All Addresses';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'View Addresses With Balance';

  @override
  String get importOption24WordsTitle => 'Import 24 Word Secret Phrase';

  @override
  String get importOption24WordsDescription =>
      'Compatible with Cli Wallet and Ledger';

  @override
  String get importOption12WordsTitle => 'Import 12 Word Secret Phrase';

  @override
  String get importOption12WordsDescription =>
      'Compatible with Web Wallet and KDX';

  @override
  String get importOptionStandardWalletTitle => 'Importa wallet standard';

  @override
  String get importOptionStandardWalletDescription =>
      'Wallet a 12 o 24 parole con derivazione standard e passphrase BIP39 facoltativa';

  @override
  String get importOptionLegacyWalletTitle => 'Importa wallet legacy';

  @override
  String get importOptionLegacyWalletDescription =>
      'Wallet a 12 parole con derivazione legacy, compatibili con il vecchio Web Wallet e KDX';

  @override
  String get importOptionKpubTitle => 'Import Watch Only Wallet';

  @override
  String get importOptionKpubDescription =>
      'Monitor the balance and transactions of a wallet using an extended public key';

  @override
  String get importKpub => 'Import Watch Only Wallet';

  @override
  String get importKpubHint => 'Please enter your extended public key.';

  @override
  String get importKpubClipboardError =>
      'Clipboard content is not a valid extended public key';

  @override
  String get importKpubQrCodeError =>
      'QR code does not contain a valid extended public key';

  @override
  String get importKpubInvalidMessage =>
      'Please check that your extended public key is entered correctly!';

  @override
  String get receiveAddressListEmpty => 'Receive address list is empty';

  @override
  String get changeAddressListEmpty => 'Change address list is empty';

  @override
  String get hintAddressListEmpty =>
      'Check address filter from the top right corner';

  @override
  String get invalidSecretPhrase => 'Invalid Secret Phrase';

  @override
  String get invalidSecretPhraseDetails =>
      'The Secret Phrase you entered has an invalid checksum.';

  @override
  String get invalidSecretPhraseConfirmation => 'I know what I\'m doing';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String emailAction(String email) {
    return 'Email $email';
  }

  @override
  String get noteLabel => 'Note:';

  @override
  String get optionalLabel => '(Optional)';

  @override
  String get buyHoosatSubtitle => 'Via Topper by Uphold';

  @override
  String get buyHoosatTitle => 'Buy Hoosat';

  @override
  String get buyHoosatMessage => 'Buy \$HTN quickly & easily.';

  @override
  String get buyHoosatMessageSecondary =>
      'Service provided by Topper, Uphold\'s fiat-to-crypto onramp.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get aboutTopperTitle => 'About Topper';

  @override
  String get aboutTopperDescription =>
      'Topper by Uphold is an easy to use fiat-to-crypto onramp that allows users to buy cryptocurencies using a credit/debit card or with a bank account.';

  @override
  String get moreInfo => 'More Info';

  @override
  String get selectAddress => 'Select Address';

  @override
  String get kpubTitle => 'Extended Public Key';

  @override
  String get kpubAuth => 'View Extended Public Key';

  @override
  String get kpubDescription =>
      'The extended public key can be used to import your wallet as a \'watch only\' wallet.';

  @override
  String get copyKpub => 'Copy Kpub';

  @override
  String get kpubCopied => 'Extended Public Key Copied';

  @override
  String get kpubCopyFailed => 'Failed to copy Extended Public Key';

  @override
  String walletAddressesCopied(String addressType) {
    return 'Wallet $addressType Addresses Copied to Clipboard';
  }

  @override
  String walletAddressesCopyFailed(String addressType) {
    return 'Failed to Copy Wallet $addressType Addresses';
  }

  @override
  String get txReport => 'Transaction Report';

  @override
  String get txReportSubtitle => 'Get CSV file with transaction history';

  @override
  String get txReportDetails =>
      'Generate a transaction report, in CSV format, that contains all the wallet\'s transaction history.';

  @override
  String get txReportOptionIgnoreCompound => 'Ignore compound transactions';

  @override
  String get txReportOptionIgnoreSelfTxs => 'Ignore transactions sent to self';

  @override
  String get txReportOptionRefreshTxs => 'Refresh transactions';

  @override
  String get txReportGenerate => 'Generate';

  @override
  String get txReportStatusRefreshing => 'Refreshing transactions';

  @override
  String get txReportStatusLoading => 'Loading transactions';

  @override
  String get txReportStatusReady => 'Transaction report is ready!';

  @override
  String get txReportGetReport => 'Get Report';

  @override
  String get txReportDate => 'Date';

  @override
  String get txReportSentAmount => 'Sent Amount';

  @override
  String get txReportSentCurrency => 'Sent Currency';

  @override
  String get txReportReceivedAmount => 'Received Amount';

  @override
  String get txReportReceivedCurrency => 'Received Currency';

  @override
  String get txReportFeeAmount => 'Fee Amount';

  @override
  String get txReportFeeCurrency => 'Fee Currency';

  @override
  String get txReportLabel => 'Label';

  @override
  String get txReportDescription => 'Description';

  @override
  String get txReportTxHash => 'TxHash';

  @override
  String get txReportNote => 'Note';

  @override
  String get txReportLabelCost => 'cost';

  @override
  String get txReportFeeForCompound => 'Fee for Compound Transaction';

  @override
  String get txReportFeeForSelfSend => 'Fee to send to own addresses';

  @override
  String get txReportError => 'Error generating report';

  @override
  String txReportNoTxs(int numberOf) {
    return 'Found $numberOf transactions.';
  }

  @override
  String txReportNoLoadedTxs(int loadedTxs, int totalTxs) {
    return '($loadedTxs of $totalTxs)';
  }

  @override
  String get txFilterDialogTitle => 'Transaction Filter';

  @override
  String get txFilterDialogOptionAllTxs => 'Show All Transactions';

  @override
  String get txFilterDialogOptionHideNotAcceptedCoinbase =>
      'Hide Not Accepted Coinbase Transactions';

  @override
  String get changeAddressModeTitle => 'Comportamento dell\'indirizzo di resto';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Ogni indirizzo mantiene il proprio saldo e il resto rimane lì';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Viene usato un nuovo indirizzo ogni volta (privato, il saldo si distribuisce)';

  @override
  String get changeAddressModeDialogTitle =>
      'Comportamento dell\'indirizzo di resto';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Mantieni i saldi su ogni indirizzo';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Privato';

  @override
  String get requestPasswordHeader => 'Richiedi password';

  @override
  String get requestPasswordAtLaunch => 'All\'avvio';

  @override
  String get requestPasswordWhenLocked => 'Quando bloccato';

  @override
  String get requestPasswordWhenSigning => 'Durante la firma';

  @override
  String get importWalletAdvancedOptions => 'Opzioni avanzate';

  @override
  String get bip39Passphrase => 'Passphrase BIP39';

  @override
  String get bip39PassphraseWarning =>
      'NOTA: non è una password del wallet; passphrase BIP39 diverse aprono wallet diversi.';

  @override
  String get bip39PassphraseEnter => 'Inserisci la passphrase';

  @override
  String get bip39PassphraseConfirm => 'Conferma la passphrase';

  @override
  String get bip39PassphraseMismatch => 'Le passphrase non corrispondono!';

  @override
  String get bip39PassphraseNote => 'Wallet con passphrase BIP39.';

  @override
  String get feePriorityHint => 'Inserisci la commissione di priorità';

  @override
  String get feeBaseUppercase => 'COMMISSIONE BASE';

  @override
  String get feePriorityUppsercase => 'COMMISSIONE DI PRIORITÀ';

  @override
  String get feeUpdateAddressError =>
      'Impossibile riconoscere l\'indirizzo di destinazione';

  @override
  String get feeUpdateRebuildError => 'Impossibile ricostruire la transazione';

  @override
  String get feeUpdateRebuildError2 =>
      'Impossibile ricostruire la transazione con la nuova commissione';

  @override
  String get feeUpdateError => 'Impossibile aggiornare la commissione';

  @override
  String get feeUpdate => 'Aggiorna commissione';

  @override
  String get feeUpdateTitle => 'Aggiornamento commissione';

  @override
  String get feeSheetRecommendedPriority =>
      'Commissioni di priorità consigliate';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'La nuova commissione di priorità deve essere di almeno $amount $symbol';
  }

  @override
  String get txPending => 'IN ATTESA';

  @override
  String get txPendingMessage => 'Questa transazione è in attesa';

  @override
  String get txPendingTitle => 'Transazione in attesa';

  @override
  String get txPendingContent => 'Ci sono transazioni in attesa nel mempool.';

  @override
  String get txPendingActionUpdateFee =>
      'Aggiorna commissione della transazione';

  @override
  String get txPendingActionRbf => 'Sostituisci con commissione (RBF)';

  @override
  String get txInMempool => 'nel mempool';

  @override
  String get utxoSelectionTitle => 'Seleziona UTXO';

  @override
  String get utxoSelectionHint => 'Seleziona altri UTXO';
}
