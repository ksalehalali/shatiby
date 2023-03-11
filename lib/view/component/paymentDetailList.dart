import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shatiby/view/component/paymentListTile.dart';
import 'package:video_player/video_player.dart';
import '../../config/size_config.dart';
import '../../models/data.dart';
import '../style/colors.dart';
import '../style/style.dart';

class PaymentDetailList extends StatefulWidget {
  const PaymentDetailList({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentDetailList> createState() => _PaymentDetailListState();
}

class _PaymentDetailListState extends State<PaymentDetailList> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool showVideo = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createOneVideoHome();
  }

  createOneVideoHome(){
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _chewieController = ChewieController(videoPlayerController: _controller,

          autoPlay: false,
          looping: true,
        );
        showVideo =true;
        setState(() {});
      });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controller.dispose();
    _chewieController.dispose();
  }

  Widget _chewieControllerPlayer(){
    return showVideo ? Container(

      child: Chewie(controller:_chewieController,),
    ):const Center(child: Text("Please wait..."));
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

      Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 15.0,
            offset: const Offset(
              10.0,
              15.0,
            ),
          )
        ]),
        child: Container(),
      ),
      SizedBox(
          height: screenSize.height *0.3,

          child: _chewieControllerPlayer()),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text("تكريم حافظات حلقة ريحان"),
          Text("20 / 1 /2023"),

        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          height: 2,
          color: Colors.black26,
          width: screenSize.width,
        ),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 3,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            PrimaryText(
                text: 'صدقات وتبرعات', size: 18, fontWeight: FontWeight.w800),
            PrimaryText(
              text: '2023',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      ),
      Column(
        children: List.generate(
          recentActivities.length,
          (index) => PaymentListTile(
              icon: recentActivities[index]["icon"]!,
              label: recentActivities[index]["label"]!,
              amount: recentActivities[index]["amount"]!),
        ),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: const [
      //     PrimaryText(
      //         text: 'Upcoming Payments', size: 18, fontWeight: FontWeight.w800),
      //     PrimaryText(
      //       text: '02 Mar 2021',
      //       size: 14,
      //       fontWeight: FontWeight.w400,
      //       color: AppColors.secondary,
      //     ),
      //   ],
      // ),
      // SizedBox(
      //   height: SizeConfig.blockSizeVertical! * 2,
      // ),
      // Column(
      //   children: List.generate(
      //     upcomingPayments.length,
      //     (index) => PaymentListTile(
      //         icon: upcomingPayments[index]["icon"]!,
      //         label: upcomingPayments[index]["label"]!,
      //         amount: upcomingPayments[index]["amount"]!),
      //   ),
      // ),
    ]);
  }
}
