import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:singapore_company_task/components/flat_button_widget/flat_button.dart';
import 'package:singapore_company_task/components/order_list_container_widget/order_list_container.dart';
import 'package:singapore_company_task/constants/const_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singapore_company_task/constants/const_size.dart';
import 'package:singapore_company_task/constants/constants.dart';
import 'package:singapore_company_task/services/order_list_service.dart';

class NewOrderListPage extends StatelessWidget {
  const NewOrderListPage({Key? key}) : super(key: key);

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

class AllOrdersWidget extends StatelessWidget {
  const AllOrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.violet.withOpacity(.1),
        padding: const EdgeInsets.symmetric(horizontal: SizeUnits.kStandardPadding),
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

            _selectTimingsWidget(context),

            const OrderedListWidget()
          ],
        ),
      ),
    );
  }

  _selectTimingsWidget(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeUnits.kSPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          FlatButtonWidget(
            boxWidth: _width*.35,
            text: "All Times - 1543",
            buttonColor: AppColors.violet,
            verticalPadding: SizeUnits.kSPadding,
            horizontalPadding: SizeUnits.kSPadding,
            textColor: AppColors.white
          ),

          FlatButtonWidget(
              boxWidth: _width*.35,
              text: "Today - 8",
              buttonColor: AppColors.lightColor,
              verticalPadding: SizeUnits.kSPadding,
              horizontalPadding: SizeUnits.kSPadding,
              textColor: AppColors.black
          ),

          SizedBox(
            height: 25, width: 25,
            child: DateTimePicker(
              type: DateTimePickerType.date,
              dateMask: 'd MMM, yyyy',
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              icon: const Icon(Icons.calendar_view_month_outlined, size: 30, color: AppColors.violet,),
            ),
          )
        ],
      ),
    );
  }
}


class OrderedListWidget extends StatefulWidget {
  const OrderedListWidget({Key? key}) : super(key: key);

  @override
  State<OrderedListWidget> createState() => _OrderedListWidgetState();
}

class _OrderedListWidgetState extends State<OrderedListWidget> {

  late Future ordersList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ordersList = OrderListService().fetchOrderList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ordersList,
        builder: (context, AsyncSnapshot snapshot){
          if(!snapshot.hasData) {
            return Container();
          } else{
            return Expanded(
              child: ListView.builder(
                  itemCount: snapshot.data["orders"].length,
                  itemBuilder: (BuildContext context, int index){
                    final _orderResult = snapshot.data["orders"][index];
                    return OrderListContainer(
                      productImage: orderedImages[index],
                      orderNum: '${_orderResult["orderNo"].toString()} - ${_orderResult["item_name"]} ',
                      orderTimestamp: _orderResult["date_added"],
                      orderStatus: _orderResult["shipping_status"],
                      orderAmount: _orderResult["price"],
                      paymentStatus: _orderResult["payment_status"],
                    );
                  }
              ),
            );
          }
        }
    );
  }
}
