import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:singapore_company_task/components/flat_button_widget/flat_button.dart';
import 'package:singapore_company_task/components/order_list_container_widget/order_list_container.dart';
import 'package:singapore_company_task/constants/const_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singapore_company_task/constants/const_icons.dart';
import 'package:singapore_company_task/constants/const_size.dart';
import 'package:singapore_company_task/constants/constants.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _pageListWidget(),
    );
  }

  _pageListWidget() {
    return Column(
      children: const [

        AllOrdersWidget()
      ],
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppIcons.menuIcon, height: 25,),

            Text(
              "bingo shop",
              style: GoogleFonts.handlee(
                color: AppColors.violet,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: AppColors.yellow,
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(AppIcons.appLogoIcon, height: 25,),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class AllOrdersWidget extends StatelessWidget {
  const AllOrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.violet.withOpacity(.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: SizeUnits.kMPadding,),

            Text(
              "All Orders - 1543",
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold
              ),
            ),

            _selectTimingsWidget(),

            const OrderedListWidget()
          ],
        ),
      ),
    );
  }

  _selectTimingsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
         const Expanded(
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: 25),
             child: FlatButtonWidget(
              text: "All Times - 1543",
              buttonColor: AppColors.violet,
              verticalPadding: 5,
              horizontalPadding: 5,
              textColor: AppColors.white
        ),
           ),
         ),

        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: FlatButtonWidget(
                text: "Today - 8",
                buttonColor: AppColors.lightColor,
                verticalPadding: 5,
                horizontalPadding: 5,
                textColor: AppColors.black
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 25, width: 25,
            child: DateTimePicker(
              type: DateTimePickerType.date,
              dateMask: 'd MMM, yyyy',
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              icon: const Icon(Icons.calendar_view_month_outlined, size: 30, color: AppColors.violet,),
            ),
          ),
        )
      ],
    );
  }
}


class OrderedListWidget extends StatelessWidget {
  const OrderedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: orderedImages.length,
        itemBuilder: (BuildContext context, int index){
          return OrderListContainer(
            productImage: orderedImages[index],
            orderNum: orderNumbers[index],
            orderTimestamp: orderTimeStamp[index],
            orderStatus: orderStatus[index],
            orderAmount: orderAmount[index],
            paymentStatus: paymentStatus[index],
          );
        }
      ),
    );
  }
}
