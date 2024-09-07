import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:video_player/video_player.dart';



class Video360Player extends StatefulWidget {
  final String videoUrl;

  Video360Player({required this.videoUrl});

  @override
  _Video360PlayerState createState() => _Video360PlayerState();
}

class _Video360PlayerState extends State<Video360Player> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('360 Video Player'),
      ),
      /*body: _controller.value.isInitialized
          ? Panorama(
        animSpeed: 1.0,
        sensorControl: SensorControl.ORIENTATION,
        onTapControl: OnTapControl.ROTATION,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      )
          : CircularProgressIndicator(),*/

      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
