import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnackBar({required String message, required bool isError, String? title}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    textColor: Colors.white,
    fontSize: 16,
    backgroundColor: isError ? Colors.red.shade700 : Colors.green,
  );
}

String formatLineType(String status){
  if(status == 'PRIVATE'){
    return 'خدمة النقل الخاص';
  }else if(status == 'PUBLIC'){
    return 'خدمة النقل الجماعي';
  }else{
    return status;
  }
}

String formatStatus(String status){
  if(status == 'ACTIVE'){
    return 'طلب نشط';
  }else if(status == 'RETURNING'){
    return 'طلب تم إرجاعه';
  }else if(status == 'CANCELLED'){
    return 'تم إلغاء الطلب';
  }else if(status == 'PENDING'){
    return 'قيد الطلب';
  }else if(status == 'ACCEPTED'){
    return 'طلب مقبول';
  }else if(status == 'DELIVERING'){
    return 'طلب قيد التوصيل';
  }else if(status == 'DELIVERED'){
    return 'طلب تم توصيله';
  }else if(status == 'COMPLETED'){
    return 'طلب مكتمل';
  }else{
    return status;
  }
}