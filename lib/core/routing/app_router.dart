import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/features/home/presentation/views/add_new_room_home_view.dart';
import 'package:smart_home/features/home/presentation/views/home_view.dart';
import 'package:smart_home/features/home/presentation/views/notifications_view.dart';
import 'package:smart_home/features/home/presentation/views/profile_edit_view.dart';
import 'package:smart_home/features/home/presentation/widgets/MainScreen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.homeView:
        return MaterialPageRoute(
          builder: (context) => HomeView(controller: ZoomDrawerController()),
        );
      case Routes.addNewRoomHomeView:
        return MaterialPageRoute(builder: (context) => AddNewRoomHomeView());
      case Routes.notificationsView:
        return MaterialPageRoute(builder: (context) => NotificationsView());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (context) => MainScreen());
      case Routes.profileEditView:
        return MaterialPageRoute(builder: (context) => ProfileEditView());
      default:
        Scaffold(body: Center(child: Text("not found page")));
    }
    return null;
  }
}
