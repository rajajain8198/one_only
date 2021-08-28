import 'package:floor/floor.dart';
import 'package:one_only/Database/ModelClass/userDetails_ModelClass.dart';

@dao
abstract class UserDetailsDAO {
  @Query('SELECT * FROM UserDetailsModelClass')
  Future<List<UserDetailsModelClass>> findAllUser();

  @Query('SELECT * FROM UserDetailsModelClass WHERE email = :email')
  Stream<UserDetailsModelClass?> findUserByEmail(String email);

  @insert
  Future<List<UserDetailsModelClass>> insertUserDetails(
      UserDetailsModelClass userDetailsModelClass);
}
