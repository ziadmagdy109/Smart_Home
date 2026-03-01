import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/components/custom_outlined_button.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/components/custom_app_bar.dart';
import 'package:smart_home/view/roooms/widgets/add_device_bottom_sheet.dart';
import 'package:smart_home/view/roooms/widgets/list_rooms_widget.dart';
import 'package:smart_home/view/roooms/widgets/room_categories_widget.dart';

class ListRooms extends StatelessWidget {
  const ListRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppConstants.kDeviceList),
      body: Column(
        children: [
          RoomCategoriesWidget(),
          Expanded(
            child: ListRoomsWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 30.h),
            child:Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(title: AppConstants.kAddNewRoom, onPressed: (){
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.70,
                          minChildSize: 0.35,
                          maxChildSize: 0.9,
                          builder: (context, scrollController) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25),
                                ),
                              ),
                              child: SingleChildScrollView(
                                controller: scrollController,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    left: 20,
                                    right: 20,
                                    bottom:
                                    MediaQuery.of(context).viewInsets.bottom +
                                        20,
                                  ),
                                  child: const AddDeviceBottomSheet(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
