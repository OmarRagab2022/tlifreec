import 'package:flutter/material.dart';
import 'package:tlifreec/about.dart';

class SplashAboutUsScreen extends StatefulWidget {
  const SplashAboutUsScreen({ Key? key }) : super(key: key);

  @override
  State<SplashAboutUsScreen> createState() => _SplashAboutUsScreenState();
}

class _SplashAboutUsScreenState extends State<SplashAboutUsScreen> with TickerProviderStateMixin {

   AnimationController ? controllerS;
 Animation<double>? sizeAnimation;
  AnimationController ? controllerL;
 Animation<double>? sizeAnimationL;
 @override
  void initState() {
    controllerS = AnimationController(vsync: this,duration: const Duration(seconds: 2));
   controllerL =AnimationController(vsync: this,duration: const Duration(seconds: 2));
   sizeAnimation = CurvedAnimation(parent: controllerS!, curve:Curves.decelerate );
   sizeAnimationL = CurvedAnimation(parent: controllerS!, curve:Curves.slowMiddle );
   controllerS!.forward().then((value) async{

   controllerL!.forward().then((value) async{
    Navigator.pushAndRemoveUntil(context, _createRoute(), (route) => false);
   
   });
 
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeTransition(
              sizeFactor: sizeAnimation!,
              axis: Axis.horizontal,
              axisAlignment: 3,
              child: Image.asset('assets/images/logo.jpg',width: 250,height: 250,fit: BoxFit.cover,)),
            const SizedBox(height: 20,),
             SizeTransition(
             sizeFactor: sizeAnimationL!,
            axis: Axis.horizontal,
            axisAlignment: 3,
               child: Text('About Us ',style: TextStyle(
                 fontFamily: 'MONESA',
                  fontSize: 24,
                  color: Color.fromARGB(255, 32, 64, 168)
                       ),),
             )
          ],
        ),
        
      ),
    );
  }
  Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const AboutUsScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 2.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
}