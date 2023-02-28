import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/size_config.dart';
import '../style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen= MediaQuery.of(context).size;
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(color: AppColors.secondaryBg),
        child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Container(
               height: 100,
               alignment: Alignment.topCenter,
               width: double.infinity,
               padding: const EdgeInsets.only(top: 20),
               child: SizedBox(
                    width: 35,
                    height: 20,
                    child: SvgPicture.asset('assets/mac-action.svg'),
                  ),
             ),

              Column(
                children: [
                  SvgPicture.asset(
                    'assets/home.svg',
                    height: 24,
                    color: AppColors.iconGray,
                  ),
                  const Text("الرئيسية",maxLines: 1,style: TextStyle(color: Colors.black54,fontSize: 15),),
                ],
              ),
              SizedBox(height: screen.height* 0.1 -54,),
              Column(
                children: [
                  SvgPicture.asset(
                  'assets/trophy.svg',
                  height: 24,
                  color: AppColors.iconGray,
                ),
                  const Text("إنجازات المركز",maxLines: 1,style: TextStyle(color: Colors.black54,fontSize: 15),),
                ],
              ),

              SizedBox(height: screen.height* 0.1 -54,),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/invoice.svg',
                    height: 24,
                    color: AppColors.iconGray,
                  ),
                  const Text("من نحن",maxLines: 1,style: TextStyle(color: Colors.black54,fontSize: 15),),
                ],
              ),

              SizedBox(height: screen.height* 0.1 -54,),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/clipboard.svg',
                    height: 24,
                    color: AppColors.iconGray,
                  ),
                  const Text("اصداراتنا",maxLines: 1,style: TextStyle(color: Colors.black54,fontSize: 15),),
                ],
              ),

              SizedBox(height: screen.height* 0.1 -54,),

              Column(
                children: [
                  SvgPicture.asset(
                    'assets/clipboard.svg',
                    height: 24,
                    color: AppColors.iconGray,
                  ),
                  const Text("تواصل معنا",maxLines: 1,style: TextStyle(color: Colors.black54,fontSize: 15),),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}