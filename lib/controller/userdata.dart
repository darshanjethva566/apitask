import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tab_task/model/apimodel.dart';

import '../service/apiservice.dart';

class UserDataController extends GetxController{
  RxList<Data> uList = <Data>[].obs;
  RxInt emploYee = 0.obs;
  var edit = false.obs;
  Rx<TextEditingController> fname =  TextEditingController().obs;
  Rx<TextEditingController>  lname = TextEditingController().obs;
  Rx<TextEditingController>  email = TextEditingController().obs;


  Future<void> getallusersData() async {

    var respo = await UserService().userService();
    if(respo.data!.isNotEmpty){
      uList.value = respo.data!;
      fname.value.text = respo.data![0].firstName.toString();
      lname.value.text = respo.data![0].lastName.toString();
      email.value.text = respo.data![0].email.toString();
    }

  }
  @override
  void onInit() {
    getallusersData();
    // TODO: implement onInit
    super.onInit();
  }

}
