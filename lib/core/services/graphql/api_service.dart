import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store/core/app/upload_image/model/upload_image_response.dart';
import 'package:store/features/admin/add_categories/data/models/create_category_response.dart';
import 'package:store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:store/features/admin/add_prodcuts/data/models/get_all_products_response.dart';
import 'package:store/features/admin/dashboard/data/models/products_number_response.dart';
import 'package:store/features/auth/data/models/login_response.dart';
import 'package:store/features/auth/data/models/sign_up_response.dart';
import 'package:store/features/auth/data/models/user_role_response.dart';

import '../../../features/admin/dashboard/data/models/categories_number_response.dart';
import '../../../features/admin/dashboard/data/models/users_number_response.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //Login
  @POST(graphql)
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> mutation,
  );

  //admin or customer
  @GET('/api/v1/auth/profile')
  Future<UserRoleResponse> userRole(String token);//admin or customer
  
  @POST('/api/v1/files/upload')
  Future<UploadImageResponse> uploadImage(
    @Body() FormData file,
  );

  //signUp
  @POST(graphql)
  Future<SignUpResponse> signUp(
    @Body() Map<String, dynamic> mutation,
  ); 
  
  //Products
  @POST(graphql)
  Future<ProductsNumberResponse> numberOfProducts(
    @Body() Map<String, dynamic> query,
  ); 
  
  //Categories
  @POST(graphql)
  Future<CategoriesNumberResponse> numberOfCategories(
    @Body() Map<String, dynamic> query,
  );

  //Users
  @POST(graphql)
  Future<UsersNumberResponse> numberOfUsers(
    @Body() Map<String, dynamic> query,
  );
  
  @POST(graphql)
  Future<GetAllCategoriesResponse> getAllCategories(
    @Body() Map<String, dynamic> query,
  );
  
  @POST(graphql)
  Future<CreateCategoryResponse> createCategory(
    @Body() Map<String, dynamic> mutation,
  );
  
  @POST(graphql)
  Future<void> deleteCategory(
    @Body() Map<String, dynamic> mutation,
  );
  
  @POST(graphql)
  Future<void> updateCategory(
    @Body() Map<String, dynamic> mutation,
  );
  
  @POST(graphql)
  Future<GetAllProductsResponse> getAllProducts(
    @Body() Map<String, dynamic> query,
  );

  
}
