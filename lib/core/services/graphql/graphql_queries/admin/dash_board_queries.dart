class DashBoardQueries {
  const DashBoardQueries._();

  static const DashBoardQueries instance = DashBoardQueries._();

  factory DashBoardQueries() {
    return instance;
  }

  //Products
  Map<String, dynamic> queryOfProducts() {
    return {
      'query': '''
           {
            products{	
              title   
            }
          }     
        ''',
    };
  }

  //Categories
  Map<String, dynamic> queryOfCategories() {
    return {
      'query': '''
           {
            categories{	
              name   
            }
          }     
        ''',
    };
  }

  //Users
  Map<String, dynamic> queryOfUsers() {
    return {
      'query': '''
           {
            users{	
              name   
            }
          }     
        ''',
    };
  }
}
