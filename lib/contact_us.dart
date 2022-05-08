import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUSScreen extends StatefulWidget {
  const ContactUSScreen({ Key? key }) : super(key: key);

  @override
  State<ContactUSScreen> createState() => _ContactUSScreenState();
}

class _ContactUSScreenState extends State<ContactUSScreen> with TickerProviderStateMixin{
   AnimationController ? controllerWh;
 Animation<double>? sizeAnimationWh;
  AnimationController ? controllerFa;
 Animation<double>? sizeAnimationFa;
   AnimationController ? controllerYo;
 Animation<double>? sizeAnimationYo;
 @override
  void initState() {
    controllerWh = AnimationController(vsync: this,duration: Duration(seconds: 3));
    controllerFa = AnimationController(vsync: this,duration: Duration(seconds: 3));
    controllerYo = AnimationController(vsync: this,duration: Duration(seconds: 3));
       sizeAnimationWh = CurvedAnimation(parent: controllerFa!, curve:Curves.decelerate );
   sizeAnimationFa = CurvedAnimation(parent: controllerFa!, curve:Curves.slowMiddle );
   sizeAnimationYo = CurvedAnimation(parent: controllerYo!, curve:Curves.slowMiddle );
   controllerFa!.forward();
   controllerWh!.forward();
   controllerYo!.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios,color: Colors.pink,),) ,
        backgroundColor: Colors.white,
        elevation: 0.1,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Tlifreec',style: TextStyle(
              fontFamily: 'MONESA',
              fontSize: 24,
              color: Color.fromARGB(255, 32, 64, 168)
            )
            ,),
             SizedBox(width: 6,),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            )
          ],
        ),
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: ()async{
                    if(Platform.isAndroid){
                     String phone = '+201150554459';
                     String message = ''; 
                    String url ='https://wa.me/$phone/?text=${Uri.parse(message)}';
                    await launch(url);
                    }else{
                            String phone = '+201150554459';
                     String message = ''; 
                    String url ="https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}";
                    await launch(url);
                    }
                  },
                  child: SizeTransition(
                     sizeFactor: sizeAnimationWh!,
                     axis: Axis.horizontal,
                     axisAlignment: 0,
                    child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                            ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/whatsapp.png',height: 90,width: 90,fit: BoxFit.cover,),
                              const SizedBox(height: 10,),
                              Text('WhatsApp',style: TextStyle(
                                      fontFamily: 'MONESA',
                                      fontSize: 24,
                                       color: Color.fromARGB(255, 32, 64, 168)
                              ),)
                            ],
                          ),
                        ),
                  ),
                ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: ()async{
                             String url = 'https://www.facebook.com/tlifreec2021';
                      if(await canLaunch(url)){
                      await launch(url);
                      }else{
                     print('error');
                      }
                      },
                      child: SizeTransition(
                         sizeFactor: sizeAnimationFa!,
                        axis: Axis.horizontal,
                        axisAlignment: 3,
                        child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                          ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/facebook.png',height: 90,width: 90,fit: BoxFit.cover,),
                            const SizedBox(height: 10,),
                            Text('Facebook',style: TextStyle(
                                    fontFamily: 'MONESA',
                                    fontSize: 24,
                                     color: Color.fromARGB(255, 32, 64, 168)
                            ),),
                            
                          ],
                        ),
                                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: ()async{
                      String url = 'https://www.youtube.com/channel/UCQpcLRLGjT7EE0yKsnumTTQ';
                      if(await canLaunch(url)){
                      await launch(url);
                      }else{
                     print('error');
                      }
                    },
                    child: SizeTransition(
                       sizeFactor: sizeAnimationYo!,
                          axis: Axis.horizontal,
                          axisAlignment: 3,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.red.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                          ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/youtube.png',height: 90,width: 90,fit: BoxFit.cover,),
                            const SizedBox(height: 10,),
                            Text('YouTube',style: TextStyle(
                                    fontFamily: 'MONESA',
                                    fontSize: 24,
                                     color: Color.fromARGB(255, 32, 64, 168)
                            ),)
                          ],
                        ),
                      ),
                    ),
                  )
              
              ],
            ),
          ),
        
        ),
      ),
    );
  }
}