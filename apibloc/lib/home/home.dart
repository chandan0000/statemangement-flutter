import 'package:apibloc/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of(context),
      )..add(
          LoadApiEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: 'Aciviti for bored people'.text.xl2.thin.make(),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: ((context, state) {
            if (state is HomeLoadingSt) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    state.activityName.text.make(),
                    SizedBox(
                      height: 20,
                    ),
                    state.activityType.text.make(),
                    SizedBox(
                      height: 20,
                    ),
                    state.participants.text.make(),
                  ],
                ),
              );
            }

            return Container();
          }),
        ),
      ),
    );
  }
}
