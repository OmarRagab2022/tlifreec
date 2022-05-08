import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoItem extends StatelessWidget {
  final String url;
  const VideoItem({ Key? key, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '${YoutubePlayer.convertUrlToId(url)}',
    flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        forceHD: true,
        
    )
    ,
);

_controller.setVolume(100);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color:Colors.black ,onPressed: ()=>Navigator.pop(context),),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
            showVideoProgressIndicator: true,
       
    
        ),
      ),
    );
  }
}