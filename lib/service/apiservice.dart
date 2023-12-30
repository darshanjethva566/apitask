import 'package:dio/dio.dart';
import 'package:tab_task/model/apimodel.dart';
import 'package:tab_task/utils/apiconstants.dart';


class UserService{
  Dio dio = Dio();

  Future<UserData> userService()async{

    final respo = await dio.get("${Apiurls.userlisting}users?page=1");
    print("userData: ${respo.data}");
    if(respo.statusCode==200){

      return UserData.fromJson(respo.data);
    }
    else{
      throw "Something went wrong";
    }
  }



}
