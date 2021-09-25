import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singapore_company_task/constants/config/db_configuration.dart';
import 'package:singapore_company_task/constants/const_colors.dart';
import 'package:singapore_company_task/constants/const_size.dart';
import 'package:singapore_company_task/pages/landing/landing_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _loginFormKey=GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final kHintTextStyle = GoogleFonts.ubuntu(
    color: AppColors.violet.withOpacity(.3),
  );

  final kLabelStyle = GoogleFonts.ubuntu(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );



  final _kBoxDecorationStyle = BoxDecoration(
    color: AppColors.transparent,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );


  _gotoHomePage(){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingPage(),
        ),
            (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.violet ,
                    AppColors.violet.withOpacity(.9),
                    AppColors.violet.withOpacity(.8),
                    AppColors.violet.withOpacity(.7)
                  ],
                  stops: const [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'bingo shop',
                        style: GoogleFonts.handlee(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: SizeUnits.kXXXLPadding),

                      _buildUsernameTF(),

                      const SizedBox(height: SizeUnits.kStandardPadding,),

                      _buildPasswordTF(),

                      const SizedBox(height: SizeUnits.kXXLPadding,),

                      _buildLoginBtn(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        const SizedBox(height: SizeUnits.kXSPadding),
        Card(
          elevation: 9,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: _kBoxDecorationStyle,
            padding: const EdgeInsets.only(left: 10),
            height: 60.0,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _userNameController,
              cursorColor: AppColors.violet,
              style: GoogleFonts.ubuntu(
                color: AppColors.violet,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: SizeUnits.kStandardPadding),
                prefixIcon: const Icon(
                  Icons.drive_file_rename_outline,
                  color: AppColors.violet,
                ),
                hintText: 'Username',
                hintStyle: kHintTextStyle,
              ),
              onSaved: (input) => _userNameController.text=input!,
              validator: (input) => input!.trim().isEmpty ? "Please mention Username" : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        const SizedBox(height: SizeUnits.kXSPadding),
        Card(
          elevation: 9,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: _kBoxDecorationStyle,
            padding: const EdgeInsets.only(left: 10),
            height: 60.0,
            child: TextFormField(
              obscureText: true,
              cursorColor: AppColors.violet,
              controller: _passwordController,
              style: GoogleFonts.ubuntu(
                color: AppColors.violet,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: SizeUnits.kStandardPadding),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppColors.violet,
                ),
                hintText: 'Password',
                hintStyle: kHintTextStyle,
              ),
              onSaved: (input) => _passwordController.text=input!,
              validator: (input) => input!.trim().isEmpty ? "Please input password": null,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildLoginBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: InkWell(
        onTap: _performLogin,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 8,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                'Login',
                style: GoogleFonts.ubuntu(
                  color: AppColors.violet,
                  letterSpacing: 1.5,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showLoadingIndicator(){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height:50, width: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 25,),
                Text("Loading ...",
                  style: GoogleFonts.ubuntu(fontSize: 18),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _showSnackBar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: const Duration(seconds: 3),
        )
    );
  }

  void _performLogin() async{
    if(_loginFormKey.currentState!.validate()){
      _loginFormKey.currentState!.save();

      _showLoadingIndicator();

      final SharedPreferences prefs = await _prefs;
      var dio = Dio();

      var loginData = {
        "username": _userNameController.text,
        "password": _passwordController.text
      };


      Response? _loginResponse;

      try {
        _loginResponse = await dio.post(
              "$baseApiUrl/login",
              data: loginData
          );
      } catch (e) {
        debugPrint(e.toString());
      }

      if(_loginResponse!=null){
        if(_loginResponse.statusCode==200){
          prefs.setString("token", _loginResponse.data["token"]);
          Navigator.pop(context);
          _gotoHomePage();
        }
      } else{
        prefs.setString("token", "");
        Navigator.pop(context);
        _showSnackBar("Login failed.");
      }
    }
  }
}