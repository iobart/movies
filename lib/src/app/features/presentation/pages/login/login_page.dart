import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';
import 'package:movies/src/app/widgets/card_form.dart';
import 'package:movies/src/app/widgets/generic_button.dart';
import 'package:movies/src/app/widgets/input_generic.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  final ValueNotifier<bool> _isShow = ValueNotifier(true);

  @override
  initState() {
    controller = LoginController(context)..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<bool>(
          valueListenable: _isShow,
          builder: (ctx, snap, child) {
            return Stack(
              children: [
                Transform.scale(
                  scale: 2,
                  child: Container(
                    transform: Matrix4.translationValues(6, 0, 0),
                    child: Image.asset(
                      'assets/img/gerald.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Text(
                        'Welcome!',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )),
                Visibility(
                    visible: !snap,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CardForm(
                        padding: const EdgeInsets.only(
                            top: 40, left: 40, right: 40, bottom: 40),
                        child: _buttons(),
                      ),
                    )),
                Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Visibility(
                        visible: snap,
                        child: GenericButton(
                          text: 'Sign up',
                          colorButton: Theme.of(context).primaryColor,
                          height: 50,
                          width: 150,
                          textStyle: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      const SizedBox(height:  20),
                      Container(
                        transform: Matrix4.translationValues(0, snap?0:280, 0),
                        child: GenericButton(
                          text: 'Log in',
                          colorButton: whiteColor,
                          textStyle: Theme.of(context).textTheme.bodyText2,
                          height: 50,
                          width: 150,
                          onPressed: () {
                            if (snap) _isShow.value = false;
                            controller.onLoginWithCredentials();
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: snap,
                        child: Text(
                          'Forgot password?',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ])),
              ],
            );
          }),
    );
  }

  Widget _buttons() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    _isShow.value = true;
                  },
                  icon: Icon(
                    Icons.clear,
                    color: greyColor,
                  ))),
          InputGeneric(
            controller: controller.inputController,
            keyboardType: TextInputType.name,
            hintText: 'Name',
          ),
          InputGeneric(
            controller: controller.passwordController,
            keyboardType: TextInputType.name,
            hintText: 'Password',
          ),
        ],
      ),
    );
  }
}
