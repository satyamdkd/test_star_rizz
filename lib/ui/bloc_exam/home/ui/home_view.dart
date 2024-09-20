import 'package:demo_firebase/ui/bloc_exam/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeBloc.add(
            HomeLoginButtonPressed("aditya.gupta@dkd.co.in", "12345", context),
          );
        },
        child: const Text("LOGIN"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state is HomeLoading
              ? const Center(child: CircularProgressIndicator())
              : state is HomeFailure
                  ? const Center(child: Text("Failure"))
                  : state is HomeSuccess
                      ? const Center(child: Text("Success"))
                      : Container();
        },
      ),
    );
  }
}
