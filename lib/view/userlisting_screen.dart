import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tab_task/controller/userdata.dart';

import 'package:tab_task/utils/widgetconstant.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final get = Get.put(UserDataController());
  final key =  GlobalKey<FormState>();
  void changeEmpDetails(index){
    if(index>=0) {
      get.fname.value.text = get.uList.value[index].firstName!;
      get.lname.value.text = get.uList.value[index].lastName!;
      get.email.value.text = get.uList.value[index].email!;
      get.edit.value = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:Wconstans.textWithPro("User Profile", 20, Colors.white, FontWeight.w400),
        backgroundColor: Colors.black,
        actions: [

         TextButton(child: Icon(Icons.refresh,color: Colors.white,),onPressed: () {
           get.getallusersData();
           get.emploYee.value = 0;
           get.edit.value = false;
         },)
        ],
      ),
      body: Obx(() => get.uList.value.isEmpty?Center(child: Wconstans.textWithPro('User Not Found',16,Colors.white,FontWeight.w400),):
       Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16),
        child: ListView(
          children: [
            Container(height: 60.h,width: 1.sw,
            child: tabBar(),),
            Wconstans.sizerwidth(0.h, 20.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20.r)
              ),
              child: Padding(
                padding:  EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 50.r,backgroundImage: NetworkImage(get.uList[get.emploYee.value].avatar.toString()),),
                    Wconstans.sizerwidth(0.h, 10.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: () {
                          get.edit.value = true;
                        }, icon: Icon(Icons.edit,color: Colors.purple[800],)),
                        IconButton(onPressed: () {
                          if(get.uList.value.length==get.emploYee.value+1){

                            get.uList.removeAt(get.emploYee.value);
                            get.emploYee.value = get.emploYee.value -1;
                            changeEmpDetails(get.emploYee.value);


                          }
                          else {
                            get.uList.removeAt(get.emploYee.value);
                            changeEmpDetails(get.emploYee.value);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Delete Successfully !")));


                        }, icon: Icon(Icons.delete,color: Colors.red,)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Wconstans.textWithPro("First Name", 15, Colors.white, FontWeight.w500),
                        Wconstans.textWithPro(" : ", 15, Colors.white, FontWeight.w400),

                        Container(
                          width: 200,
                          child: TextFormField(
                            enabled: get.edit.value,
                            keyboardType: TextInputType.name,
                            controller: get.fname.value,
                            style: TextStyle(fontWeight: FontWeight.w600,fontFamily: "Poppins",color: Colors.white),


                            decoration: InputDecoration(

                                contentPadding: EdgeInsets.zero,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ) ,
                                focusedBorder:UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ) ,
                                disabledBorder:UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            )
                            ),),
                        )

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Wconstans.textWithPro("Last Name", 15, Colors.white, FontWeight.w500),
                        Wconstans.textWithPro(" : ", 15, Colors.white, FontWeight.w400),
                        Container(
                          width: 200,
                          child: TextFormField(
                            enabled: get.edit.value,
                            keyboardType: TextInputType.name,
                            controller: get.lname.value,
                            style: TextStyle(fontWeight: FontWeight.w600,fontFamily: "Poppins",color: Colors.white),


                            decoration: InputDecoration(

                                contentPadding: EdgeInsets.zero,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ) ,
                                focusedBorder:UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ) ,
                                disabledBorder:UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            )
                            ),),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Wconstans.textWithPro("Email          ", 15, Colors.white, FontWeight.w500),
                        Wconstans.textWithPro(" : ", 15, Colors.white, FontWeight.w400),

                        Container(
                          width: 200,
                          child: TextFormField(
                            enabled: get.edit.value,
                            keyboardType: TextInputType.name,
                            controller: get.email.value,
                            style: TextStyle(fontWeight: FontWeight.w600,fontFamily: "Poppins",color: Colors.white),


                            decoration: InputDecoration(

                                contentPadding: EdgeInsets.zero,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ) ,
                                focusedBorder:UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ) ,
                                disabledBorder:UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            )
                            ),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if(get.edit.value)
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                children: [
                  ElevatedButton(onPressed: () {

                    changeEmpDetails(get.emploYee.value);

                  }, child: Text("Cancel")),
                  Wconstans.sizerwidth(15.w, 0.h),
                  ElevatedButton(onPressed: () {

                      get.uList.value[get.emploYee.value].firstName = get.fname.value.text;
                      get.uList.value[get.emploYee.value].lastName = get.lname.value.text;
                      get.uList.value[get.emploYee.value].email = get.email.value.text;
                      get.edit.value=false;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Saved successfully !")));

                  }, child: Text("Save")),
                ],
                            ),
              )
          ],
        ),
      )),
    );
  }


  Widget tabBar() {
    return ListView.builder(scrollDirection: Axis.horizontal,shrinkWrap: true,itemCount: get.uList.value.length,itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    changeEmpDetails(index);
                    get.emploYee.value = index;
                  },
                  child: Card(
                    color: index==get.emploYee.value?Colors.purple[900]:Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                      child: Wconstans.textWithPro("Employee "+ "${get.uList[index].id}", 15, index==get.emploYee.value?Colors.white:Colors.black, FontWeight.w500),
                    ),
                  ),
                ),
              ),
            );
          },);
  }


}
