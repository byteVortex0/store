class ProductsViewAllQueries {
  const ProductsViewAllQueries._();

  static const ProductsViewAllQueries instance = ProductsViewAllQueries._();

  factory ProductsViewAllQueries() {
    return instance;
  }

  Map<String, dynamic> queryOfGetProductsViewAll({required int offset}) {
    return {
      'query': '''
           {
            products(limit: 6, offset: $offset) {
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
