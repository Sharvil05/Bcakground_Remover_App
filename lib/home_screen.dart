import 'package:background_remover_app/constants/images.dart';
import 'package:background_remover_app/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            //Image.asset("assets/images/bg.webp")
            Image.asset(Images.testImages),
        
            SizedBox(height: 20,),

            // Pick Image Button 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.purple)
                ),

                onPressed: (){
                  homeController.pickImage();
                      
              }, child: const Text("Pick Image",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
            )
          ],
        ),
      ),

    );
  }
}