import 'package:drawingui/draw/model/stroke.dart';
import 'package:flutter/material.dart';

class Drawscreen extends StatefulWidget {
  const Drawscreen({super.key});

  @override
  State<Drawscreen> createState() => _DrawscreenState();
}

class _DrawscreenState extends State<Drawscreen> {
  List<Stroke> _strokes =[];
  List<Stroke> _redostrokes =[];
  List<Offset> _currentPoints =[];
  Color _selectedcolor = Colors.black;
  double _brushsize = 4.0;  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Draw your Drawing',style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      backgroundColor: Colors.blueAccent,
      leading: IconButton(onPressed: () {
        Navigator.pushReplacementNamed(context, '/home');
      }, icon: Icon(Icons.arrow_back)),),
      
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanStart: (details){
                setState(() {
                  
                  _currentPoints.add(details.localPosition);
                });
              },
              onPanUpdate: (details){
                setState(() {
                  
                
                _currentPoints.add(details.localPosition);
                });
              },
              onPanEnd: (details){
                setState(() {
                  _strokes.add(
                  Stroke(points: List.from(_currentPoints),
                   color: _selectedcolor, 
                   brushsize: _brushsize
                   ),
            
                );
                _currentPoints = [];
                _redostrokes  =[];
                });
                
            
              },
              child: CustomPaint(
                painter: DrawPainter(
                  strokes : _strokes,
                  currentPoints : _currentPoints,
                  currentcolor : _selectedcolor,
                  currentbrushsize: _brushsize
                ),
                size: Size.infinite,
              ),
            ),
          ),
         _buildtoolbar()
        ],
      ),

    );
  }


  Widget _buildtoolbar(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 8),
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: _strokes.isNotEmpty ? (){
            setState(() {
              _redostrokes.add(_strokes.removeLast());
            });
          }:null,
           icon: const Icon(Icons.undo)
           ),

        IconButton(onPressed: _strokes.isNotEmpty ? (){
            setState(() {
              _strokes.add(_redostrokes.removeLast());
            });
          }:null,
           icon: const Icon(Icons.redo)
           )
        ],
      ),
    );
  }
}
class DrawPainter extends CustomPainter {
  
final List<Stroke> strokes;
final List<Offset> currentPoints;
final Color currentcolor;
final double currentbrushsize;

  DrawPainter({super.repaint, required this.strokes, required this.currentPoints, required this.currentcolor, required this.currentbrushsize});
  
  Widget build(BuildContext context) {
    return Container();
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    for(final stroke in strokes){
      final paint = Paint()
      ..color=stroke.color
      ..strokeCap=StrokeCap.round
      ..strokeWidth=stroke.brushsize;

      for(int i =0; i<stroke.points.length-1;i++){
        if(stroke.points[i] != Offset.zero && stroke.points[i+1] != Offset.zero){
          canvas.drawLine(stroke.points[i], stroke.points[i+1], paint);
        }
      }
    }

    final paint = Paint()
    ..color = currentcolor
    ..strokeCap = StrokeCap.round
    ..strokeWidth = currentbrushsize;
    
    for(int i =0; i<currentPoints.length-1;i++){
        if(currentPoints[i] != Offset.zero && currentPoints[i+1] != Offset.zero){
          canvas.drawLine(currentPoints[i],currentPoints[i+1], paint);
        }
      }
  }


  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true ;
  }
}