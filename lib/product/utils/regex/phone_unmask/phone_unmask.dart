class PhoneUnmask {
  String _unMasked = "";
  var _reg = RegExp(r'\d{1,11}');

  PhoneUnmask._();

  static PhoneUnmask? _instance;
  static PhoneUnmask get instance {
    _instance ??= PhoneUnmask._();
    return _instance!;
  }

  String unMask({required String text}) {
    if (_unMasked != null) _unMasked = "";
    _reg.allMatches(text).forEach((element) {
      _unMasked += element.group(0)!;
    });

    return _unMasked;
  }
}
