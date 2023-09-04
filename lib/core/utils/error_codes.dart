class TTErrorCodes {
  static const TTErrorCode canNotProcessIdCard = TTErrorCode('419');
  static const TTErrorCode canNotProcessCarPassport = TTErrorCode('418');
  static const TTErrorCode canNotProcessAllDocuments = TTErrorCode('418 419');
}

class TTErrorCode {
  final String statusCode;

  const TTErrorCode(this.statusCode);

  @override
  String toString() {
    return statusCode;
  }
}
