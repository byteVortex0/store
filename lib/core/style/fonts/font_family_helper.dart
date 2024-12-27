import 'package:store/core/services/shared_pref/pref_keys.dart';
import 'package:store/core/services/shared_pref/shared_pref.dart';

class FontFamilyHelper {
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  static String getlocalozedFontFamily() {
    final curruntlangauge = SharedPref().getString(PrefKeys.language);
    if (curruntlangauge == 'en') {
      return poppinsEnglish;
    } else {
      return cairoArabic;
    }
  }
}
