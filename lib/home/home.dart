import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/home/view/home_page.dart';

import '../login/bloc/result/result_bloc.dart';
import '../services/api_services.dart';


class BlocResultView extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => BlocResultView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(child: BlocProvider(
              create: (context) => ResultBloc(repository: APIWeb()),
              child: HomePage())),
        ],
      ),
    );
  }
}
