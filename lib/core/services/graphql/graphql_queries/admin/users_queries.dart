class UsersQuery {
  const UsersQuery._();

  static const UsersQuery _instance = UsersQuery._();

  factory UsersQuery() => _instance;

  Map<String, dynamic> queryOfGetAllUsers() {
    return {
      'query': '''
         {
          users {
            id 
            name
            email
          }
        }
      ''',
    };
  }
  
  Map<String, dynamic> queryOfDeleteUsers({required String id}) {
    return {
      'query': r'''
          mutation DeleteUser($id: ID!){
            deleteUser(id: $id)
          }
      ''',
      'variables': {
        'id': id,
      }
    };
  }
}
