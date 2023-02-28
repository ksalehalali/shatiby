import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../config/responsive.dart';
import '../style/colors.dart';



class BarChartCopmponent extends StatelessWidget {
  const BarChartCopmponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
  BarChartData(
    borderData: FlBorderData(show: false) ,
    alignment: BarChartAlignment.spaceBetween,
    axisTitleData: FlAxisTitleData(leftTitle: AxisTitle(reservedSize: 44)),
    gridData: FlGridData(drawHorizontalLine: true, horizontalInterval: 30),
    titlesData: FlTitlesData(leftTitles: SideTitles(reservedSize: 30, getTextStyles: (value) => const TextStyle(
            color: Colors.grey, fontSize: 12),showTitles: true,  getTitles: (value) {
          if (value == 0) {
            return 'جزء 0';
          } else if (value == 30) {
            return 'جزء 10';
          }  else if (value == 60) {
            return 'جزء 20';
          }  else if (value == 90) {
            return 'جزء 30';
          } else {
            return '';
          }
        },), bottomTitles: SideTitles(showTitles: true, getTextStyles: (value) => const TextStyle(
            color: Colors.grey, fontSize: 10), getTitles: (value) {
          if (value == 0) {
            return 'احمد العلي';
          } else if (value == 1) {
            return 'صالح الحسن';
          }  else if (value == 2) {
            return 'ريمة العبد الرزاق';
          }  else if (value == 3) {
            return 'فاطمة احمد';
          } else if (value == 4) {
            return 'حسن الصالح';
          }  else if (value == 5) {
            return 'سارا العلي';
          }  else if (value == 6) {
            return 'فاطمة الحسين';
          }  else if (value == 7) {
            return 'عبدالعزيز العلي';
          }  else if (value == 8) {
            return 'خالد الصالح';
          }  else if (value == 9) {
            return 'منى الرشيد';
          }  else if (value == 10) {
            return 'تالية الحسن';
          }  else if (value == 11) {
            return 'سوسن المحمد';
          }  else {
            return '';
          }
        }, )),
    barGroups: [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(y: 10, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg])),
        ]
      ),
      BarChartGroupData(
        x: 1,
         barRods: [
          BarChartRodData(y: 50, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
      BarChartGroupData(
        x: 2,
         barRods: [
          BarChartRodData(y: 30, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
      BarChartGroupData(
        x: 3,
         barRods: [
          BarChartRodData(y: 80, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
      BarChartGroupData(
        x: 4,
         barRods: [
          BarChartRodData(y: 70, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
      BarChartGroupData(
        x: 5,
         barRods: [
          BarChartRodData(y: 20, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
      BarChartGroupData(
        x: 6,
         barRods: [
          BarChartRodData(y: 90, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
      BarChartGroupData(
        x: 7,
         barRods: [
          BarChartRodData(y: 60, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
      BarChartGroupData(
        x: 8,
         barRods: [
          BarChartRodData(y: 90, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
       BarChartGroupData(
        x: 9,
         barRods: [
          BarChartRodData(y: 10, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
       BarChartGroupData(
        x: 10,
         barRods: [
          BarChartRodData(y: 40, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
      BarChartGroupData(
        x: 11,
         barRods: [
          BarChartRodData(y: 80, colors: [Colors.black], borderRadius: BorderRadius.circular(0), width: Responsive.isDesktop(context) ? 40 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [AppColors.barBg]))
        ]
      ),
    ]
    
  ),
  swapAnimationDuration: const Duration(milliseconds: 150), // Optional
  swapAnimationCurve: Curves.linear, // Optional
);
  }
}