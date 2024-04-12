import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'US_en': {'Home': 'Home', 'Language': 'Language'},
        'TH_th': {'Home': 'หน้าหลัก', 'Language': 'ภาษา'}
      };
}
