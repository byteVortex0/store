import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../di/injection_container.dart';

class PickImageUtils {
  const PickImageUtils._();
  static const PickImageUtils instance = PickImageUtils._();
  factory PickImageUtils() {
    return instance;
  }

  Future<XFile?> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return XFile(image.path);
      }
      return null;
    } catch (e) {
      final permissionState = await Permission.photos.status;
      if (permissionState.isDenied) {
        await _showAlertPermissionsDialog();
      }else{
        debugPrint('Exception in Pick image: $e');
      }
    }
    return null;
  }
  
  Future<void> _showAlertPermissionsDialog() {
    return showCupertinoDialog(
      context: sl<GlobalKey<NavigatorState>>().currentState!.context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: openAppSettings,
              child: Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}
