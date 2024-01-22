
import 'package:flutter/material.dart';


void main(){
  
  runApp(MaterialApp(
    home: Main() ,
  ));
  
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  Route _createLeftRoute(){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation){
          return SecondPage();
        },
    transitionsBuilder: (context, animation, secondaryAnimation, child){
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
         final offsetAnimation = animation.drive(tween);
          return SlideTransition(
              position: offsetAnimation,
            child: child,
          );
    }
    );

  }
  Route _createRightRoute(){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation){
          return SecondPage();
        },
    transitionsBuilder: (context, animation, secondaryAnimation, child){
          const begin = Offset(-1, 0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
         final offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child,);
    }
    );

  }
  Route _createBottomRoute(){
    return PageRouteBuilder(

      transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation){
          return SecondPage();
        },
    transitionsBuilder: (context, animation, secondaryAnimation, child){
          const begin = Offset(0, 1);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
         final offsetAnimation = animation.drive(tween);
          return SlideTransition(
              position: offsetAnimation,
            child: child,
          );
    }
    );

  }
  Route _createUpRoute(){
    return PageRouteBuilder(
     // transitionDuration: Duration(milliseconds: 5000),
        pageBuilder: (context, animation, secondaryAnimation){
          return SecondPage();
        },
    transitionsBuilder: (context, animation, secondaryAnimation, child){
          const begin = Offset(0, -1);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
         final offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child,);
    }
    );

  }
  Route _createScaleRoute(){
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation){
          return SecondPage();
        },
    transitionsBuilder: (context, animation, secondaryAnimation, child){
          const begin = Offset(1, 0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
         final offsetAnimation = animation.drive(tween);
          return ScaleTransition(
              scale: animation,
              child: child,
          );
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Test'),
      ),
      body: Center(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, _createLeftRoute());
            }, child: Text('Left Transition')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, _createRightRoute());
            }, child: Text('Right Transition')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, _createBottomRoute());
            }, child: Text('Bottom Transition')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, _createUpRoute());
            }, child: Text('Up Transition')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, _createScaleRoute());
            }, child: Text('Scale Transition')),

          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){}, child: Text('Go Back'))
        ],
      ),
    );
  }
}

