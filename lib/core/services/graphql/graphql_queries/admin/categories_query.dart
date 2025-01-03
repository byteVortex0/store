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

  //create category
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
  
  // delete category
  Map<String, dynamic> queryOfDeleteCategory(
      {required String id}) {
    return {
      'query': r'''
           mutation DeleteCategory($id: ID!){
              deleteCategory(id: $id)
            } ,
             
        ''',
      'variables': {
        'id': id,
      }
    };
  }
}
