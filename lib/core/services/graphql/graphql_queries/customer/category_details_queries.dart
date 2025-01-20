class CategoryDetailsQueries {
  const CategoryDetailsQueries._();

  static const CategoryDetailsQueries instance = CategoryDetailsQueries._();

  factory CategoryDetailsQueries() {
    return instance;
  }

  Map<String, dynamic> queryOfGetCategoryDetails({required int id}) {
    return {
      'query': '''
           {
            products(categoryId: $id) {
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
