import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tlifreec/model/video_model.dart';

class DBHelper{


Stream<List<VideoModel>> getFromDb()=>FirebaseFirestore.instance.collection('items').snapshots().map((event)=>event.docs.map((e) =>VideoModel.fromJson(e.data())).toList());


}