import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Drawing',style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton( 
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/draw');
          }, 
          child: Text( 
            'Create New Drawing', 
            style: TextStyle( 
              color: Colors.white, 
              fontSize: 18, 
            ), 
          ), 
          style: ElevatedButton.styleFrom( 
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10), 
             backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder( 
              borderRadius: BorderRadius.circular(10),
               
            ), 
          animationDuration: Duration(seconds: 0),
          
          elevation: 10), 
        ), 
      ));
  }
}