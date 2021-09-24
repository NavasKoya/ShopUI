import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singapore_company_task/components/flat_button_widget/flat_button.dart';
import 'package:singapore_company_task/constants/const_colors.dart';
import 'package:singapore_company_task/constants/const_size.dart';
import 'package:singapore_company_task/constants/constants.dart';
import 'package:singapore_company_task/pages/order_info/components/list_item_container.dart';

class OrderInfoPage extends StatelessWidget {

  final String orderNum;

  const OrderInfoPage({Key? key, required this.orderNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_pageSize.height*.1),
        child: AppBar(
          backgroundColor: AppColors.violet,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            orderNum,
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              letterSpacing: 1
            ),
          ),
        ),
      ),
      body: _orderDetailsPage(),
    );
  }

  _orderDetailsPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: List.generate(orderDetailsIcons.length, (index) {
            return ListItemContainer(
              editIcon: orderDetailsIcons[index],
              productImage: productImages[index],
              productName: productNames[index],
              unitNum: productUnis[index],
              orderedUnit: productTotalCounts[index],
              price: productPrices[index],
            );
          }),
        ),

        const OrderAmountDetails()
      ],
    );
  }
}


class OrderAmountDetails extends StatelessWidget {
  const OrderAmountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.violet.withOpacity(.1),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SizeUnits.kMPadding),

          const PriceBreakUpWidget(
            contentName: "Selected Items",
            contentValue: "Rs. 322",
            fontSize: SizeUnits.kMPadding,
          ),

          const SizedBox(height: SizeUnits.kMPadding),

          const PriceBreakUpWidget(
            contentName: "Shipping Fee",
            contentValue: "Rs. 85",
            fontSize: SizeUnits.kMPadding,
          ),

          const SizedBox(height: SizeUnits.kStandardPadding),

          const PriceBreakUpWidget(
            contentName: "Subtotal",
            contentValue: "Rs. 380",
            fontSize: SizeUnits.kStandardPadding,
          ),

          const SizedBox(height: SizeUnits.kMPadding),

          const Divider(color: AppColors.black,),

          Text(
            "Customer Details",
            style: GoogleFonts.ubuntu(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: SizeUnits.kStandardPadding
            ),
          ),

          const SizedBox(height: SizeUnits.kMPadding),

          const CustomerInfoWidget(
            fieldName: "Name:",
            fieldValue: "Monica",
          ),

          const SizedBox(height: SizeUnits.kMPadding),

          const CustomerInfoWidget(
            fieldName: "Mobile No:",
            fieldValue: "+91 1234567890",
          ),

          const SizedBox(height: SizeUnits.kMPadding),

          const CustomerInfoWidget(
            fieldName: "Address:",
            fieldValue: "South Delhi",
          ),

          const SizedBox(height: SizeUnits.kMPadding),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomerInfoWidget(
                fieldName: "Payment:",
                fieldValue: "Online Payment",
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.green),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.green.withOpacity(.3)
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "Received",
                  style: GoogleFonts.ubuntu(
                    color: AppColors.green,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: SizeUnits.kStandardPadding),

          const Divider(color: AppColors.black,),

          _actionButtonWidget(),

          const SizedBox(height: SizeUnits.kXLPadding),
        ],
      ),
    );
  }

  _actionButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FlatButtonWidget(
          text: "Reject Order",
          buttonColor: AppColors.orange,
          verticalPadding: SizeUnits.kStandardPadding,
          horizontalPadding: SizeUnits.kXLPadding,
          textColor: AppColors.white
        ),

        SizedBox(width: SizeUnits.kXLPadding),

        FlatButtonWidget(
            text: "Accept Order",
            buttonColor: AppColors.violet,
            verticalPadding: SizeUnits.kStandardPadding,
            horizontalPadding: SizeUnits.kXLPadding,
            textColor: AppColors.white
        ),

      ],
    );
  }
}

class CustomerInfoWidget extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const CustomerInfoWidget({Key? key, required this.fieldName, required this.fieldValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _pageSize = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: _pageSize.width*.3,
          child: Text(
            fieldName,
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w600,
              fontSize: SizeUnits.kStandardPadding,
              color: AppColors.black,
            ),
          ),
        ),

        Text(
          fieldValue,
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w600,
            fontSize: SizeUnits.kStandardPadding,
            color: AppColors.black,
          ),
        )
      ],
    );
  }
}


class PriceBreakUpWidget extends StatelessWidget {
  final String contentName;
  final String contentValue;
  final double fontSize;

  const PriceBreakUpWidget({Key? key, required this.contentName, required this.contentValue, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          contentName,
          style: GoogleFonts.ubuntu(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: fontSize
          ),
        ),

        Text(
          contentValue,
          style: GoogleFonts.ubuntu(
            color: AppColors.violet,
            fontWeight: FontWeight.bold,
            fontSize: fontSize
          ),
        )
      ],
    );
  }
}
