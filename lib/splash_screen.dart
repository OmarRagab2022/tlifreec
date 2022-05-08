import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tlifreec/db/db_helper.dart';
import 'package:tlifreec/home_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
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
      bool check = await InternetConnectionChecker().hasConnection;
 if(check == true){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeLayoutScreen()), (route) => false);   
 }else{
 Fluttertoast.showToast(msg: 'Internet deind');
 }
   });
 
   });
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizeTransition(
          sizeFactor: sizeAnimation!,
          axis: Axis.vertical,
          axisAlignment: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.jpg',height: 300 ,width: 300,),
              const SizedBox(height: 20,),
             const Text('Tilfreec',style: TextStyle(
                fontSize: 40,
                fontFamily: 'MONESA',
                color: Color.fromARGB(255, 55, 118, 150)
              ),),
              const SizedBox(height: 15,),
              SizeTransition(
                sizeFactor:controllerL!,
                axis: Axis.vertical,
                axisAlignment: 3,
                child:  const SpinKitPouringHourGlass(color: Colors.pinkAccent,),  
              
              ),
       
            ],
          ),
        ),
      ),
    );
  }
}