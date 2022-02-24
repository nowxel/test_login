import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/login/bloc/result/result_event.dart';

import '../../authentication/bloc/authentication_bloc.dart';
import '../../constants.dart';
import '../../data/dictionary.dart';
import '../../login/bloc/result/result_bloc.dart';
import '../../login/bloc/result/result_state.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ResultBloc resultBloc;
  @override
  void initState() {
    resultBloc = BlocProvider.of<ResultBloc>(context);
    resultBloc.add(FetchResultsEvents());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainBlueColor,
        body: _housePage(context),
      ),
    );
  }
  Widget _housePage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
                top: 150, left: 16, right: 16, bottom: 34),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _birdImage(),
                      _loginSuccessful(),
                      _nameAndSurname(context),
                      _goToHomePageButton(context)
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

  Widget _nameAndSurname(BuildContext context) {
    return Center(
      child: BlocListener<ResultBloc, ResultState>(
        listener: (context, state) {
          if (state is ResultErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<ResultBloc, ResultState>(
          builder: (BuildContext context, ResultState state) {
            if (state is ResultInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is ResultErrorState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is ResultLoadedState) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  _requestText(
                    title: Dictionary.string(Dictionary.name),
                    description: state.results.name,
                  ),
                  _requestText(
                    title: Dictionary.string(Dictionary.surname),
                    description: state.results.surname,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Image _birdImage() {
    return Image.asset(
      "assets/images/bird_icon.png",
      height: 120,
    );
  }

  Widget _loginSuccessful() {
    return Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(Dictionary.string(Dictionary.login_successful),
              style: const TextStyle(
                fontFamily: "Ubuntu",
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    ]);
  }

  Widget _requestText({required String title, required String description}) {
    return Container(
      padding: const EdgeInsets.only(left: 48, top: 2),
      child: Row(children: [
        Text(title,
            style: const TextStyle(
              fontFamily: "Ubuntu",
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center),
        Expanded(
          child: Text(description,
              style: const TextStyle(
                fontFamily: "Ubuntu",
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center),
        ),
      ]),
    );
  }

  Widget _goToHomePageButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.6,
            child: MaterialButton(
              child: Text(
                Dictionary.string(Dictionary.go_to_home_page),
                style: const TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: kMainBlueColor),
              ),
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: const BorderSide(color: Colors.white),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: Colors.white,
              textColor: kMainBlueColor,
            ),
          ),),
      ],
    );
  }
}