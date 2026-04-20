import 'dart:typed_data';

import 'package:background_remover_app/constants/images.dart';
import 'package:background_remover_app/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   Uint8List? resultImage ;

   bool isLoading =false;


  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();


    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Background Remover",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [

            // test Image
            //Image.asset("assets/images/bg.webp")
            // Image.asset(Images.testImages),

            // Real Browse image form gallary

            isLoading==true
              ?

              CircularProgressIndicator()

              :
              
            resultImage == null ?Image.asset(Images.testImages)
              :

              Image.memory(resultImage!),
        
            SizedBox(height: 20,),

            // Pick Image Button 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.purple)
                ),

                onPressed: ()async{
                  isLoading=true;

                  Uint8List? imageBytes = await  homeController.pickImage();

                  if(imageBytes==null){
                    setState(() {
                      isLoading=false;
                    });
                    return;

                  }

                  resultImage = await  homeController.removeBackground(imageBytes);
                  setState(() {
                    isLoading=false;
                    
                  });
                      
              }, child: const Text("Pick Image",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
            )
          ],
        ),
      ),

    );
  }
}