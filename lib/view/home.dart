import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

import 'package:shatiby/view/style/colors.dart';
import 'package:shatiby/view/style/style.dart';
import '../config/responsive.dart';
import '../config/size_config.dart';
import 'component/appBarActionItems.dart';
import 'component/barChart.dart';
import 'component/header.dart';
import 'component/historyTable.dart';
import 'component/infoCard.dart';
import 'component/paymentDetailList.dart';
import 'component/sideMenu.dart';


class HomePage extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 100, child: SideMenu()),
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
                            runAlignment: WrapAlignment.end,
                            alignment: WrapAlignment.end,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              InfoCard(
                                  icon: 'assets/credit-card.svg',
                                  label: 'المجازون',
                                  amount: '300+'),
                              InfoCard(
                                  icon: 'assets/transfer.svg',
                                  label: 'الطلاب والطالبات المستفيدين',
                                  amount: '200+'),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            PrimaryText(
                                text: 'History',
                                size: 30,
                                fontWeight: FontWeight.w800),
                            PrimaryText(
                              text: 'Transaction of lat 6 month',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        const HistoryTable(),
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
    );
  }
}
