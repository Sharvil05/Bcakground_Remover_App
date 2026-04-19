
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class HomeController {

 final ImagePicker? _imagePicker = ImagePicker();

///Function to pick image from gallary

  pickImage()async{

    // we know datattype by hover on pickImage
    XFile? image = await _imagePicker!.pickImage(source: ImageSource.gallery);

    if(image==null){

      return;
    }

    // we know datattype by hover on readAsBytes
    // we use read as bytes beacuse we hit the api and image should get in byttes and also return in bytes

    Uint8List imageBytes  = await image.readAsBytes();






  }
}
