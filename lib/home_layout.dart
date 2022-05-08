import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tlifreec/contact_us.dart';

import 'package:tlifreec/db/db_helper.dart';
import 'package:tlifreec/model/video_model.dart';
import 'package:tlifreec/splash_about_screen.dart';
import 'package:tlifreec/video_item.dart';

class HomeLayoutScreen extends StatefulWidget  {
  const HomeLayoutScreen({ Key? key }) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
var scaffoldKey = GlobalKey<ScaffoldState>();
   
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      key: scaffoldKey,
     drawer: Drawer(backgroundColor: Colors.blue,
     child: SafeArea(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: AssetImage('assets/images/logo.jpg'),radius: 90,),
              const SizedBox(height: 10,),
              Text('Ttlifreec',style: TextStyle(
              fontFamily: 'MONESA',
              fontSize: 24,
              color: Colors.white  
              ),)
            ],
          ),
           ),
           const SizedBox(height: 20,),
           ListTile(
             onTap: ()=>print('home'),
             leading: Icon(Icons.home_max,color: Colors.white,size: 29,),
             title: Text('Home',style: TextStyle( fontFamily: 'MONESA',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white  ),),
           ),
           const SizedBox(height: 10,),
           ListTile(
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ContactUSScreen())),
             leading: Icon(Icons.phone,color: Colors.white,size: 29,),
             title: Text('Contact Us',style: TextStyle( fontFamily: 'MONESA',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white  ),),
           ),
           const SizedBox(height: 10,),
           ListTile(
             onTap: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const SplashAboutUsScreen()), (route) => false),
             leading: Icon(Icons.people_alt,color: Colors.white,size: 29,),
             title: Text('About Us',style: TextStyle( fontFamily: 'MONESA',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white  ),),
           )
           ],
         ),
       ),
     ),
     ),
      appBar: AppBar(
        leading:IconButton(onPressed: ()=>scaffoldKey.currentState!.openDrawer(),icon: const Icon(Icons.menu,color: Colors.pink,),) ,
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
            ),),
             SizedBox(width: 6,),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            )
          ],
        ),
      ),
      body:Container(
        color: Color.fromARGB(255, 252, 5, 120),
        alignment: AlignmentDirectional.center,
        child: StreamBuilder<List<VideoModel>>(
          stream: DBHelper().getFromDb(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              final data = snapshot.data!;
              return PageView(
                scrollDirection: Axis.vertical,
                children: data.map((e) =>buildWiget(e,context)
              ).toList(),);
            }
            return Center(child: SpinKitFadingFour(color: Color.fromRGBO(240, 14, 123, 1),));
          },
        ),
      )
    );
  }
}

Widget buildWiget(VideoModel videoModel,context)=>Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(height: MediaQuery.of(context).size.height/22,),
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoItem(url: videoModel.url!)));
      },
      child: Stack(

        children: [
          Container(
            height: 400,
            width: 400,
            
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                )
              ],
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(videoModel.photo!))
            ),
            
          ),
          Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black.withOpacity(.4)
            ),

            )
        ],
      ),
    ),
    const SizedBox(height: 10,),
    Text(videoModel.decs!,style: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontFamily: 'VIP-TIM-Regular'
    ),),
  
  ],
);




