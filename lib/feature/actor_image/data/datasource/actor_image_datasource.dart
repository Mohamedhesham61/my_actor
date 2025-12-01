import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../core/network/api_constants.dart';
import '../../../../core/utils/toast_msg.dart';

Future<void> saveNetworkImage(String url) async {
  var status = await Permission.photos.status;
  if (!status.isGranted) {
    status = await Permission.photos.request();
  }
  if (status.isGranted) {

    try {
      toastMsg('Downloading....');
      final response = await Dio().get(
        ApiConstants.imageUrl(url),
        options: Options(responseType: ResponseType.bytes),
      );
      final bytes = Uint8List.fromList(response.data);
      final asset = await PhotoManager.editor.saveImage(
        bytes,
        title: 'image_${DateTime.now().millisecondsSinceEpoch}.jpg', filename: 'My_Actors_App',
      );

      if (asset != null) {
        toastMsg('Image saved!');
        print("Image saved!");
      } else {
        print("Failed saving image!");
      }
    } catch (e) {
      toastMsg('Failed saving image!');
      print("Error: $e");
    }
  }
  if(status.isPermanentlyDenied){
    openAppSettings();
  }

}