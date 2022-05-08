
import 'package:flutter/material.dart';
import 'package:tlifreec/home_layout.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({ Key? key }) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading:IconButton(onPressed: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeLayoutScreen()), (route) => false),icon: const Icon(Icons.arrow_back_ios,color: Colors.pink,),) ,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('tlifreec digital marketing',style: TextStyle(
                 fontFamily: 'MONESA',
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 32, 64, 168)
              ),),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics:const BouncingScrollPhysics(),
                itemBuilder: (context,i)=>Text(prg[i],style: TextStyle(
                   fontFamily: 'VIP-TIM-Regular',
                  fontSize: 24,
                  color: Color.fromARGB(255, 32, 64, 168)
                ),
                textDirection: TextDirection.rtl,), 
                separatorBuilder: (context,i)=>SizedBox(height: 10,), 
                itemCount: prg.length)
            ],
          ),
        ),
      ),
    );
  }
}

List<String> prg = [
  ' إدارة صفحات التواصل الاجتماعي مع شركه تليفريك دي لعبتنا ',
  'عندنافريق متخصص في ال Social Media Management  هنقدر نوصل مشروعك انه ',
  'ينتشر بشكل سريع وهيوصل للناس الصح في أسرع وقت وبالتالي مبيعاتك هتزيد ',
  'ومشروعك هيكبر و زي ما بيقوله الرزق يحب الخفيه',
  'طيب اكيد بتسال احنا بنقدم ليك ايه ؟',
  '- إدارة كاملة للصفحات التواصل الاجتماعي ',
  '- إدارة الاعلانات الممولة ',
  '-صناعة تصاميم إحترافية ',
  '- صناعة محتوى مبدع ومميز',
  'ده غير اننا هنكون معاك خطوه بخطوه .. و هيوصل ليك تقرير شهري من الشركه بيعرفك احنا وصلنا لفين في الشغل '
];