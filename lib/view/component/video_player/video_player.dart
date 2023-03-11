import 'package:flutter/material.dart';
import 'package:shatiby/models/event_model.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final EventModel event;

  const VideoScreen({super.key, required this.event});
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(

        widget.event.videoUrl!)
      ..addListener(() => setState(() {
        videoPosition = _controller.value.position;
      }))
      ..initialize().then((_) => setState(() {
        videoLength = _controller.value.duration;
      }));
    _controller.play();
  }

  late Duration videoLength;
  late Duration videoPosition;
  double volume = 0.5;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (_controller.value.isInitialized) ...[
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  padding: EdgeInsets.all(10),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(_controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                    ),
                    Text(
                        '${convertToMinutesSeconds(videoPosition)} / ${convertToMinutesSeconds(videoLength)}'),
                    const SizedBox(width: 6),
                    Icon(animatedVolumeIcon(volume)),
                    Slider(
                      value: volume,
                      min: 0,
                      max: 1,
                      onChanged: (_volume) => setState(() {
                        volume = _volume;
                        _controller.setVolume(_volume);
                      }),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.loop,
                          color: _controller.value.isLooping
                              ? Colors.green
                              : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller
                                .setLooping(!_controller.value.isLooping);
                          });
                        }),
                  ],
                )
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

String convertToMinutesSeconds(Duration duration) {
  final parsedMinutes = duration.inMinutes < 10
      ? '0${duration.inMinutes}'
      : duration.inMinutes.toString();

  final seconds = duration.inSeconds % 60;

  final parsedSeconds =
  seconds < 10 ? '0${seconds % 60}' : (seconds % 60).toString();
  return '$parsedMinutes:$parsedSeconds';
}

IconData animatedVolumeIcon(double volume) {
  if (volume == 0)
    return Icons.volume_mute;
  else if (volume < 0.5)
    return Icons.volume_down;
  else
    return Icons.volume_up;
}