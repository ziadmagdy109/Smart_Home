import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/custom_button.dart';
import 'package:smart_home/core/components/custom_text_field.dart';
import 'package:smart_home/view_model/add_device_view_model.dart';

class AddDeviceDialog extends StatefulWidget {
  const AddDeviceDialog({super.key});

  @override
  State<AddDeviceDialog> createState() => _AddDeviceDialogState();
}

class _AddDeviceDialogState extends State<AddDeviceDialog> {
  final controller = Get.put(AddDeviceViewModel());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.discoverDevices();
    //  controller.getWifiInfo();
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddDeviceViewModel>(
      builder:(controller) =>  Dialog(
        backgroundColor: Colors.white,

        child: Container(
          height: 300,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text('Discovering Devices',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(.8)),),
           SizedBox(height: 10.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1- Switch your device to the pairing mode.',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey.withOpacity(.8),fontSize: 10),),
                Text('2- Make sure you know your WIFI credentials to link the device.',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey.withOpacity(.8), fontSize: 10),),

              ],
            ),
            SizedBox(height: 20.h,),
            GestureDetector(onTap: () {

            },child: Center(child: Image.asset('assets/images_home/radar.gif',height: 70,width: 70,))),
            SizedBox(height: 20.h,),
            ...controller.discoveredDevices.map((device) => ListTile(
              title: Text(device.name),
              subtitle: Text(device.productId),
              trailing: IconButton(onPressed: (){
                Get.back();
                Get.dialog(Dialog(
                  backgroundColor: Colors.white,
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      Text('Wifi Connection',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(.8)),),
                      SizedBox(height: 20.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                       //   Text('You are connected to ${controller.ssid}',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey.withOpacity(.8),fontSize: 10),),
                          Text('Make sure you enter your WIFI password to link the device.',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey.withOpacity(.8), fontSize: 10),),
                        ],
                      ),

                      SizedBox(height: 10.h,),
                      CustomTextField(hint: 'Your Wifi SSID', label: 'Wi-Fi SSID',controller: controller.wifiSSid,),
                      SizedBox(height: 10,),
                      CustomTextField(hint: 'Your Wifi Password', label: 'Wi-Fi Password',controller: controller.password,),
                      SizedBox(height: 20.h,),
                      CustomButton(title: 'Add Device',onPressed: () {
                         controller.addDevice(device);
                      },)

                    ],),
                  ),
                ));
              }, icon: Icon(Icons.add)),
            ),)

          ],),
        ),
      ),
    );
  }
}
