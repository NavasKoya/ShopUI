import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singapore_company_task/constants/const_colors.dart';

class ListItemContainer extends StatelessWidget {
  final String editIcon;
  final String productImage;
  final String productName;
  final String unitNum;
  final String orderedUnit;
  final int price;

  const ListItemContainer({
    Key? key,
    required this.editIcon,
    required this.productImage,
    required this.productName,
    required this.unitNum,
    required this.orderedUnit,
    required this.price})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(editIcon),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black.withOpacity(.2)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                productImage,
                height: 75,
              ),
            ),
          ),
          
          _productNameColumn(),

          Text(
            "Rs ${price.toString()}",
            style: GoogleFonts.ubuntu(
                color: AppColors.violet,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  _productNameColumn() {
    return Column(
      children: [
        Text(
          productName,
          style: GoogleFonts.ubuntu(
            color: AppColors.black,
            fontWeight: FontWeight.bold
          ),
        ),

        Text(
          unitNum,
          style: GoogleFonts.ubuntu(
            color: AppColors.violet.withOpacity(.3)
          ),
        ),

        Text(
          orderedUnit,
          style: GoogleFonts.ubuntu(
              color: AppColors.black,
              fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }
}
