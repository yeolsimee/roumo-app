// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "agree1": MessageLookupByLibrary.simpleMessage("서비스 이용 약관"),
        "agree2": MessageLookupByLibrary.simpleMessage("개인 정보 처리 방침"),
        "agreeAll": MessageLookupByLibrary.simpleMessage("전체동의"),
        "agreeAndContinue": MessageLookupByLibrary.simpleMessage("동의하고 계속하기"),
        "agreementTitle": MessageLookupByLibrary.simpleMessage("이용약관에 동의해주세요"),
        "loginWithApple": MessageLookupByLibrary.simpleMessage("Apple로 로그인"),
        "loginWithGoogle": MessageLookupByLibrary.simpleMessage("구글로 로그인"),
        "loginWithNaver": MessageLookupByLibrary.simpleMessage("네이버로 로그인")
      };
}
