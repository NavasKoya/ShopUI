import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singapore_company_task/constants/const_colors.dart';
import 'package:singapore_company_task/constants/const_icons.dart';
import 'package:singapore_company_task/constants/const_size.dart';
import 'package:singapore_company_task/pages/order_list/order_list_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*.2),
        child: AppBar(
          backgroundColor: AppColors.white,
          flexibleSpace: Column(
            children: const [
              AppBarWidget(),
              SearchField()
            ],
          ),
        ),
      ),
      body: _viewSelectedPageWidget(),
      bottomNavigationBar: _bottomWidget(),
    );
  }

  _viewSelectedPageWidget() {
    if(_currentIndex==1){
      return const OrderListPage();
    } else if(_currentIndex==2){
      return Container();
    } else if(_currentIndex==3){
      return Container(height: 100, width: 100, color: Colors.blue,);
    } else if(_currentIndex==4){
      return Container(height: 100, width: 100, color: Colors.blue,);
    } else{
      return Container();
    }
  }

  _bottomWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25)
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.violet.withOpacity(.2)),
            label: "Home",
            activeIcon: const Icon(Icons.home, color: AppColors.violet,),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: AppColors.violet.withOpacity(.2)),
            label: "Orders",
            activeIcon: const Icon(Icons.home, color: AppColors.violet,),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits, color: AppColors.violet.withOpacity(.2)),
            label: "Products",
            activeIcon: const Icon(Icons.home, color: AppColors.violet,),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: AppColors.violet.withOpacity(.2)),
            label: "Manage",
            activeIcon: const Icon(Icons.home, color: AppColors.violet,),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: AppColors.violet.withOpacity(.2)),
            label: "Accounts",
            activeIcon: const Icon(Icons.home, color: AppColors.violet,),
          ),
        ],
      ),
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

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Order Id or Name",
          fillColor: AppColors.lightColor,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(SizeUnits.kSPadding),
              margin: const EdgeInsets.symmetric(horizontal: SizeUnits.kSPadding / 2),
              decoration: const BoxDecoration(
                color: AppColors.violet,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset(AppIcons.searchIcon, color: AppColors.white,),
            ),
          ),
        ),
      ),
    );
  }
}