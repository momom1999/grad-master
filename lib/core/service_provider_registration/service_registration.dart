import 'package:flutter/material.dart';
import 'package:grad/base.dart';
import 'package:grad/core/register/register_viewmodel.dart';
import 'package:grad/core/service_provider_registration/service_provider_navigator.dart';
import 'package:grad/core/service_provider_registration/service_provider_register_viewmodel.dart';
import 'package:grad/model/my_user.dart';
import 'package:grad/model/service_provider.dart';
import 'package:grad/screens/home/login_sevice_provider/login_serviceprovider.dart';
import 'package:grad/screens/home/login_client/login_view.dart';
import 'package:grad/screens/home/service_home/provider_home.dart';
import 'package:provider/provider.dart';

import '../../../provider/my_provider.dart';
import '../../home.dart';
import '../theme.dart';

class ServiceProviderRegister extends StatefulWidget {
  static const String routeName = 'ServiceProviderRegister';

  @override
  State<ServiceProviderRegister> createState() => _ServiceProviderRegistrationState();
}

class _ServiceProviderRegistrationState extends BaseView<ServiceProviderRegister, ServiceProviderRegisterViewModel>
    implements ServiceProviderRegisterNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  var NameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(

              title: Text('Paws'),
              centerTitle: true,
            ),
            body:

            new Stack(
            children: <Widget>[
            new Container(
            decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/images/background.png"), fit: BoxFit.cover,),
            ),),

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
                        height: 30,
                      ),
                      Text(
                        'Registration',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: NameController,
                        validator: (text) {
                          if (text!.trim() == "") {
                            return "Please Enter Your Service Name";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFF000A32))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFF000A32))),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text!.trim() == "") {
                            return "Please Enter Email";
                          }
                          final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return "Please Enter Valid Email";
                          }
                          return null;
                        },
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFF000A32))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFF000A32))),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text!.trim() == "") {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFF000A32))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFF000A32))),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return "Please Re-Enter Password";
                          }
                          if (passwordController.text != text) {
                            return 'Password Does not Match';
                          }
                        },
                        controller: passwordConfirmationController,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Password Confirmation',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFF000A32))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFF000A32))),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ValidateForm();
                          },style: ElevatedButton.styleFrom(primary: Color(0xFF000A32)),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 15,
                            ),)
                      ),
                      TextButton(onPressed: () {
                        Navigator.pushReplacementNamed(context,
                            LoginServiceProvider.routeName);
                      }, child: Text("I Have An Account",style: TextStyle(fontSize:18,color: MyTheme.lightPrimary)))
                    ],
                  ),
                ),
              ),
            ),
          ],)),
        ],
      ),
    );
  }

  void ValidateForm() async {
    if (formKey.currentState!.validate()) {
      viewModel.createServiceProviderAccountWithFirebaseAuth(
        emailController.text,
        passwordController.text,
        NameController.text,
      );
    }
  }


  // var provider=Provider.of<MyProvider>(context,listen: false);
  //Navigator.pushReplacementNamed(context, HomeScreen.routeName);

  @override
  void goToHome(ServiceProvider serviceProvide) {
    var provider=Provider.of<MyProvider>(context,listen: false);
    Navigator.pushReplacementNamed(context, ProviderHomeScreen.routeName);

  }

  @override
  ServiceProviderRegisterViewModel initViewModel() {
    return ServiceProviderRegisterViewModel();
  }

}