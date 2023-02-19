import 'package:flutter/material.dart';
import 'package:grad/base.dart';
import 'package:grad/core/service_provider_registration/service_registration.dart';
import 'package:grad/model/my_user.dart';
import 'package:grad/model/service_provider.dart';
import 'package:grad/screens/home/login_sevice_provider/login_serviceprovider_navigator.dart';
import 'package:grad/screens/home/login_sevice_provider/login_serviceprovider_viewmodel.dart';
import 'package:grad/screens/login_navigator.dart';
import 'package:grad/screens/login_view.dart';
import 'package:grad/screens/provider_home.dart';
import 'package:provider/provider.dart';

import '../../../core/theme.dart';
import '../../../provider/my_provider.dart';
import '../home.dart';

class LoginServiceProvider extends StatefulWidget {
  static const String routeName = 'loginServiceProvider';

  @override
  State<LoginServiceProvider> createState() => _LoginServiceProviderScreenState();

}

class _LoginServiceProviderScreenState extends BaseView<LoginServiceProvider, LoginServiceProviderViewModel>
    implements LoginServiceProviderNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this as LoginServiceProviderNavigator?;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(children: [
        Scaffold(
            appBar: AppBar(
              title: Text('Paws'),
              centerTitle: true,
            ),
            body: new Stack(
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            TextFormField(
                              controller: emailController,
                              validator: (text) {
                                if (text!.trim() == "") {
                                  return "Please Enter Email";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.teal)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.teal)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (text) {
                                if (text!.trim() == "") {
                                  return "Please Enter Password";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.teal)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.teal)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, ProviderHome.routeName);
                                ValidateForm();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF000A32)),
                              child: Text('Sing In',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ),

    TextButton(
    onPressed: () {
    Navigator.pushReplacementNamed(
    context, ServiceProviderRegister.routeName);
    },
    child: Text(
    "Do not Have An Acoount",
    style: TextStyle(
    fontSize: 18,
    color: MyTheme.lightPrimary),)),


                          ]),
                    ),
                  ),
                ),
              ],
            )),
      ]),
    );
  }

  void ValidateForm() {
    viewModel.loginServiceProviderWithFirebaseAuth(
        emailController.text, passwordController.text);
  }

  @override
  LoginServiceProviderViewModel initViewModel() {
    return LoginServiceProviderViewModel();
  }

  @override
  void goToHome(ServiceProvider serviceProvider) {
    var provider = Provider.of<MyProvider>(context, listen: false);

    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ServiceProviderRegister()));
  }
}
