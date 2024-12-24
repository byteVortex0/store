class FontFamilyHelper {
  
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  
  static String getlocalozedFontFamily(){
    //TODO: Sherd preferance
    final curruntlangauge = 'ar';
    if (curruntlangauge == 'en') {
      return poppinsEnglish;
    }else{
      return cairoArabic;
    }
  }

}