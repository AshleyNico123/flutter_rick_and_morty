import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/core/theme/color.dart';
import 'package:practicas_flutter/features/home/presentation/bloc/home_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListCharactersScreen extends StatefulWidget {
  const ListCharactersScreen({super.key});

  @override
  State<ListCharactersScreen> createState() => _ListCharactersScreenState();
}

class _ListCharactersScreenState extends State<ListCharactersScreen> {
  late final HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBloc>();
    homeBloc.add(GetAllCharacters(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state) {
        if (state is LoadingGetAllCharacters) {}
        if (state is FailedGetAllCharacters) {}
        if (state is SuccessGetAllCharacters) {}
      },
      builder: (_, state) {
        if (state is LoadingGetAllCharacters) {
          return const Center(
            child: CircularProgressIndicator(color: mainYellow),
          );
        }
        return listCharacters();
      },
    );
  }

  Widget listCharacters() {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: ListView.separated(
        separatorBuilder: (_, idx) => const Divider(color: mainGrey),
        itemCount: homeBloc.characters.length,
        itemBuilder: (_, idx) {
          return Text(
            homeBloc.characters[idx].name,
            style: const TextStyle(color: Colors.black),
          );
        },
      ),
    );
  }
}
