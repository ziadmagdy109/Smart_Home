import 'package:flutter_bloc/flutter_bloc.dart';

class RoomTabsCubit extends Cubit<int> {
  RoomTabsCubit() : super(0);

  void changeTab(int index) => emit(index);
}
