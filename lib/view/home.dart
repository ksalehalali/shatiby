
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:shatiby/models/event_model.dart';
import 'package:shatiby/view/component/video_player/video_player.dart';
import 'package:shatiby/view/style/colors.dart';
import 'package:shatiby/view/style/style.dart';
import 'package:simple_icons/simple_icons.dart';
import '../config/responsive.dart';
import '../config/size_config.dart';
import 'component/appBarActionItems.dart';
import 'component/barChart.dart';
import 'component/header.dart';
import 'component/historyTable.dart';
import 'component/infoCard.dart';
import 'component/paymentDetailList.dart';
import 'component/sideMenu.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:readmore/readmore.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  List<CarouselItem> itemList = [
    CarouselItem(
      image: const AssetImage(
        'assets/images/63c8d3bb3a5f6.jpeg',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
      'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const AssetImage(
        'assets/images/63c7997254426.jpeg',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
      'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const AssetImage(
        'assets/images/63c79b31431dd.jpeg',
      ),
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
  ];

  late AnimationController _controller;
  late AnimationController _progressBorderAc;
  late Animation<double> animation;
  var _selectedIndex = 0;
  var _reverse = false;

  bool isPlaying = false;


  Query dbRef = FirebaseDatabase.instance.ref().child('events');
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _progressBorderAc = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),

    );
    final tween = Tween<double>(
      begin: 25.0,
      end: 50.0,

    );
    animation = tween.animate(_progressBorderAc,)
      ..addStatusListener((state) => print('$state'));
Timer(Duration(seconds: 1), () {  autoStart();
});
  }
  autoStart()async{
    setIndex();
    print(_selectedIndex);
    // await _progressBorderAc.repeat();
    // await _controller.repeat();
    //await _controller.reverse();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _progressBorderAc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 66, child: SideMenu()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.black)),
              actions: const [
                AppBarActionItems(),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Header(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical! * 3, ),
                          child: SizedBox(
                           height: SizeConfig.blockSizeVertical! * 30,

                            width: screenSize.width,
                            child: CustomCarouselSlider(
                              items: itemList,
                              autoplayDuration: const Duration(seconds: 6),
                              //animationDuration: Duration(seconds:3),
                              animationCurve: Curves.bounceInOut,
                              height: 150,
                              subHeight: 50,
                              width: MediaQuery.of(context).size.width * .9,
                              autoplay: true,
                              showText: false,
                              showSubBackground: false,
                              indicatorShape: BoxShape.rectangle,
                              selectedDotColor: Colors.red,
                              unselectedDotColor: Colors.white,
                            ),
                          ),
                        ),
                        //cards
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            runAlignment: WrapAlignment.start,
                            alignment: WrapAlignment.end,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              InfoCard(
                                  icon: 'assets/credit-card.svg',
                                  label: 'المجازون',
                                  amount: '300+'),
                              InfoCard(
                                  icon: 'assets/credit-card.svg',
                                  label: 'الحلقات',
                                  amount: '60+'),
                              InfoCard(
                                  icon: 'assets/transfer.svg',
                                  label: 'الطلاب والطالبات المستفيدين',
                                  amount: '2000+'),
                              InfoCard(
                                  icon: 'assets/invoice.svg',
                                  label: 'حافظي القرآن الكريم',
                                  amount: '20+'),
                              InfoCard(
                                  icon: 'assets/invoice.svg',
                                  label: 'حافظات القرآن الكريم',
                                  amount: '72+'),
                              InfoCard(
                                  icon: 'assets/bank.svg',
                                  label: 'المعلمين والمعلمات المستمرين',
                                  amount: '66+'),
                              InfoCard(
                                  icon: 'assets/invoice.svg',
                                  label: 'حافظي سورة البقرة',
                                  amount: '350+'),
                              InfoCard(
                                  icon: 'assets/invoice.svg',
                                  label: 'المستفيدين من المقارئ القرآنية',
                                  amount: '2750+'),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        //bar chart
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:  [

                            // const PrimaryText(
                            //                             //   text: 'Past 30 DAYS',
                            //                             //   size: 16,
                            //                             //   fontWeight: FontWeight.w400,
                            //                             //   color: AppColors.secondary,
                            //                             // ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                PrimaryText(
                                  text: 'الطلاب الحاليين',
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondary,
                                ),
                                PrimaryText(
                                    text: '1200+',
                                    size: 30,
                                    fontWeight: FontWeight.w800),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        //chart
                        Container(
                          height: 180,
                          child: BarChartCopmponent(),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            const PrimaryText(
                                text: 'الفعاليات',
                                size: 20,
                                fontWeight: FontWeight.w800),
                            const PrimaryText(
                              text: 'فعاليات هذا العام',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),

                            SizedBox(
                              height: 380,
                              width: screenSize.width,
                              child: FirebaseAnimatedList(
                                scrollDirection: Axis.vertical,

                                query: dbRef,
                                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                                  print("val ");
                                  print(snapshot.value);
                                  Map event = snapshot.value as Map;


                                  return listItem(event: event,screenSize: screenSize);

                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                      //  const HistoryTable(),
                        if (!Responsive.isDesktop(context)) PaymentDetailList()
                      ],
                    ),
                  ),
                )),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration: const BoxDecoration(color: AppColors.secondaryBg),
                    child: SingleChildScrollView(
                      padding:
                          const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        children:  [
                          const AppBarActionItems(),

                          PaymentDetailList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        builder: (BuildContext context, Widget? child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(
                    animation.value / 100 * 2,
                  ),
                  blurRadius: animation.value,
                )
              ],
            ),
            child: AnimatedIconButton(
              size: 34,
              onPressed: () async {
                setIndex();
                print(_selectedIndex);
                await _progressBorderAc.forward();
                await _progressBorderAc.reverse();
              },
              duration: const Duration(milliseconds: 600),
              animationController: _controller,
              icons: <AnimatedIconItem>[
                AnimatedIconItem(
                  icon: Icon(SimpleIcons.whatsapp, color: color),
                  backgroundColor: Colors.white,
                ),
                AnimatedIconItem(
                  icon: Icon(SimpleIcons.messenger, color: color),
                  backgroundColor: Colors.white,
                ),
                AnimatedIconItem(
                  icon: Icon(SimpleIcons.phonepe, color: color),
                  backgroundColor: Colors.white,
                ),
                // AnimatedIconItem(
                //   icon: Icon(SimpleIcons.man, color: color),
                //   backgroundColor: Colors.white,
                // ),
                // AnimatedIconItem(
                //   icon: Icon(SimpleIcons.acer, color: color),
                //   backgroundColor: Colors.white,
                // ),
                // AnimatedIconItem(
                //   icon: Icon(SimpleIcons.travisci, color: color),
                //   backgroundColor: Colors.white,
                // ),
                // AnimatedIconItem(
                //   icon: Icon(SimpleIcons.ea, color: color),
                //   backgroundColor: Colors.white,
                // ),
                // AnimatedIconItem(
                //   icon: Icon(SimpleIcons.dior, color: color),
                //   backgroundColor: Colors.white,
                // ),
              ],
            ),
          );
        },
        animation: animation,
      ),
    );
  }

  void setIndex() {
    if (_selectedIndex < 2) {
      setState(() => _selectedIndex += 1);
    }
  }

  Color get color {
    switch (_selectedIndex) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;
      case 4:
        return Colors.indigo;
      case 5:
        return Colors.blue;
      case 6:
        return Colors.purple;
      default:
        return Colors.pink;
    }
  }

  Widget listItem({required Map event, screenSize}) {
    return InkWell(
      onTap: (){
        print("----${event["videoUrl"]}");
     Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoScreen(event: EventModel(name: event['name'], description: event['desc'], videoUrl: event["videoUrl"], date: event["date"], address: event["address"]),)));
      },
      child: Card(
        child: Container(child: Column(
          children: [
            Image.network(event["imageUrl"],fit: BoxFit.fill,height: 170,width: screenSize.width,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(event['desc'],maxLines: 4,textAlign: TextAlign.end,textDirection: TextDirection.rtl,),
                    Text(" :اسم الفعالية"),
                    ReadMoreText(
                      event['desc'],
                      trimLines: 3,
                      textAlign: TextAlign.justify,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: " Show More ",
                      trimExpandedText: " Show Less ",
                      lessStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                      moreStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        height: 2,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),),
      ),
    );
  }
}
