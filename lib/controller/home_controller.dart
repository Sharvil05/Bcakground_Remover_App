
import 'dart:convert';

import 'package:background_remover_app/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class HomeController {

 final ImagePicker? _imagePicker = ImagePicker();


///Function to pick image from gallary

  Future<Uint8List?> pickImage()async{

    try{

      // we know datattype by hover on pickImage
    XFile? image = await _imagePicker!.pickImage(source: ImageSource.gallery);

    if(image==null){

      return null;
    }

    // we know datattype by hover on readAsBytes
    // we use read as bytes beacuse we hit the api and image should get in byttes and also return in bytes

    Uint8List imageBytes  = await image.readAsBytes();

    return imageBytes;

    }catch(e){

      debugPrint(e.toString());
      
      return null;
    }
  }

  // Function to Remove background of an image

  Future<Uint8List?> removeBackground(Uint8List imagebytes)async{

    try{

      // Convert imagebytes in base64 because we use it in below

      String base64 = base64Encode(imagebytes);

      Uri uri = Uri.parse(MyApis.removebgApi);
      Response response = await post(
        
        uri,

        headers: {
          // It gives in documentation
          //'X-API-Key': 'szQud2VRFEDdE755EHSQipsj'

          'X-API-Key': MyApis.apiKey

        },
        body: {
          'image_file_b64': base64
        }
        );


        if(response.statusCode==200){
         Uint8List result =  response.bodyBytes;

         return result;

        }else if(response.statusCode==400){
          debugPrint("Invalid parameters or input file unprocessable");
          return null;

        }else if(response.statusCode==402){
          debugPrint("Insufficient credits");
           return null;

        }else if(response.statusCode==403){
          debugPrint("Authentication Failed");
           return null;

        }else{
          debugPrint("Status Code : ${response.statusCode}");
           return null;
        }

    }catch(e){
      debugPrint(e.toString());
       return null;
    }
    



  }
}
