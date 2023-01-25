
import 'package:flutter/material.dart';
import 'package:netpace/app/feature/api_service/auth_service.dart';
import 'package:netpace/app/feature/login/viewmodel/login_viewmodel.dart';
import 'package:netpace/app/feature/signup/viewmodel/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      onModelReady: (model) async => await model.init(),
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      widthFactor: 0.65,
                      child: Container(
                        child: Stack(
                            children: [
                          AnimatedOpacity(opacity: model.pos==1?1:0,
                            duration: Duration(milliseconds: 1000),
                            child: Image.asset(model.photos[1])),
                          AnimatedOpacity(opacity: model.pos==0?1:0,
                              duration: Duration(milliseconds: 1000),
                              child: Image.asset(model.photos[0]))
                        ]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: model.email,
                      focusNode: model.focusEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            )
                        ),
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          color: model.focusEmail.hasFocus ? Theme.of(context).primaryColor : Colors.grey.shade400,
                        ),
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: model.password,
                      onTap: (){},
                      focusNode: model.focusPass,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            )
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: model.focusPass.hasFocus ? Theme.of(context).primaryColor : Colors.grey.shade400,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.help,
                            color: Theme.of(context).primaryColor,
                          ), onPressed: () {  },
                        ),
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: model.userName,
                      onTap: (){},
                      focusNode: model.focusUserName,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            )
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: model.focusPass.hasFocus ? Theme.of(context).primaryColor : Colors.grey.shade400,
                        ),
                        hintText: 'User Name',
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: ()async{
                          await model.signupUser();
                      },
                        child:model.signupLoading?CircularProgressIndicator.adaptive() :Text('Sign Up'),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(Color(0xff0165ff)),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
        );
      }
    );
  }
}