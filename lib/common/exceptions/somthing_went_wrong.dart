import 'package:flutter_template/common/translations/translations.dart';

import 'base_exception.dart';

class SomethingWentWrong extends BaseException {

  SomethingWentWrong() : super(LocaleKeys.somethingWentWrong.tr());

}