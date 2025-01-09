import '../../../../../features/admin/add_prodcuts/data/models/create_products_request_body.dart';
import '../../../../../features/admin/add_prodcuts/data/models/update_products_request_body.dart';

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

  //Create Products
  Map<String, dynamic> queryOfCreateProducts(
      {required CreateProductsRequestBody body}) {
    return {
      'query': r'''
           mutation CreateProduct($title: String!, $price: Float!, $description: String!, $images: [String!]!, $categoryId: Float!){
            addProduct(
              data: {
                title: $title
                price: $price
                description: $description
                categoryId: $categoryId
                images: $images
              }
            ) {
              title
            }
          }     
        ''',
      'variables': {
        'title': body.title,
        'price': body.price,
        'description': body.description,
        'images': body.image,
        'categoryId': body.categoryId,
      }
    };
  }

  // delete product
  Map<String, dynamic> queryOfDeleteProduct(
      {required String id}) {
    return {
      'query': r'''
           mutation DeleteProduct($id: ID!){
              deleteProduct(id: $id)
            } 
        ''',
      'variables': {
        'id': id,
      }
    };
  }

  //Create Products
  Map<String, dynamic> queryOfUpdateProducts(
      {required UpdateProductsRequestBody body}) {
    return {
      'query': r'''
           mutation UpdateProduct($id: ID!, $title: String!, $price: Float!, $description: String!, $images: [String!]!, $categoryId: Float!){
            updateProduct(
              id: $id,
              changes: {
                title: $title
                price: $price
                description: $description
                categoryId: $categoryId
                images: $images
              }
            ) {
              title
            }
          }     
        ''',
      'variables': {
        'id': body.productId,
        'title': body.title,
        'price': body.price,
        'description': body.description,
        'images': body.image,
        'categoryId': body.categoryId,
      }
    };
  }

}
