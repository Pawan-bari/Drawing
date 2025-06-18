import 'package:drawingui/draw/model/stroke.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Box<List<Stroke>> _drawingbox;

  @override
  void initState() {
    _initializeHive();
    super.initState();
  }

Future<void>  _initializeHive() async
{

_drawingbox = Hive.box<List<Stroke>>('drawing');
setState(() {
  
});
}

void _deletedrawing(String name) async {
  final confirm = await showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Text('Delete Drawing'),
      content: Text('are u sure want to delete $name'),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('cancel')),
        TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text('delete'))
      ],
    )
    );
    if (confirm == true) {
      _drawingbox.delete(name);
      setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Drawing $name deleted')));
    }
}



  @override
  Widget build(BuildContext context) {
    final drawingname = _drawingbox.keys.cast<String>().toList();
   
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
      body: drawingname.isEmpty ? 
      const Center(
        child: Text('No Drawing Saved Yet'),
      ):
       GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),

          itemCount: drawingname.length,
       itemBuilder: (context, index){
        final name = drawingname[index];
        return Stack(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/draw',
                arguments: name);
            
            
              },
              child: Card(
                elevation: 4,
                child: Center(
                  child: Text(name , textAlign: TextAlign.center,
                style:  TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Positioned(child: IconButton(onPressed: () => _deletedrawing(name), icon: Icon(Icons.delete,color: Colors.red,)))
          ],
        );
       })
       ,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.draw),  onPressed: (){
        Navigator.pushReplacementNamed(context, '/draw');
      }),
    /*   Center(
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
      )*/
      );
  }
}