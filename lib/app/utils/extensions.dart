extension APIStatus on int? {
  bool get isSuccess {
    late final bool success;

    if (this == null) {
      return false;
    }

    if (this! >= 200 && this! < 300) {
      success = true;
    } else {
      success = false;
    }

    return success;
  }
}
