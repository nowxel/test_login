import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../constants.dart';
import '../../data/dictionary.dart';
import '../../widgets/social_button_widget.dart';
import '../bloc/login/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')),
              );
          }
        },
        child: const _SignInForm());
  }
}

class _SignInForm extends StatefulWidget {
  // final bool hidePassword;
  const _SignInForm(
      {
      // required this.hidePassword,
      Key? key})
      : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 65, left: 16, right: 16, bottom: 34),
            child: _appBar(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _UsernameInput(),
                      const SizedBox(height: 36),
                      const _PasswordInput(),
                      const SizedBox(height: 16),
                      _forgotPassword(),
                      const SizedBox(height: 26),
                      _LoginButton(),
                      const SizedBox(height: 50),
                      _orWithDivider(),
                      const SizedBox(height: 40),
                      _socialButtons(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _appBar() {
  return Row(children: [
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(Dictionary.string(Dictionary.sign_in_action),
            style: const TextStyle(
              fontFamily: "Ubuntu-B",
              color: kMainBlueColor,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left),
      ),
    ),
    const SizedBox(width: 32)
  ]);
}

Widget _orWithDivider() {
  return Row(children: <Widget>[
    const Expanded(
        child: Divider(
      height: 10,
      color: kDarkGreyColor,
    )),
    const SizedBox(width: 15),
    Text(
      Dictionary.string(Dictionary.or_sign_in_with),
      style: const TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: "Ubuntu",
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: kDarkGreyColor,
      ),
    ),
    const SizedBox(width: 15),
    const Expanded(
        child: Divider(
      height: 10,
      color: kDarkGreyColor,
    )),
  ]);
}

Widget _socialButtons() {
  return Row(
    children: const [
      Expanded(child: SocialButtonWidget(icon: "google")),
      Expanded(child: SocialButtonWidget(icon: "facebook")),
      Expanded(child: SocialButtonWidget(icon: "apple")),
    ],
  );
}

Widget _forgotPassword() {
  return Row(children: [
    Expanded(
      child: RichText(
        textAlign: TextAlign.end,
        text: TextSpan(
          children: [
            TextSpan(
              text: Dictionary.string(Dictionary.forgot_password),
              style: const TextStyle(
                  fontFamily: "Ubuntu",
                  color: kDarkGreyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    ),
  ]);
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Stack(
          children: [
            Positioned(
              top: 2,
              child: Container(
                height: 56,
                width: 333,
                // margin: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: kDarkGreyColor),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                key: const Key('loginForm_usernameInput_textField'),
                onChanged: (username) =>
                    context.read<LoginBloc>().add(LoginUsernameChanged(username)),
                decoration: InputDecoration(
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelStyle: const TextStyle(color: kDarkGreyColor),
                  labelText: Dictionary.string(Dictionary.email),
                  errorText: state.username.invalid
                      ? Dictionary.string(Dictionary.invalid_email)
                      : null,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Stack(
          children: [
            Positioned(
              top: 2,
              child: Container(
                height: 56,
                width: 333,
                // margin: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: kDarkGreyColor),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                key: const Key('loginForm_passwordInput_textField'),
                onChanged: (password) =>
                    context.read<LoginBloc>().add(LoginPasswordChanged(password)),
                obscureText: state.hidePassword,
                decoration: InputDecoration(
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: Dictionary.string(Dictionary.password),
                  labelStyle: const TextStyle(color: kDarkGreyColor),
                  errorText: state.password.invalid
                      ? Dictionary.string(Dictionary.invalid_password)
                      : null,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        state.hidePassword = !state.hidePassword;
                      });
                    },
                    color: Colors.black,
                    icon: state.hidePassword
                        ? Image.asset(
                            "assets/images/visibility_off_icon.png",
                            height: 20,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: kDarkGreyColor,
                          ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : MaterialButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: Text(
                  Dictionary.string(Dictionary.sign_in_action),
                  style: const TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(color: kMainBlueColor),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 138),
                color: kMainBlueColor,
                textColor: Colors.white,
              );
      },
    );
  }
}
