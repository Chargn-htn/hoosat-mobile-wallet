// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get account => '账户';

  @override
  String get accounts => '账户';

  @override
  String get ackBackedUp => '您确定助记词已备份？';

  @override
  String get add => '添加';

  @override
  String get addAccount => '添加账户';

  @override
  String get addContact => '添加联系人';

  @override
  String get addNode => '添加节点';

  @override
  String get addNodeFailed => '添加 Hoosat 节点失败';

  @override
  String addNodeFailedMessage(String error) {
    return '失败: $error';
  }

  @override
  String get addNodeSuccess => '添加节点成功';

  @override
  String get addingNodeMessage => '连接节点中, 请等待';

  @override
  String get addingNodeTitle => '添加节点中';

  @override
  String get address => '地址';

  @override
  String get addressCopied => '地址已复制';

  @override
  String get addressCopiedFailed => '复制地址失败';

  @override
  String get addressHint => '输入地址';

  @override
  String get addressMising => '请输入地址';

  @override
  String get addressShare => '分享地址';

  @override
  String get hoosatUriCopied => '已复制 Hoosat URI';

  @override
  String get hoosatUriCopyFailed => '未能成功复制 Hoosat URI';

  @override
  String get advancedHeader => '高级';

  @override
  String get amount => '数额';

  @override
  String amountConfirm(String amount, String coin) {
    return '数额 $amount $coin';
  }

  @override
  String get amountMissing => '请输入数额';

  @override
  String get amountZero => '数额不能为零';

  @override
  String get areYouSure => '请确认?';

  @override
  String get authBiometricMessage => '验证添加钱包';

  @override
  String get authMethod => '验证方法';

  @override
  String get authPinMessage => '输入 PIN 添加钱包';

  @override
  String get autoLockHeader => '自动锁定';

  @override
  String get available => '可用余额';

  @override
  String get back => '返回';

  @override
  String get backupConfirmButton => '我已备份';

  @override
  String get backupSecretPhrase => '备份助记词';

  @override
  String get missingSecretPhrase => '缺少助记词';

  @override
  String get biometricsMethod => '生物识别';

  @override
  String get blockExplorer => '区块浏览器';

  @override
  String get cancel => '取消';

  @override
  String get change => '零钱';

  @override
  String get changeAddress => '零钱地址';

  @override
  String get changeAddressCopied => '零钱地址已复制';

  @override
  String get changeIndex => '零钱索引';

  @override
  String changeIndexParam(String addressIndex) {
    return '零钱 $addressIndex';
  }

  @override
  String get checkCameraPermission => '请检查相机权限';

  @override
  String get clipboardEmpty => '粘贴板为空';

  @override
  String get close => '关闭';

  @override
  String get confirm => '确认';

  @override
  String get confirmPasswordHint => '确认密码';

  @override
  String confirmations(String confirmations) {
    return '$confirmations 确认';
  }

  @override
  String get confirmed => '已确认';

  @override
  String get confirmedMaturing => '已确认 · 成熟中';

  @override
  String get confirming => '确认中';

  @override
  String contactAdded(String contactName) {
    return '$contactName 已被添加到联系人';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address 地址已被复制';
  }

  @override
  String get contactExists => '联系人已存在';

  @override
  String get contactHeader => '联系人';

  @override
  String get contactInvalid => '联系人姓名无效';

  @override
  String get contactNameHint => '输入姓名 @';

  @override
  String get contactNameMissing => '为此联系人选择一个姓名';

  @override
  String contactRemoved(String contactName) {
    return '$contactName 已从联系人名单中刪除!';
  }

  @override
  String get contactsHeader => '联系人';

  @override
  String get contactsImportErr => '无法导入联系人';

  @override
  String contactsImportSuccess(String noContacts) {
    return '已成功导入 $noContacts 位联系人';
  }

  @override
  String get copied => '已复制';

  @override
  String get copy => '复制';

  @override
  String get copyAddress => '复制地址';

  @override
  String get copyErrorButton => '复制出现错误';

  @override
  String get createAPasswordHeader => '创建一个密码。';

  @override
  String get createPasswordFirstParagraph => '您可以创建一个密码来加强您钱包的安全性。';

  @override
  String get createPasswordHint => '创建密码';

  @override
  String get createPasswordSecondParagraph => '密码是可选的，无论如何您的钱包仍会被识别码或生物识别技术保护。';

  @override
  String get createPasswordSheetHeader => '创建';

  @override
  String get currency => '货币';

  @override
  String get currencyPoweredBy => '由 CoinGecko 提供支持';

  @override
  String get defaultAccountName => '地址 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return '账户 $addressIndex';
  }

  @override
  String get defaultWalletName => '我的钱包';

  @override
  String get disablePasswordSheetHeader => '解除';

  @override
  String get disablePasswordSuccess => '钱包密码已被解除';

  @override
  String get disableWalletPassword => '解除钱包密码';

  @override
  String get doContinue => '继续';

  @override
  String get donate => '捐赠';

  @override
  String get donateTo => '捐赠给';

  @override
  String get dontShowAgain => '不再显示';

  @override
  String get emptyCardIntroUtxos => '这是 UTXO 选项卡。此钱包中的所有 UTXO 都会在这里显示。';

  @override
  String get emptyResult => '空结果';

  @override
  String get emptyWalletName => '钱包名称不能为空';

  @override
  String get encryptionFailedError => '钱包密码设置失败';

  @override
  String get enterAddress => '输入地址';

  @override
  String get enterAmount => '输入数额';

  @override
  String get enterFiatValue => '输入法币单位';

  @override
  String get enterNote => '输入笔记';

  @override
  String get enterPasswordHint => '输入您的密码';

  @override
  String get errorMessageCopied => '错误信息已复制到粘贴板';

  @override
  String get exampleCardIntro => '欢迎来到交易选项卡。您发送或接收的交易记录将会在此显示。';

  @override
  String get export => '导出';

  @override
  String get fee => '费用';

  @override
  String feeConfirm(String amount, String coin) {
    return '费用 $amount $coin';
  }

  @override
  String get feeTitle => '费用';

  @override
  String get fetchingTransactions => '获取交易';

  @override
  String get fingerprintSeedBackup => '验证指纹以备份助记词。';

  @override
  String get goBackButton => '返回';

  @override
  String get gotItButton => '明白！';

  @override
  String get import => '导入';

  @override
  String get importSecretPhrase => '导入助记词';

  @override
  String get importSecretPhraseHint => '请在下方输入您的 24 个助记词。';

  @override
  String get importSecretPhraseHintCombo => '请在下方输入 12 或 24 个助记词。';

  @override
  String get importSecretPhraseHintLegacy => '请在下方输入 12 个助记词。';

  @override
  String get importWallet => '导入现有钱包';

  @override
  String get importWalletDescription => '请选择一个以下选项。';

  @override
  String get instantly => '立刻';

  @override
  String get insufficientBalance => '余额不足';

  @override
  String get insufficientBalanceDetails => '您没有足够的 HTN 支付这笔交易';

  @override
  String get invalidAddress => '无效的目标地址';

  @override
  String get invalidAmount => '无效数额';

  @override
  String get invalidChecksumMessage => '请确认助记词\n已正确输入!';

  @override
  String get invalidKpubMessage => '请确认您的扩展公钥被正确输入！';

  @override
  String get invalidDestinationAddress => '无效目标地址';

  @override
  String get invalidPassword => '无效密码';

  @override
  String get hoosatDevFund => 'Hoosat 开发基金';

  @override
  String get hoosatMobile => 'Hoosat Mobile 钱包';

  @override
  String get language => '语言';

  @override
  String get loadingTransactions => '加载交易中... ';

  @override
  String get lockAppSetting => '启动时要求验证';

  @override
  String get locked => '已锁定';

  @override
  String get loggingOutMessage => '登出中...';

  @override
  String get logout => '登出';

  @override
  String get logoutDialogContent => '您确认希望登出这个钱包?';

  @override
  String get logoutOrSwitchWallet => '登出 / 切换钱包';

  @override
  String get manage => '管理';

  @override
  String get manualEntry => '手动输入';

  @override
  String get networkHeader => '网络';

  @override
  String get newAddress => '新地址';

  @override
  String get newWallet => '创建新钱包';

  @override
  String get nextButton => '继续';

  @override
  String get no => '否认';

  @override
  String get noContactsExport => '没有要导出的联系人';

  @override
  String get noContactsImport => '没有新的联系人需要导入';

  @override
  String get noQrCodeFound => '没有发现二维码';

  @override
  String get noSkipButton => '不，跳过';

  @override
  String get noUppercase => '否';

  @override
  String get nodeAddress => 'Hoosat 节点';

  @override
  String get nodeDeleteMessage => '您确定要删除吗？';

  @override
  String get nodeDeleteTitle => '删除 Hoosat 节点配置?';

  @override
  String get nodeNameEmpty => '节点名称不能为空';

  @override
  String get nodeNameHint => '输入节点名称';

  @override
  String get nodeUrlHint => '输入节点 URL';

  @override
  String get nodeUrlInvalid => '无效节点 URL';

  @override
  String get nodesSheetTitle => 'Hoosat 节点';

  @override
  String get off => '关闭';

  @override
  String get on => '开启';

  @override
  String get paperWallet => '纸钱包';

  @override
  String get passwordBlank => '密码不能为空';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      '您以后打开 Hoosat Mobile 不再需要密码了。';

  @override
  String get passwordWillBeRequiredToOpenParagraph => '以后需要这个密码才能打开Hoosat。';

  @override
  String get passwordsDontMatch => '密码不匹配';

  @override
  String get pasteMnemonicError => '粘贴板内容不是有效的助记词';

  @override
  String get pending => '待处理';

  @override
  String get pinConfirmError => '识别码不匹配';

  @override
  String get pinConfirmTitle => '确认您的识别码';

  @override
  String get pinCreateTitle => '创建一个 6 位数的识别码';

  @override
  String get pinEnterTitle => '输入识别码';

  @override
  String get pinInvalid => '输入的识别码无效';

  @override
  String get pinMethod => '识别码';

  @override
  String get pinSeedBackup => '输入识别码以备份钱包助记词';

  @override
  String get preferences => '偏好';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get qrInvalidAddress => '二维码不包含一个有效的地址';

  @override
  String get qrInvalidSeed => '二维码不包含任何有效的种子或私钥';

  @override
  String get qrMnemonicError => '二维码不包含有效的助记词';

  @override
  String get receive => '接收';

  @override
  String get receiveAddress => '接收地址';

  @override
  String get receiveAddressCopied => '接收地址已复制';

  @override
  String get receiveIndex => '接收索引';

  @override
  String receiveIndexParam(String addressIndex) {
    return '接收 $addressIndex';
  }

  @override
  String get received => '已接收';

  @override
  String get removeContact => '删除联系人';

  @override
  String removeContactConfirmation(String contactName) {
    return '您确认要刪除 $contactName 吗？';
  }

  @override
  String get removeWalletAction => '删除钱包';

  @override
  String get removeWalletBiometricsMessage => '验证移除钱包';

  @override
  String get removeWalletDetail =>
      '移除钱包将会从此设备移除助记词和所有钱包相关数据。如果助记词没有备份，资金将永远无法访问。';

  @override
  String get removeWalletPinMessage => '输入识别码移除钱包';

  @override
  String get removeWalletReassurance => '如备份已助记词则不必担心。';

  @override
  String get requireAPasswordToOpenHeader => '需要密码来打开 Hoosat Mobile 吗？';

  @override
  String get restartSetupButton => '重新设置';

  @override
  String get scanQrCode => '扫描二维码';

  @override
  String get scanQrCodeError => '解析二维码已失败';

  @override
  String get scanFromImage => '从图片扫描';

  @override
  String get toggleFlash => '开启/关闭手电筒';

  @override
  String get riskDisclosureHeader => '开始之前';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet 是非托管钱包。您的助记词和私钥仅在此设备上生成和存储——我们从不查看，不会存储在任何服务器上，也无法为您找回。';

  @override
  String get riskDisclosureWarning =>
      '如果您丢失助记词，没有密码重置功能，也没有任何客服团队能够帮您找回资金。妥善保管助记词的责任完全在您自己。';

  @override
  String get riskDisclosureAccept => '我已了解，继续';

  @override
  String get secretInfo => '下一屏，将会看到您的助记词，它是存取资金的密码。请确保备份好，且不要与任何人透露。';

  @override
  String get secretInfoHeader => '安全第一！';

  @override
  String get secretPhrase => '助记词';

  @override
  String get verifyBackupTitle => '验证备份';

  @override
  String get verifyBackupInstruction => '为每个位置选择正确的单词，以确认您已保存助记词。';

  @override
  String verifyBackupWordPrompt(int index) {
    return '第 $index 个单词是什么？';
  }

  @override
  String get verifyBackupWrongAnswer => '不太对。请检查您的备份后重试。';

  @override
  String get secretPhrase12Words => '12 个单词';

  @override
  String get secretPhrase24Words => '24 个单词';

  @override
  String get secretWarning => '如果手机丢失或此程序被卸载，您将需要助记词恢复钱包访问！';

  @override
  String get securityHeader => '安全';

  @override
  String get securitySettingsBiometrics => '请验证身份以访问安全设置';

  @override
  String get securitySettingsPin => '输入 PIN 码以访问安全设置';

  @override
  String get seed => '助记词';

  @override
  String get signMessage => '签名消息';

  @override
  String get signMessageCopySignature => '复制签名';

  @override
  String get signMessageDescription => '使用您的钱包地址之一对消息签名';

  @override
  String get signMessageHint => '输入要签名的消息';

  @override
  String get signMessageSignatureCopied => '签名已复制';

  @override
  String get signMessageSigned => '消息已签名';

  @override
  String get signMessageTooLong => '消息过长';

  @override
  String get seedInvalid => '助记词无效';

  @override
  String get nodeUnreachable => '无法连接到您的节点。余额可能已过期。';

  @override
  String get nodeUnreachableRetry => '重试';

  @override
  String get send => '发送';

  @override
  String get sendConfirm => '发送';

  @override
  String get sendError => '发生错误。请稍后再试。';

  @override
  String get sendNote => '笔记';

  @override
  String get sendToAddressTitle => '至';

  @override
  String get sendTxProgressDescription => '交易发送请等待';

  @override
  String get sendTxProgressTitle => '发送交易中';

  @override
  String get sending => '发送';

  @override
  String get sent => '已发送';

  @override
  String get sentTo => '发送至';

  @override
  String get setPassword => '设置密码';

  @override
  String get setPasswordSuccess => '密码设置成功';

  @override
  String get setWalletPassword => '设置钱包密码';

  @override
  String get settingsHeader => '设置';

  @override
  String get settingsTransfer => '从纸钱包载入';

  @override
  String get setupFailedMessage => '发生了错误';

  @override
  String get shareHoosatMobile => '分享 Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject => '查看 Hoosat Mobile 钱包';

  @override
  String get shareHoosatMobileText =>
      '查看 Hoosat Mobile - Hoosat 移动钱包\n网站 - hoosatworld.net';

  @override
  String get somethingWentWrong => '发生了错误';

  @override
  String get systemDefault => '系统默认';

  @override
  String get tapToHide => '点击隐藏';

  @override
  String get tapToReveal => '点击揭示';

  @override
  String get themeDark => '深色主题';

  @override
  String get themeHeader => '主题';

  @override
  String get themeLight => '浅色主题';

  @override
  String get toggleTheme => '切换主题';

  @override
  String get thisWallet => '#当前钱包';

  @override
  String get to => '至';

  @override
  String get toAddress => '至地址';

  @override
  String get tooManyFailedAttempts => '尝试解锁失败次数过多。';

  @override
  String get totalValue => '总数';

  @override
  String get transactionId => '交易 ID';

  @override
  String get transactionsUppercase => '交易';

  @override
  String get transfer => '传送';

  @override
  String get transferClose => '点击任意位置关闭窗口。';

  @override
  String transferComplete(String amount) {
    return '$amount HTN 成功传送到您的 Hoosat Mobile 钱包。\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return '检测到一个包含 $amount HTN 的钱包。';
  }

  @override
  String get transferConfirmInfoSecond => '按键确定传送钱币。\n';

  @override
  String get transferConfirmInfoThird => '传送需要几秒钟完成，请稍等一下。';

  @override
  String get transferError => '传送出现了问题，请稍后再尝试。';

  @override
  String get transferHeader => '传送钱币';

  @override
  String transferIntro(String button) {
    return '这个过程会将纸钱包的钱币转移到您的 Hoosat Mobile 钱包。\n\n请按 \"$button\" 键开始。';
  }

  @override
  String get transferLoading => '传送中';

  @override
  String get transferManualHint => '请在下方输入助记词。';

  @override
  String get transferNoFunds => '这组助记词不包含任何 HTN';

  @override
  String get transferQrScanError => '这个二维码没有包含任何有效的助记词。';

  @override
  String get transferQrScanHint => '请扫描 Hoosat\n助记词或私钥';

  @override
  String get unconfirmed => '未确认';

  @override
  String get notAccepted => '未能接受';

  @override
  String get accepted => '已接受';

  @override
  String get unknown => '未知';

  @override
  String get unlock => '解锁';

  @override
  String get unlockBiometrics => '验证并解锁 Hoosat Mobile';

  @override
  String get unlockPin => '请输入识别码来解锁 Hoosat Mobile';

  @override
  String get utxosUppercase => 'UTXO';

  @override
  String get viewAddress => '查看地址';

  @override
  String get viewTransaction => '查看交易';

  @override
  String get walletAddresses => '钱包地址';

  @override
  String get walletAddress => '钱包地址';

  @override
  String get walletName => '钱包名称';

  @override
  String get walletNameDescription => '输入钱包名称';

  @override
  String get walletNameHint => '钱包名称';

  @override
  String get walletSetupAddressDiscovery => '运行地址发现';

  @override
  String get walletSetupMessage => '设置钱包中';

  @override
  String get walletsTitle => '钱包';

  @override
  String get warning => '警告';

  @override
  String welcomeMessage(String version) {
    return '欢迎您！\n\n这是 Hoosat Mobile $version - Hoosat 的移动钱包';
  }

  @override
  String get welcomeText => '欢迎来到 Hoosat Mobile。下一步，您可以创建新钱包或导入已有钱包。';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString',
      one: '1',
    );
    return '$_temp0 分钟后';
  }

  @override
  String get yes => '是';

  @override
  String get yesButton => '是';

  @override
  String get yesUppercase => '是';

  @override
  String get nodeNotSyncedException => '节点没有同步';

  @override
  String get nodeNoUTXOIndexException => '节点没有 UTXO 索引';

  @override
  String get nodeSecureConnection => '安全连接';

  @override
  String get hoosatUriInvalid => '无效的 Hoosat 地址';

  @override
  String get compoundUtxos => '合并交易（化零为整）';

  @override
  String get compoundRequired => '合并小额 UTXO';

  @override
  String get compoundRequiredDescription =>
      '你有许多小额未花费输出（UTXO）。合并会把它们整合为更少但更大的 UTXO，使后续转账更快且手续费可能更低。这将创建一笔或多笔交易，并会产生网络手续费。';

  @override
  String get compoundUtxosDescription => '合并多个地址的零钱到一个地址。';

  @override
  String get compoundUtxosConfirmation => '合并交易（化零为整）?';

  @override
  String get compoundingUtxos => '正在合并交易（化零为整）';

  @override
  String get compoundingMessage => '请等待...';

  @override
  String get compoundSuccess => '合并成功';

  @override
  String get compoundFailure => '合并交易失败';

  @override
  String get fundsStillConfirmingTitle => '资金仍在确认中';

  @override
  String get fundsStillConfirmingBody =>
      '此账户中的部分资金到账时间太短，暂时无法发送——网络首先需要一小段成熟等待时间，通常为几分钟。您可以稍等后重试，或从有成熟资金的其他账户发送。';

  @override
  String get fundsStillConfirmingSwitchAccount => '切换账户';

  @override
  String get compoundTooFewUtxos => '至少需要两个 UTXO';

  @override
  String get moveToMain => '归集到主账户';

  @override
  String get moveToMainDescription => '将其他所有地址的余额转入您的主地址';

  @override
  String get moveToMainConfirmation => '全部转入主账户？';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return '这将把 $amount $symbol 从 $count 个其他地址转入您的主地址。此操作会创建一笔或多笔交易，并产生网络费用。';
  }

  @override
  String get moveToMainNothingToMove => '所有地址的余额都已在主账户';

  @override
  String get movingToMain => '正在归集到主账户';

  @override
  String get moveToMainSuccess => '已成功转入主账户';

  @override
  String get moveToMainFailure => '转入主账户失败';

  @override
  String get moveToMainUppercased => '转移';

  @override
  String get manageAccounts => '账户';

  @override
  String get manageAccountsDescription => '添加并管理已命名的地址';

  @override
  String get mainAccountLabel => '主账户';

  @override
  String get archiveAction => '归档';

  @override
  String get restoreAction => '恢复';

  @override
  String get archivedAccountsHeader => '已归档';

  @override
  String get noAdditionalAccountsYet => '暂无其他账户';

  @override
  String get renameAccount => '重命名账户';

  @override
  String get accountLabelHint => '账户名称';

  @override
  String get saveUppercased => '保存';

  @override
  String get addUppercased => '添加';

  @override
  String get sendFromLabel => '来自';

  @override
  String get sendFromAny => '任意';

  @override
  String get home => '首页';

  @override
  String get activity => '活动';

  @override
  String get totalBalance => '总余额';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return '现可使用 $spendable · 仍在到账 $arriving $symbol';
  }

  @override
  String get homeArrivingSoon => '仍在到账的币属于您，很快即可使用。';

  @override
  String homeArrivingReadyIn(String time) {
    return '仍在到账的币可在 $time 后使用。';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return '现可使用 $amount。其余部分可在 $time 后使用。';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return '现可使用 $amount。其余部分仍在到账。';
  }

  @override
  String get txTagWaiting => '等待接受';

  @override
  String get txTagStatusUnknown => '状态未知';

  @override
  String get txTagNotAccepted => '未被接受';

  @override
  String txTagConfirmingOf(String n, String total) {
    return '确认中 $n / $total';
  }

  @override
  String get submittedTo => '提交至';

  @override
  String get testConnection => '测试连接';

  @override
  String get accountsOtherWalletHeader => '来自其他钱包的已保存项（仅查看）';

  @override
  String get accountsOtherWalletNote => '此钱包无法花费这些资金，因此不计入其总额。请打开它们所属的钱包以使用。';

  @override
  String get noActivityTitle => '暂无活动';

  @override
  String get txTypeSent => '已发送';

  @override
  String get txTypeReceived => '已接收';

  @override
  String get txTypeThisWallet => '钱包内部';

  @override
  String get txTypeMerged => '已合并的币';

  @override
  String get noActivityMessage => '您发送或接收 HTN 后，会显示在这里。';

  @override
  String get seeAll => '查看全部';

  @override
  String get show => '显示';

  @override
  String get myAccounts => '我的账户';

  @override
  String homeGreeting(String walletName) {
    return '你好，$walletName';
  }

  @override
  String get balance => '余额';

  @override
  String get maxSend => '最大发送';

  @override
  String get compoundUppercased => '合并';

  @override
  String get closeUppercased => '关闭';

  @override
  String get scanMoreAddresses => '扫描更多地址';

  @override
  String get addressDiscovery => '地址发现';

  @override
  String get scanningTitle => '扫描中';

  @override
  String get scanningDescription => '扫描更多地址中';

  @override
  String get scanMore => '扫描更多';

  @override
  String get scanFailedMessage => '扫描失败，请稍后尝试';

  @override
  String get indexHeader => '索引';

  @override
  String get currentIndex => '当前';

  @override
  String get scannedIndex => '已扫描';

  @override
  String get newIndex => '新建';

  @override
  String get addressFilterDialogTitle => '地址过滤';

  @override
  String get addressFilterDialogOptionAllAddresses => '查看全部地址';

  @override
  String get addressFilterDialogOptionNonZeroBalances => '查看所有非零余额地址';

  @override
  String get importOption24WordsTitle => '导入 24 个助记词';

  @override
  String get importOption24WordsDescription => '与 Cli 钱包和 Ledger 兼容';

  @override
  String get importOption12WordsTitle => '导入 12 个助记词';

  @override
  String get importOption12WordsDescription => '与网页钱包和 KDX 兼容';

  @override
  String get importOptionStandardWalletTitle => '导入标准钱包';

  @override
  String get importOptionStandardWalletDescription =>
      '标准派生的 12 或 24 个单词钱包，可选 BIP39 口令';

  @override
  String get importOptionLegacyWalletTitle => '导入旧版钱包';

  @override
  String get importOptionLegacyWalletDescription =>
      '旧版派生的 12 个单词钱包，兼容旧版 Web Wallet 和 KDX';

  @override
  String get importOptionKpubTitle => '导入只读钱包';

  @override
  String get importOptionKpubDescription => '使用扩展公钥监视一个钱包的余额和交易';

  @override
  String get importKpub => '导入只读钱包';

  @override
  String get importKpubHint => '请输入你的扩展公钥';

  @override
  String get importKpubClipboardError => '粘贴板内容不是一个有效的扩展公钥';

  @override
  String get importKpubQrCodeError => '二维码没有包含一个有效的扩展公钥';

  @override
  String get importKpubInvalidMessage => '请确认你的扩展公钥输入正确。';

  @override
  String get receiveAddressListEmpty => '接收地址列表为空';

  @override
  String get changeAddressListEmpty => '零钱地址列表为空';

  @override
  String get hintAddressListEmpty => '从右上角查看地址过滤';

  @override
  String get invalidSecretPhrase => '无效的秘钥助记词';

  @override
  String get invalidSecretPhraseDetails => '您输入的秘钥助记词未能通过 Checksum 校验。';

  @override
  String get invalidSecretPhraseConfirmation => '我已知晓我的操作';

  @override
  String get contactSupport => '获取支持';

  @override
  String emailAction(String email) {
    return 'Email 地址';
  }

  @override
  String get noteLabel => '备注:';

  @override
  String get optionalLabel => '（可选）';

  @override
  String get buyHoosatSubtitle => '通过 Uphold Topper ';

  @override
  String get buyHoosatTitle => '购买 Hoosat';

  @override
  String get buyHoosatMessage => '简单快速地购买 \$HTN';

  @override
  String get buyHoosatMessageSecondary => '本服务由 Uphold 的法币兑加密货币平台 Topper 提供。';

  @override
  String get getStarted => '开始';

  @override
  String get aboutTopperTitle => '有关 Topper';

  @override
  String get aboutTopperDescription =>
      'Uphold Topper 是一个能过让用户方便地将法币兑换成加密货币的平台，支持使用信用卡、借记卡或银行账户进行支付。';

  @override
  String get moreInfo => '更多信息';

  @override
  String get selectAddress => '选择地址';

  @override
  String get kpubTitle => '扩展公钥';

  @override
  String get kpubAuth => '查看扩展公钥';

  @override
  String get kpubDescription => '本扩展公钥能够让你将本钱包作为「观察钱包」导出至其他支持平台。';

  @override
  String get copyKpub => '复制 Kpub';

  @override
  String get kpubCopied => '已复制扩展公钥';

  @override
  String get kpubCopyFailed => '未能成功复制扩展公钥';

  @override
  String walletAddressesCopied(String addressType) {
    return '钱包 $addressType 地址已复制到剪切板';
  }

  @override
  String walletAddressesCopyFailed(String addressType) {
    return '钱包 $addressType 地址未能成功复制';
  }

  @override
  String get txReport => '交易报告';

  @override
  String get txReportSubtitle => '获取 CSV 格式的交易报告';

  @override
  String get txReportDetails => '生成 CSV 格式的交易报告，其中包含钱包的所有交易历史记录。';

  @override
  String get txReportOptionIgnoreCompound => '忽略合并交易操作';

  @override
  String get txReportOptionIgnoreSelfTxs => '忽略对象为自己的交易操作';

  @override
  String get txReportOptionRefreshTxs => '刷新交易';

  @override
  String get txReportGenerate => '生成';

  @override
  String get txReportStatusRefreshing => '刷新交易中';

  @override
  String get txReportStatusLoading => '加载交易中';

  @override
  String get txReportStatusReady => '交易报告已经完成！';

  @override
  String get txReportGetReport => '获取报告';

  @override
  String get txReportDate => '日期';

  @override
  String get txReportSentAmount => '发送金额';

  @override
  String get txReportSentCurrency => '发送币种';

  @override
  String get txReportReceivedAmount => '接收金额';

  @override
  String get txReportReceivedCurrency => '接收币种';

  @override
  String get txReportFeeAmount => '手续费金额';

  @override
  String get txReportFeeCurrency => '手续费币种';

  @override
  String get txReportLabel => '标签';

  @override
  String get txReportDescription => '描述';

  @override
  String get txReportTxHash => 'TxHash';

  @override
  String get txReportNote => '备注';

  @override
  String get txReportLabelCost => '支出';

  @override
  String get txReportFeeForCompound => '合并交易的费用';

  @override
  String get txReportFeeForSelfSend => '发送给自有地址的费用';

  @override
  String get txReportError => '生成报告时出错';

  @override
  String txReportNoTxs(int numberOf) {
    return '找到 $numberOf 条交易记录。';
  }

  @override
  String txReportNoLoadedTxs(int loadedTxs, int totalTxs) {
    return '($loadedTxs / $totalTxs)';
  }

  @override
  String get txFilterDialogTitle => '筛选交易';

  @override
  String get txFilterDialogOptionAllTxs => '展示所有交易';

  @override
  String get txFilterDialogOptionHideNotAcceptedCoinbase => '隐藏未接受的创币交易';

  @override
  String get changeAddressModeTitle => '找零地址行为';

  @override
  String get changeAddressModeDescriptionKeepPerAddress => '每个地址保留各自的余额，找零留在原处';

  @override
  String get changeAddressModeDescriptionPrivate => '每次使用新地址（私密，余额分散）';

  @override
  String get changeAddressModeDialogTitle => '找零地址行为';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress => '在每个地址上保留余额';

  @override
  String get changeAddressModeDialogOptionPrivate => '私密';

  @override
  String get requestPasswordHeader => '请求密码';

  @override
  String get requestPasswordAtLaunch => '启动时';

  @override
  String get requestPasswordWhenLocked => '锁定时';

  @override
  String get requestPasswordWhenSigning => '签名时';

  @override
  String get importWalletAdvancedOptions => '高级选项';

  @override
  String get bip39Passphrase => 'BIP39 口令';

  @override
  String get bip39PassphraseWarning => '注意：这不是钱包密码，不同的 BIP39 口令会打开不同的钱包。';

  @override
  String get bip39PassphraseEnter => '输入口令';

  @override
  String get bip39PassphraseConfirm => '确认口令';

  @override
  String get bip39PassphraseMismatch => '口令不匹配！';

  @override
  String get bip39PassphraseNote => '带 BIP39 口令的钱包。';

  @override
  String get feePriorityHint => '输入优先费用';

  @override
  String get feeBaseUppercase => '基础费用';

  @override
  String get feePriorityUppsercase => '优先费用';

  @override
  String get feeUpdateAddressError => '无法识别目标地址';

  @override
  String get feeUpdateRebuildError => '重建交易失败';

  @override
  String get feeUpdateRebuildError2 => '使用新费用重建交易失败';

  @override
  String get feeUpdateError => '更新费用失败';

  @override
  String get feeUpdate => '更新费用';

  @override
  String get feeUpdateTitle => '正在更新费用';

  @override
  String get feeSheetRecommendedPriority => '推荐的优先费用';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return '新的优先费用不得低于 $amount $symbol';
  }

  @override
  String get txPending => '待处理';

  @override
  String get txPendingMessage => '此交易待处理';

  @override
  String get txPendingTitle => '待处理交易';

  @override
  String get txPendingContent => '内存池中有待处理的交易。';

  @override
  String get txPendingActionUpdateFee => '更新交易费用';

  @override
  String get txPendingActionRbf => '费用替换 (RBF)';

  @override
  String get txInMempool => '在内存池中';

  @override
  String get utxoSelectionTitle => '选择 UTXO';

  @override
  String get utxoSelectionHint => '请选择更多 UTXO';
}
