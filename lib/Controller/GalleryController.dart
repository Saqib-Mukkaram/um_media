import 'package:image_picker/image_picker.dart';
class GalleryController {

  

  static Future getImageFromGallery() async {
   ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

}