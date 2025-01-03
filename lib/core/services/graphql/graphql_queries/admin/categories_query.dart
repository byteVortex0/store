import 'package:store/features/admin/add_categories/data/models/create_category_request.dart';

class CategoriesQuery {
  const CategoriesQuery._();

  static const CategoriesQuery instance = CategoriesQuery._();

  factory CategoriesQuery() {
    return instance;
  }

  //Get All Categories
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

  //creeate category
  Map<String, dynamic> queryOfCreateCategory(
      {required CreateCategoryRequest body}) {
    return {
      'query': r'''
           mutation CreateCategory($name: String!, $image: String!){
              addCategory(
                data: { name: $name, image: $image }
              ) {
                name
                image
              }
            } ,
             
        ''',
      'variables': {
        'name': body.name,
        'image': body.image,
      }
    };
  }
}
