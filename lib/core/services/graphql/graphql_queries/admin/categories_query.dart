class CategoriesQuery {
  const CategoriesQuery._();

  static const CategoriesQuery instance = CategoriesQuery._();

  factory CategoriesQuery() {
    return instance;
  }

  //Products
  Map<String, dynamic> queryOfGetAllCategories() {
    return {
      'query': '''
           {
            categories{
              id
              name
              image	  
            }
          }     
        ''',
    };
  }
}
