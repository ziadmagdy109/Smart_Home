import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/custom_button.dart';
import 'package:smart_home/core/components/custom_text_field.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/view_model/add_home_view_model.dart';

class AddHomeBottomSheet extends StatefulWidget {
  const AddHomeBottomSheet({super.key});

  @override
  State<AddHomeBottomSheet> createState() => _AddHomeBottomSheetState();
}

class _AddHomeBottomSheetState extends State<AddHomeBottomSheet> {
  final controller = Get.put(AddHomeViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddHomeViewModel>(
      builder:(controller) =>  Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white
        ),
        height: 420,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Add New Home',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
              SizedBox(height: 20.h,),
              CustomTextField(hint: 'My Main Home', label: 'Home Name',controller: controller.nameController,),
              SizedBox(height: 10.h,),
              CustomTextField(hint: 'Cairo, Abdu-Allah St. 5th Settlement', label: 'Address',controller: controller.geoNameController,),
              SizedBox(height: 20.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rooms'),

                  IconButton(onPressed: (){
                    controller.rooms.add(TextEditingController());
                    controller.update();
                  }, icon: Icon(Icons.add_box_rounded,color: AppColors.myGreen,))
                ],
              ),

              SizedBox(height: 10.h,),
              Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(controller.rooms.isEmpty)
                    Text('Click on the + Icon to Add Rooms',style: TextStyle(color: Colors.grey),),
                  ...controller.rooms.map((e) => CustomTextField(hint: 'Ex. Living Room', label: 'Room Name',controller: e,suffixIcon: IconButton(onPressed: (){
                    controller.rooms.remove(e);
                    controller.update();
                  }, icon: Icon(Icons.close)),),),
                ],
              ),
              SizedBox(height: 40.h,),
              CustomButton(title: 'Submit',onPressed: () {

                controller.addHome().then((_){
                  Get.back();
                });
              },)
            ],
          ),
        ),
      ),
    );
  }
}
