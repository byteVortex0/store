class ProductsQueries {

  const ProductsQueries._();

  static const ProductsQueries instance = ProductsQueries._();

  factory ProductsQueries() {
    return instance;
  }

  //Get All Products
  Map<String, dynamic> queryOfGetAllProducts() {
    return {
      'query': '''
           {
            products{
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
        ''',
    };
  }
  
}
