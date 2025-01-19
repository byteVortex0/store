class HomeQueries {
  const HomeQueries._();

  static const HomeQueries instance = HomeQueries._();

  factory HomeQueries() {
    return instance;
  }

  //Get All Banners
  Map<String, dynamic> queryOfGetAllBanners() {
    return {
      'query': '''
           {
            products{
              title
              images
            }
          }     
        ''',
    };
  }
}
