import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view/home/widgets/custom_app_bar_home.dart';
import 'package:smart_home/view/home/widgets/custom_nav_bar.dart';
import 'package:smart_home/view/home/widgets/device_widget.dart';
import 'package:smart_home/view/home/widgets/list_devices_header.dart';
import 'package:smart_home/view/home/widgets/list_home_grid.dart';
import 'package:smart_home/view/home/widgets/list_home_header.dart';
import 'package:smart_home/view/home/widgets/user_info_home.dart';
import 'package:smart_home/view_model/home_view_model.dart';
import 'package:smart_home/view_model/user_view_model.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpened = false;
  final controller = Get.put(HomeViewModel());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.listHomes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder:(controller) =>  Scaffold(
      /* floatingActionButton: FloatingActionButton(onPressed: (){
          TuyaHomeSdkFlutter.instance.removeHome(homeId: controller.selectedHome!.homeId);
        }),*/
       /* floatingActionButton: FloatingActionButton(
          onPressed: () async {
            *//*  await TuyaHomeSdkFlutter.instance.sendVerifyCodeWithUserName(
            countryCode: '20',
            username: 'karimsayffcih@gmail.com',
            type: 1,
          );
      *//*
            *//* final bool success = await TuyaHomeSdkFlutter.instance.registerByUserName(
              username: 'karimsayffcih@gmail.com',
              countryCode: '+1',
              code: '966084',
              password: '123456Aa!'
          );

          if (success) {
            print('User registered successfully');
          } else {
            print('User registration failed');
          }*//*
            *//* await TuyaHomeSdkFlutter.instance.loginWithUserName(
            countryCode: '20', // مثال لمصر
            username: 'karimsayffcih@gmail.com',
            password: '123456Aa!',
          ).then((value) {
            print(value);
          },);*//*

            *//*final home = await TuyaHomeSdkFlutter.instance.addHomeWithName(
            name: 'My Home',
            latitude: 29.84416584781145,
            longitude: 31.33953823504614, geoName: 'home-helwan',
          );*//*

            *//*await TuyaHomeSdkFlutter.instance.getHomeList().then((value) {
           print(value);
         },);*//*

            *//* final home = await TuyaHomeSdkFlutter.instance.getHomeList();

          final res = await home[0].addRoom(
            roomName: 'My Office Room',
          );

          if (res != null) {
            print('Room added successfully');
          }*//*

            *//*  final home = await TuyaHomeSdkFlutter.instance.getHomeList();

          await TuyaHomeSdkFlutter.instance.startConfigBLEWifiDevice(
            ssid: 'TP-Dabaa',
            password: '1810211KE',
            homeId: home[0].homeId,
            deviceUuid: '',
            deviceProductId: '',
          ).then((value) {
           print(value.toString());
          },);*//*

            *//*
         TuyaHomeSdkFlutter.instance.discoverDevices().listen(
                (device) {
              debugPrint("Discovered Device: ${device.name}");
              print('Starting device');
              print(device.toString());
              print(device.uuid);
             print( device.uiId);
             print(device.productId);

            },
            onError: (error) {
              debugPrint("Error discovering devices: $error");
            },
          );*//*
            *//* final home = await TuyaHomeSdkFlutter.instance.getHomeList();

          await TuyaHomeSdkFlutter.instance.startConfigBLEWifiDevice(
            ssid: 'TP-Dabaa',
            password: '1810211KE',
            homeId: home[0].homeId,
            deviceUuid: '3ae78dabf62cb9b6',
            deviceProductId: 'keyjnuy4s3kre7m7',
          ).then((value) {
            print(value.toString());
          },);*//*
            *//* final home = await TuyaHomeSdkFlutter.instance.getHomeList();
          await TuyaHomeSdkFlutter.instance.getHomeDevices(homeId: home[0].homeId).then((value) {



          },);*//*

            if (isOpened) {
              TuyaHomeSdkFlutter.instance.publishDps(
                deviceId: 'bfbc4cbf71b2f7eda8rnrb',
                dps: {'1': false},
              );
              isOpened = false;
            } else {
              TuyaHomeSdkFlutter.instance.publishDps(
                deviceId: 'bfbc4cbf71b2f7eda8rnrb',
                dps: {'1': true},
              );
              isOpened = true;
            }
          },
        ),*/
        key: scaffoldKey,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 40.h,
              bottom: 30.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              children: [
                CustomAppBarHome(),
                SizedBox(height: 30.h),
                UserInfoHome(),
                SizedBox(height: 30.h),
                ListHomeHeader(),
                SizedBox(height: 20.h),
                ListHomeGrid(),
                SizedBox(height: 30.h),
                if(controller.selectedHome != null)...[
                  ListDevicesHeader(),
                  SizedBox(height: 20.h),
                  GetBuilder<HomeViewModel>(
                    builder: (controller) => controller.isLoadingDevices
                        ? Center(child: LoadingIndicator())
                        : controller.devices.isEmpty
                        ? Column(
                      children: [
                        Image.asset(
                          'assets/images_home/no_devices.png',
                          height: 100,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'No Devices Added Yet!',
                          style: AppTextStyles.font12weight400.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                        : Column(
                      spacing: 20,
                      children: [
                        ...controller.devices.map(
                              (e) => DeviceWidget(device: e),
                        ),
                      ],
                    ),
                  ),
                ],
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),

        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 40, left: 20, right: 20),
          child: CustomNavBar(),
        ),
      ),
    );
  }
}
