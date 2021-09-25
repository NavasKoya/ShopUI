import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singapore_company_task/constants/const_colors.dart';
import 'package:singapore_company_task/pages/order_info/order_info_page.dart';

class OrderListContainer extends StatelessWidget {
  final String productImage;
  final String orderNum;
  final String orderTimestamp;
  final String orderStatus;
  final String orderAmount;
  final String paymentStatus;

  const OrderListContainer({
    Key? key,
    required this.productImage,
    required this.orderNum,
    required this.orderTimestamp,
    required this.orderStatus,
    required this.orderAmount,
    required this.paymentStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(productImage, height: 50,),

              _orderNumColumn(),

              _orderAmountColumn(context),
            ],
          ),
        ),
      ),
    );
  }

  _orderNumColumn() {
    return Column(
      children: [
        Text(
          orderNum,
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,

          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            orderTimestamp,
            style: GoogleFonts.ubuntu(

            ),
          ),
        ),

        Text(
          orderStatus,
          style: GoogleFonts.ubuntu(
            color: orderStatus=="pending" ?
                    AppColors.yellow : orderStatus == "delivered" ?
                    AppColors.green : orderStatus == "shipped" ?
                    AppColors.orange : AppColors.violet,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  _orderAmountColumn(BuildContext context) {
    return Column(
      children: [
        Text(
          orderAmount,
          style: GoogleFonts.ubuntu(
            color: AppColors.violet,
            fontWeight: FontWeight.bold
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            paymentStatus.toUpperCase(),
            style: GoogleFonts.ubuntu(
                color: AppColors.green,
                fontWeight: FontWeight.bold
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderInfoPage(orderNum: orderNum,)),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.lightColor
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              "Details",
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold,
                color: AppColors.violet
              ),
            ),
          ),
        )

      ],
    );
  }
}
