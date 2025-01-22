class ProductDetailsQueries {
  const ProductDetailsQueries._();

  static const ProductDetailsQueries instance = ProductDetailsQueries._();

  factory ProductDetailsQueries() {
    return instance;
  }

  Map<String, dynamic> queryOfGetOneProduct({required int id}) {
    return {
      'query': '''
           {
            product(id: $id) {
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
