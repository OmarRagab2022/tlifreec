class VideoModel{
  String? url;
  String? photo;
  String? decs;

 VideoModel(this.decs,this.photo,this.url)
 ;
 VideoModel.fromJson(Map<String,dynamic?>json){
   url = json['url'] ?? '';
   photo = json['photo'] ?? '';
   decs = json['decs'] ?? '';
 }
 toJson(){
   return{
     'url': url,
     'photo': photo,
     'desc':decs
   };
 } 
  
}