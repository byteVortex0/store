import '../../../../../features/customer/search/data/models/search_request_body.dart';

class SearchQueries {
  const SearchQueries._();

  static const SearchQueries instance = SearchQueries._();

  factory SearchQueries() {
    return instance;
  }

  Map<String, dynamic> queryOfSearchForProductsbyTitle(
      {required String title}) {
    return {
      'query': '''
           {
            products(title: "$title") {
              id
              title
              price
              description
              images
              category {
                id
                name
                } 
            }
          }
      
        '''
    };
  }

  Map<String, dynamic> queryOfSearchForProductsbyPrice(
      {required SearchRequestBody body}) {
    return {
      'query': '''
           {
            products(price_min: ${body.priceMin}, price_max: ${body.priceMax}) {
              id
              title
              price
              description
              images
              category {
                id
                name
                } 
            }
          }
      
        '''
    };
  }
}
