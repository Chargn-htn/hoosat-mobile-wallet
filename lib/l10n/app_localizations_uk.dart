// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get account => 'Рахунок';

  @override
  String get accounts => 'Рахунки';

  @override
  String get ackBackedUp =>
      'Ви впевнені, що зробили резервну копію вашої секретної seed-фрази ?';

  @override
  String get add => 'Додати';

  @override
  String get addAccount => 'Додати рахунок';

  @override
  String get addContact => 'Додати контакт';

  @override
  String get addNode => 'Додати ноду';

  @override
  String get addNodeFailed => 'Помилка додавання ноди Hoosat';

  @override
  String addNodeFailedMessage(String error) {
    return 'Невдало: $error';
  }

  @override
  String get addNodeSuccess => 'Нода додана успішно';

  @override
  String get addingNodeMessage =>
      'Будь-ласка, зачекайте, доки ми встановимо з\'єднання з нодою';

  @override
  String get addingNodeTitle => 'Додавання ноди';

  @override
  String get address => 'Адреса';

  @override
  String get addressCopied => 'Адресу скопійовано';

  @override
  String get addressCopiedFailed => 'Не вдалося скопіювати адресу';

  @override
  String get addressHint => 'Введіть адресу';

  @override
  String get addressMising => 'Будь-ласка, введіть адресу';

  @override
  String get addressShare => 'Поділитися адресою';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Додаткові налаштування';

  @override
  String get amount => 'Сума';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Сума $amount $coin';
  }

  @override
  String get amountMissing => 'Будь-ласка, введіть суму';

  @override
  String get amountZero => 'Сума не може бути рівна нулю';

  @override
  String get areYouSure => 'Ви впевнені?';

  @override
  String get authBiometricMessage => 'Авторизуйтесь, щоб додати гаманець';

  @override
  String get authMethod => 'Метод автентифікації';

  @override
  String get authPinMessage => 'Введіть PIN-код, щоб додати гаманець.';

  @override
  String get autoLockHeader => 'Автоматично блокувати';

  @override
  String get available => 'Доступно';

  @override
  String get back => 'Назад';

  @override
  String get backupConfirmButton => 'Резервну копію створено';

  @override
  String get backupSecretPhrase => 'Резервна копія секретної фрази';

  @override
  String get missingSecretPhrase => 'Секретну seed-фразу не знайдено';

  @override
  String get biometricsMethod => 'Біометрія';

  @override
  String get blockExplorer => 'Дослідник блокчейну';

  @override
  String get cancel => 'Скасувати';

  @override
  String get change => 'Решта';

  @override
  String get changeAddress => 'Адреса решти';

  @override
  String get changeAddressCopied => 'Адресу решти скопійовано';

  @override
  String get changeIndex => 'Індекс решти';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Решта $addressIndex';
  }

  @override
  String get checkCameraPermission =>
      'Будь-ласка, перевірте права доступу до камери';

  @override
  String get clipboardEmpty => 'Буфер обміну порожній';

  @override
  String get close => 'Закрити';

  @override
  String get confirm => 'Підтвердити';

  @override
  String get confirmPasswordHint => 'Підтвердити пароль';

  @override
  String confirmations(String confirmations) {
    return '$confirmations підтведжень';
  }

  @override
  String get confirmed => 'підтверджено';

  @override
  String get confirmedMaturing => 'підтверджено · дозріває';

  @override
  String get confirming => 'підтверджується';

  @override
  String contactAdded(String contactName) {
    return '$contactName додано до контактів';
  }

  @override
  String contactAddressCopied(String address) {
    return 'адресу $address скопійовано';
  }

  @override
  String get contactExists => 'Такий контакт вже існує';

  @override
  String get contactHeader => 'Контакт';

  @override
  String get contactInvalid => 'Невірне ім\'я контакта';

  @override
  String get contactNameHint => 'Введіть ім\'я @';

  @override
  String get contactNameMissing => 'Введіть ім\'я контакта';

  @override
  String contactRemoved(String contactName) {
    return '$contactName було видалено з контактів!';
  }

  @override
  String get contactsHeader => 'Контакти';

  @override
  String get contactsImportErr => 'Не вдалося імпортувати контакти';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'Успішно імпортовано $noContacts контактів';
  }

  @override
  String get copied => 'Скопійовано';

  @override
  String get copy => 'Копіювати';

  @override
  String get copyAddress => 'Копіювати адресу';

  @override
  String get copyErrorButton => 'Помилка копіювання';

  @override
  String get createAPasswordHeader => 'Встановити пароль.';

  @override
  String get createPasswordFirstParagraph =>
      'Ви можете встановити пароль для додаткового захисту вашого гаманця.';

  @override
  String get createPasswordHint => 'Встановити пароль';

  @override
  String get createPasswordSecondParagraph =>
      'Пароль є опціональним, в будь-якому разі ваш гаманець буде захищений вашим PIN-кодом або біометричними даними.';

  @override
  String get createPasswordSheetHeader => 'Створити';

  @override
  String get currency => 'Валюта';

  @override
  String get currencyPoweredBy => 'За допомогою CoinGecko';

  @override
  String get defaultAccountName => 'Адреса 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Отримання $addressIndex';
  }

  @override
  String get defaultWalletName => 'Мій гаманець';

  @override
  String get disablePasswordSheetHeader => 'Вимкнути';

  @override
  String get disablePasswordSuccess => 'Пароль було вимкнено';

  @override
  String get disableWalletPassword => 'Вимкнути пароль гаманця';

  @override
  String get doContinue => 'Продовжити';

  @override
  String get donate => 'Пожертвувати';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Не показувати знову';

  @override
  String get emptyCardIntroUtxos =>
      'Це вкладка невитраченого результату транзакції - UTXO. Усі UTXOs у вашому гаманці з\'являтимуться тут.';

  @override
  String get emptyResult => 'Порожній результат';

  @override
  String get emptyWalletName => 'Назва гаманця не може бути порожньою';

  @override
  String get encryptionFailedError => 'Не вдалося встановити пароль гаманця';

  @override
  String get enterAddress => 'Введіть адресу';

  @override
  String get enterAmount => 'Введіть суму';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Введіть примітку';

  @override
  String get enterPasswordHint => 'Введіть пароль';

  @override
  String get errorMessageCopied =>
      'Повідомлення про помилку скопійовано в буфер обміну';

  @override
  String get exampleCardIntro =>
      'Це вкладка транзакцій. Як тільки ви надішлете або отримаєте транзакцію - вона з\'явиться тут.';

  @override
  String get export => 'Експорт';

  @override
  String get fee => 'Комісія';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Комісія $amount $coin';
  }

  @override
  String get feeTitle => 'КОМІСІЯ';

  @override
  String get fetchingTransactions => 'Завантаження транзакцій';

  @override
  String get fingerprintSeedBackup =>
      'Автентифікуйтесь, щоб зробити резервну копію секретної seed-фрази.';

  @override
  String get goBackButton => 'Назад';

  @override
  String get gotItButton => 'Зрозуміло!';

  @override
  String get import => 'Імпортувати';

  @override
  String get importSecretPhrase => 'Імпортувати секретну фразу';

  @override
  String get importSecretPhraseHint =>
      'Будь-ласка, введіть вашу секретну seed фразу з 24-ох слів нижче.';

  @override
  String get importSecretPhraseHintCombo =>
      'Будь ласка, введіть свою секретну фразу з 12 або 24 слів нижче.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Будь ласка, введіть свою секретну фразу з 12 слів нижче.';

  @override
  String get importWallet => 'Імпортувати гаманець';

  @override
  String get importWalletDescription => 'Будь ласка, оберіть варіант нижче.';

  @override
  String get instantly => 'Миттєво';

  @override
  String get insufficientBalance => 'Недостатній баланс';

  @override
  String get insufficientBalanceDetails =>
      'У вас недостатньо HTN для даної транзакції';

  @override
  String get invalidAddress => 'Введено неправильну адресу';

  @override
  String get invalidAmount => 'Неправильна сума';

  @override
  String get invalidChecksumMessage =>
      'Будь-ласка, перевірте правильність введення вашої \nсекретної seed-фрази!';

  @override
  String get invalidKpubMessage =>
      'Будь ласка, перевірте правильність введення вашого розширеного публічного ключа!';

  @override
  String get invalidDestinationAddress => 'Неправильна адреса призначення';

  @override
  String get invalidPassword => 'Невірний пароль';

  @override
  String get hoosatDevFund => 'Фонд розвитку Hoosat';

  @override
  String get hoosatMobile => 'Гаманець Hoosat Mobile';

  @override
  String get language => 'Мова';

  @override
  String get loadingTransactions => 'Завантаження транзакцій...';

  @override
  String get lockAppSetting => 'Аутентифікуватися при вході';

  @override
  String get locked => 'Заблоковано';

  @override
  String get loggingOutMessage => 'Вихід з системи...';

  @override
  String get logout => 'Вийти';

  @override
  String get logoutDialogContent =>
      'Ви впевнені, що хочете вийти з цього гаманця?';

  @override
  String get logoutOrSwitchWallet => 'Вийти / Змінити гаманець';

  @override
  String get manage => 'Управління';

  @override
  String get manualEntry => 'Ручне введення';

  @override
  String get networkHeader => 'Мережа';

  @override
  String get newAddress => 'Нова адреса';

  @override
  String get newWallet => 'Новий гаманець';

  @override
  String get nextButton => 'Далі';

  @override
  String get no => 'Ні';

  @override
  String get noContactsExport => 'Немає контактів для експорту';

  @override
  String get noContactsImport => 'Немає нових контактів для імпорту';

  @override
  String get noQrCodeFound => 'QR-Код не знайдено';

  @override
  String get noSkipButton => 'Ні, пропустити';

  @override
  String get noUppercase => 'НІ';

  @override
  String get nodeAddress => 'Нода Hoosat';

  @override
  String get nodeDeleteMessage => 'Ви впевнені, що бажаєте видалити?';

  @override
  String get nodeDeleteTitle => 'Видалити конфігурацію ноди Hoosat?';

  @override
  String get nodeNameEmpty => 'Назва ноди не може бути порожньою';

  @override
  String get nodeNameHint => 'Введіть назву ноди';

  @override
  String get nodeUrlHint => 'Введіть URL-адресу Ноди';

  @override
  String get nodeUrlInvalid => 'Невірна URL-адреса ноди';

  @override
  String get nodesSheetTitle => 'Ноди Hoosat';

  @override
  String get off => 'Вимкнено';

  @override
  String get on => 'Увімкнено';

  @override
  String get paperWallet => 'Паперовий гаманець';

  @override
  String get passwordBlank => 'Пароль не може бути порожнім';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Вам більше не знадобиться пароль, щоб відкрити цей гаманець.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Цей пароль буде необхідним, щоб відкрити даний гаманець.';

  @override
  String get passwordsDontMatch => 'Паролі не співпадають';

  @override
  String get pasteMnemonicError =>
      'Вміст буфера обміну не є дійсною секретною seed-фразою';

  @override
  String get pending => 'очікується';

  @override
  String get pinConfirmError => 'PIN-коди не співпадають';

  @override
  String get pinConfirmTitle => 'Підтвердіть ваш PIN-код';

  @override
  String get pinCreateTitle => 'Створіть PIN-код з 6-ти цифр';

  @override
  String get pinEnterTitle => 'Введіть PIN-код';

  @override
  String get pinInvalid => 'Введено невірний PIN-код';

  @override
  String get pinMethod => 'PIN-Код';

  @override
  String get pinSeedBackup =>
      'Введіть PIN-код, щоб створити резервну копію секретної seed-фрази';

  @override
  String get preferences => 'Налаштування';

  @override
  String get privacyPolicy => 'Політика приватності';

  @override
  String get qrInvalidAddress => 'QR-Код не містить дійсну адресу';

  @override
  String get qrInvalidSeed =>
      'QR-код не містить правильної секретної seed-фрази або приватного ключа';

  @override
  String get qrMnemonicError =>
      'QR-код не містить правильної секретної seed-фрази';

  @override
  String get receive => 'Отримати';

  @override
  String get receiveAddress => 'Адреса отримання';

  @override
  String get receiveAddressCopied => 'Адресу отримання скопійовано';

  @override
  String get receiveIndex => 'Індекс отримання';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Отримання $addressIndex';
  }

  @override
  String get received => 'Отримано';

  @override
  String get removeContact => 'Видалити контакт';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Ви впевнені, що хочете видалити $contactName?';
  }

  @override
  String get removeWalletAction => 'Видалити гаманець';

  @override
  String get removeWalletBiometricsMessage =>
      'Авторизуйтесь, щоб видалити гаманець';

  @override
  String get removeWalletDetail =>
      'Видалення цього гаманця призведе до видалення секретної seed-фрази та всіх даних, пов\'язаних з гаманцем, з цього пристрою. Якщо ви не збережете резервну копію секретної seed-фрази - ви більше ніколи не зможете отримати доступ до своїх коштів.';

  @override
  String get removeWalletPinMessage => 'Введіть PIN-код для видалення гаманця';

  @override
  String get removeWalletReassurance =>
      'До тих пір, допоки ви створили та зберігаєте резервну копію секретної seed-фрази у безпечному місці - вам немає про що хвилюватися.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Вимагати пароль, щоб відкрити цей гаманець?';

  @override
  String get restartSetupButton => 'Перезапуск налаштувань';

  @override
  String get scanQrCode => 'Сканувати QR-код';

  @override
  String get scanQrCodeError => 'Не вдалося розпізнати QR-код';

  @override
  String get scanFromImage => 'Сканувати із зображення';

  @override
  String get toggleFlash => 'Увімкнути/вимкнути ліхтарик';

  @override
  String get riskDisclosureHeader => 'Перш ніж почати';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet — некастодіальний гаманець. Ваша секретна seed-фраза та приватні ключі створюються й зберігаються лише на цьому пристрої — ми ніколи їх не бачимо, не зберігаємо на жодному сервері й не можемо відновити їх для вас.';

  @override
  String get riskDisclosureWarning =>
      'Якщо ви втратите секретну seed-фразу, скидання пароля не існує, а служби підтримки, яка б повернула ваші кошти, немає. Ви самі несете відповідальність за її збереження.';

  @override
  String get riskDisclosureAccept => 'Я розумію, продовжити';

  @override
  String get secretInfo =>
      'На наступному екрані ви побачите свою секретну seed-фразу. Це пароль для доступу до ваших коштів. Надзвичайно важливо, щоб ви створили його резервну копію і ніколи нікому її не повідомляли.';

  @override
  String get secretInfoHeader => 'Перш за все - безпека!';

  @override
  String get secretPhrase => 'Секретна seed-фраза';

  @override
  String get verifyBackupTitle => 'Перевірте резервну копію';

  @override
  String get verifyBackupInstruction =>
      'Виберіть правильне слово для кожної позиції, щоб підтвердити, що ви зберегли секретну seed-фразу.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Яке слово №$index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Не зовсім так. Перевірте резервну копію та спробуйте ще раз.';

  @override
  String get secretPhrase12Words => '12 слів';

  @override
  String get secretPhrase24Words => '24 слова';

  @override
  String get secretWarning =>
      'Якщо ви втратите ваш пристрій або видалите додаток, вам обов\'язково та неминуче знадобиться ваша секретна seed-фраза, щоб відновити кошти!';

  @override
  String get securityHeader => 'Безпека';

  @override
  String get securitySettingsBiometrics =>
      'Пройдіть автентифікацію, щоб відкрити налаштування безпеки';

  @override
  String get securitySettingsPin =>
      'Введіть PIN-код, щоб відкрити налаштування безпеки';

  @override
  String get seed => 'Seed-фраза';

  @override
  String get signMessage => 'Підписати повідомлення';

  @override
  String get signMessageCopySignature => 'Копіювати підпис';

  @override
  String get signMessageDescription =>
      'Підпишіть повідомлення однією з адрес вашого гаманця';

  @override
  String get signMessageHint => 'Введіть повідомлення для підпису';

  @override
  String get signMessageSignatureCopied => 'Підпис скопійовано';

  @override
  String get signMessageSigned => 'Повідомлення підписано';

  @override
  String get signMessageTooLong => 'Повідомлення занадто довге';

  @override
  String get seedInvalid => 'Невірна seed-фраза';

  @override
  String get nodeUnreachable =>
      'Не вдається зв\'язатися з вашим вузлом. Баланси можуть бути застарілими.';

  @override
  String get nodeUnreachableRetry => 'Повторити';

  @override
  String get send => 'Надіслати';

  @override
  String get sendConfirm => 'Надіслати';

  @override
  String get sendError => 'Виникла помилка. Будь-ласка, спробуйте ще раз';

  @override
  String get sendNote => 'НОТАТКА';

  @override
  String get sendToAddressTitle => 'До';

  @override
  String get sendTxProgressDescription =>
      'Будь-ласка, зачекайте, поки транзакція буде надіслана';

  @override
  String get sendTxProgressTitle => 'Надсилаємо транзакцію';

  @override
  String get sending => 'Надіслати';

  @override
  String get sent => 'Надіслано';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Встановити пароль';

  @override
  String get setPasswordSuccess => 'Пароль було успішно встановлено';

  @override
  String get setWalletPassword => 'Встановити пароль гаманця';

  @override
  String get settingsHeader => 'Налаштування';

  @override
  String get settingsTransfer => 'Завантажити з паперового гаманця';

  @override
  String get setupFailedMessage => 'Щось пішло не так';

  @override
  String get shareHoosatMobile => 'Поділитися Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject => 'Спробуйте гаманець Hoosat Mobile';

  @override
  String get shareHoosatMobileText =>
      'Спробуйте Hoosat Mobile - мобільний гаманець Hoosat.\nВебсайт - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Щось пішло не так';

  @override
  String get systemDefault => 'Системна за замовчуванням';

  @override
  String get tapToHide => 'Натисніть, щоб приховати';

  @override
  String get tapToReveal => 'Натисність, щоб показати';

  @override
  String get themeDark => 'Темна тема';

  @override
  String get themeHeader => 'Тема';

  @override
  String get themeLight => 'Світла тема';

  @override
  String get toggleTheme => 'Змінити тему';

  @override
  String get thisWallet => '#Цей гаманець';

  @override
  String get to => 'До';

  @override
  String get toAddress => 'На адресу';

  @override
  String get tooManyFailedAttempts =>
      'Занадто багато невдалих спроб розблокування.';

  @override
  String get totalValue => 'Загальна сума';

  @override
  String get transactionId => 'Ідентифікатор транзакції';

  @override
  String get transactionsUppercase => 'ТРАНЗАКЦІЇ';

  @override
  String get transfer => 'Переказ';

  @override
  String get transferClose => 'Натисніть будь-де, щоб закрити вікно.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN успішно перераховано до вашого гаманця Hoosat Mobile. \n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'Виявлено гаманець з балансом $amount HTN.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Натисніть \"Підтвердити\" для переказу коштів.\n';

  @override
  String get transferConfirmInfoThird =>
      'Виконання переказу може зайняти кілька секунд.';

  @override
  String get transferError =>
      'Під час переказу сталася помилка. Будь-ласка, спробуйте пізніше.';

  @override
  String get transferHeader => 'Переказати кошти';

  @override
  String transferIntro(String button) {
    return 'Цей процес перенесе кошти з паперового гаманця у ваш гаманець Hoosat Mobile.\n\nНатисніть кнопку \"$button\", щоб почати.';
  }

  @override
  String get transferLoading => 'Переказується';

  @override
  String get transferManualHint => 'Будь-ласка, введіть вашу seed-фразу нижче.';

  @override
  String get transferNoFunds => 'Ця seed-фраза не містить HTN на балансі.';

  @override
  String get transferQrScanError =>
      'Цей QR-код не містить правильної seed-фрази.';

  @override
  String get transferQrScanHint =>
      'Сканувати seed-фразу \nHoosat або приватний ключ';

  @override
  String get unconfirmed => 'непідтверджено';

  @override
  String get notAccepted => 'не прийнято';

  @override
  String get accepted => 'прийнято';

  @override
  String get unknown => 'невідомий';

  @override
  String get unlock => 'Розблокувати';

  @override
  String get unlockBiometrics => 'Автентифікуйтесь, щоб розблокувати гаманець';

  @override
  String get unlockPin => 'Введіть PIN-код, щоб розблокувати гаманець';

  @override
  String get utxosUppercase => 'UTXOs';

  @override
  String get viewAddress => 'Переглянути адресу';

  @override
  String get viewTransaction => 'Переглянути транзакцію';

  @override
  String get walletAddresses => 'Адреси гаманця';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Назва гаманця';

  @override
  String get walletNameDescription => 'Введіть назву для вашого гаманця';

  @override
  String get walletNameHint => 'Назва гаманця';

  @override
  String get walletSetupAddressDiscovery => 'Запущено пошук адрес';

  @override
  String get walletSetupMessage => 'Створення гаманця';

  @override
  String get walletsTitle => 'Гаманці';

  @override
  String get warning => 'Попередження';

  @override
  String welcomeMessage(String version) {
    return 'Ласкаво просимо!\n\nЦе версія $version Hoosat Mobile - мобільного гаманця Hoosat.';
  }

  @override
  String get welcomeText =>
      'Вітаємо в Hoosat Mobile. Щоб розпочати, створіть новий гаманець або імпортуйте існуючий.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString хвилин',
      one: '1 хвилини',
    );
    return 'Після $_temp0';
  }

  @override
  String get yes => 'Так';

  @override
  String get yesButton => 'Так';

  @override
  String get yesUppercase => 'ТАК';

  @override
  String get nodeNotSyncedException => 'Нода не синхронізована';

  @override
  String get nodeNoUTXOIndexException => 'Нода не має індексу UTXO';

  @override
  String get nodeSecureConnection => 'Захищене з\'єднання';

  @override
  String get hoosatUriInvalid => 'Невірний URI Hoosat';

  @override
  String get compoundUtxos => 'Об\'єднати транзакції';

  @override
  String get compoundRequired => 'Консолідувати дрібні UTXO';

  @override
  String get compoundRequiredDescription =>
      'У вас багато невеликих невитрачених виходів (UTXO). Консолідація об’єднає їх у меншу кількість більших UTXO, щоб майбутні перекази були швидшими та, можливо, із нижчими комісіями. Це створить одну або кілька транзакцій і спричинить мережеві комісії.';

  @override
  String get compoundUtxosDescription => 'Об\'єднати декілька UTXO в один';

  @override
  String get compoundUtxosConfirmation => 'Об\'єднати транзакції?';

  @override
  String get compoundingUtxos => 'Об\'єднування транзакцій';

  @override
  String get compoundingMessage => 'Будь ласка, зачекайте...';

  @override
  String get compoundSuccess => 'Об\'єднання завершено успішно';

  @override
  String get compoundFailure => 'Не вдалося об\'єднати транзакції';

  @override
  String get fundsStillConfirmingTitle => 'Кошти ще підтверджуються';

  @override
  String get fundsStillConfirmingBody =>
      'Частину коштів на цьому рахунку отримано надто нещодавно, щоб їх можна було надіслати — мережа спершу вимагає короткого очікування дозрівання, зазвичай кілька хвилин. Ви можете зачекати й спробувати ще раз або надіслати з іншого рахунку, на якому є дозрілі кошти.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Змінити рахунок';

  @override
  String get compoundTooFewUtxos => 'Потрібно принаймні два UTXO';

  @override
  String get moveToMain => 'Зібрати на Основному';

  @override
  String get moveToMainDescription =>
      'Перенести баланс усіх інших адрес на вашу основну адресу';

  @override
  String get moveToMainConfirmation => 'Перенести все на Основний?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Це перенесе $amount $symbol з $count інших адрес на вашу основну адресу. Буде створено одну або кілька транзакцій, за які стягується комісія мережі.';
  }

  @override
  String get moveToMainNothingToMove => 'Баланс усіх адрес уже на Основному';

  @override
  String get movingToMain => 'Збір на Основному';

  @override
  String get moveToMainSuccess => 'Перенесення на Основний виконано';

  @override
  String get moveToMainFailure => 'Не вдалося перенести на Основний';

  @override
  String get moveToMainUppercased => 'ПЕРЕНЕСТИ';

  @override
  String get manageAccounts => 'Рахунки';

  @override
  String get manageAccountsDescription =>
      'Додавайте адреси з назвами та керуйте ними';

  @override
  String get mainAccountLabel => 'Основний';

  @override
  String get archiveAction => 'Архівувати';

  @override
  String get restoreAction => 'Відновити';

  @override
  String get archivedAccountsHeader => 'В архіві';

  @override
  String get noAdditionalAccountsYet => 'Додаткових рахунків ще немає';

  @override
  String get renameAccount => 'Перейменувати рахунок';

  @override
  String get accountLabelHint => 'Назва рахунку';

  @override
  String get saveUppercased => 'ЗБЕРЕГТИ';

  @override
  String get addUppercased => 'ДОДАТИ';

  @override
  String get sendFromLabel => 'Звідки';

  @override
  String get sendFromAny => 'Будь-який';

  @override
  String get home => 'Головна';

  @override
  String get activity => 'Активність';

  @override
  String get totalBalance => 'Загальний баланс';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Доступно зараз $spendable · Ще надходить $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Монети, що ще надходять, ваші, і їх можна буде витратити невдовзі.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Монети, що ще надходять, можна буде витратити через $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Доступно зараз $amount. Решту можна буде витратити через $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Доступно зараз $amount. Решта ще надходить.';
  }

  @override
  String get txTagWaiting => 'очікує прийняття';

  @override
  String get txTagStatusUnknown => 'статус невідомий';

  @override
  String get txTagNotAccepted => 'не прийнято';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'підтвердження $n / $total';
  }

  @override
  String get submittedTo => 'Надіслано до';

  @override
  String get testConnection => 'Перевірити з\'єднання';

  @override
  String get accountsOtherWalletHeader =>
      'Збережено з іншого гаманця (лише перегляд)';

  @override
  String get accountsOtherWalletNote =>
      'Цей гаманець не може витратити ці кошти, тому вони не враховуються в його загальному балансі. Відкрийте гаманець, якому вони належать, щоб ними скористатися.';

  @override
  String get noActivityTitle => 'Активності ще немає';

  @override
  String get txTypeSent => 'Надіслано';

  @override
  String get txTypeReceived => 'Отримано';

  @override
  String get txTypeThisWallet => 'У межах гаманця';

  @override
  String get txTypeMerged => 'Об\'єднані монети';

  @override
  String get noActivityMessage =>
      'Коли ви надішлете або отримаєте HTN, це з\'явиться тут.';

  @override
  String get seeAll => 'Показати все';

  @override
  String get show => 'Показати';

  @override
  String get myAccounts => 'Мої рахунки';

  @override
  String homeGreeting(String walletName) {
    return 'Привіт, $walletName';
  }

  @override
  String get balance => 'Баланс';

  @override
  String get maxSend => 'Надіслати максимум ';

  @override
  String get compoundUppercased => 'ОБ\'ЄДНАТИ';

  @override
  String get closeUppercased => 'ЗАКРИТИ';

  @override
  String get scanMoreAddresses => 'Сканувати більше адрес';

  @override
  String get addressDiscovery => 'Виявлення адрес';

  @override
  String get scanningTitle => 'Сканування';

  @override
  String get scanningDescription => 'Сканування нових адрес...';

  @override
  String get scanMore => 'СКАНУВАТИ БІЛЬШЕ';

  @override
  String get scanFailedMessage => 'Сканування не вдалося, спробуйте пізніше';

  @override
  String get indexHeader => 'Індекс';

  @override
  String get currentIndex => 'Поточний';

  @override
  String get scannedIndex => 'Відскановано';

  @override
  String get newIndex => 'Новий';

  @override
  String get addressFilterDialogTitle => 'Фільтр адрес';

  @override
  String get addressFilterDialogOptionAllAddresses => 'Переглянути всі адреси';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'Переглянути адреси з балансом';

  @override
  String get importOption24WordsTitle => 'Імпортувати секретну фразу з 24 слів';

  @override
  String get importOption24WordsDescription =>
      'Сумісний з консольним гаманцем CLI та Ledger';

  @override
  String get importOption12WordsTitle => 'Імпортувати секретну фразу з 12 слів';

  @override
  String get importOption12WordsDescription => 'Сумісний з веб-гаманцем та KDX';

  @override
  String get importOptionStandardWalletTitle => 'Імпорт стандартного гаманця';

  @override
  String get importOptionStandardWalletDescription =>
      'Гаманці зі стандартною деривацією на 12 або 24 слова, з необов\'язковою парольною фразою BIP39';

  @override
  String get importOptionLegacyWalletTitle => 'Імпорт застарілого гаманця';

  @override
  String get importOptionLegacyWalletDescription =>
      'Гаманці на 12 слів із застарілою деривацією, сумісні зі старим Web Wallet і KDX';

  @override
  String get importOptionKpubTitle =>
      'Імпортувати гаманець тільки для перегладу';

  @override
  String get importOptionKpubDescription =>
      'Контролюйте баланс і транзакції гаманця за допомогою розширеного публічного ключа';

  @override
  String get importKpub => 'Імпортувати гаманець тільки для перегладу';

  @override
  String get importKpubHint =>
      'Будь ласка, введіть ваш розширений публічний ключ.';

  @override
  String get importKpubClipboardError =>
      'Вміст буфера обміну не є дійсним розширеним публічним ключем';

  @override
  String get importKpubQrCodeError =>
      'QR-код не містить дійсного розширеного публічного ключа';

  @override
  String get importKpubInvalidMessage =>
      'Будь ласка, перевірте, чи ваш розширений публічний ключ введено коректно!';

  @override
  String get receiveAddressListEmpty => 'Список адрес для отримування порожній';

  @override
  String get changeAddressListEmpty => 'Список адрес для решти порожній';

  @override
  String get hintAddressListEmpty =>
      'Перевірте фільтр адрес у верхньому правому кутку';

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
  String get changeAddressModeTitle => 'Поведінка адреси решти';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Кожна адреса зберігає свій баланс, а решта лишається на місці';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Щоразу використовується нова адреса (приватно, баланс розподіляється)';

  @override
  String get changeAddressModeDialogTitle => 'Поведінка адреси решти';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Зберігати баланси на кожній адресі';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Приватний';

  @override
  String get requestPasswordHeader => 'Запитувати пароль';

  @override
  String get requestPasswordAtLaunch => 'Під час запуску';

  @override
  String get requestPasswordWhenLocked => 'Коли заблоковано';

  @override
  String get requestPasswordWhenSigning => 'Під час підпису';

  @override
  String get importWalletAdvancedOptions => 'Додаткові параметри';

  @override
  String get bip39Passphrase => 'Парольна фраза BIP39';

  @override
  String get bip39PassphraseWarning =>
      'УВАГА: це не пароль гаманця — різні парольні фрази BIP39 відкривають різні гаманці.';

  @override
  String get bip39PassphraseEnter => 'Введіть парольну фразу';

  @override
  String get bip39PassphraseConfirm => 'Підтвердіть парольну фразу';

  @override
  String get bip39PassphraseMismatch => 'Парольні фрази не збігаються!';

  @override
  String get bip39PassphraseNote => 'Гаманець із парольною фразою BIP39.';

  @override
  String get feePriorityHint => 'Введіть пріоритетну комісію';

  @override
  String get feeBaseUppercase => 'БАЗОВА КОМІСІЯ';

  @override
  String get feePriorityUppsercase => 'ПРІОРИТЕТНА КОМІСІЯ';

  @override
  String get feeUpdateAddressError =>
      'Не вдалося розпізнати адресу призначення';

  @override
  String get feeUpdateRebuildError => 'Не вдалося перебудувати транзакцію';

  @override
  String get feeUpdateRebuildError2 =>
      'Не вдалося перебудувати транзакцію з новою комісією';

  @override
  String get feeUpdateError => 'Не вдалося оновити комісію';

  @override
  String get feeUpdate => 'Оновити комісію';

  @override
  String get feeUpdateTitle => 'Оновлення комісії';

  @override
  String get feeSheetRecommendedPriority => 'Рекомендовані пріоритетні комісії';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Нова пріоритетна комісія має бути не меншою за $amount $symbol';
  }

  @override
  String get txPending => 'ОЧІКУЄ';

  @override
  String get txPendingMessage => 'Ця транзакція очікує';

  @override
  String get txPendingTitle => 'Транзакція очікує';

  @override
  String get txPendingContent => 'У мемпулі є транзакції, що очікують.';

  @override
  String get txPendingActionUpdateFee => 'Оновити комісію транзакції';

  @override
  String get txPendingActionRbf => 'Замінити комісією (RBF)';

  @override
  String get txInMempool => 'у мемпулі';

  @override
  String get utxoSelectionTitle => 'Вибір UTXO';

  @override
  String get utxoSelectionHint => 'Будь ласка, виберіть більше UTXO';
}
