import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/core/entities/character_entity.dart';
import 'package:practicas_flutter/core/theme/color.dart';
import 'package:practicas_flutter/features/home/presentation/bloc/home_bloc.dart';
import 'package:practicas_flutter/features/home/presentation/widget/card_generic_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListCharactersScreen extends StatefulWidget {
  const ListCharactersScreen({super.key});

  @override
  State<ListCharactersScreen> createState() => _ListCharactersScreenState();
}

class _ListCharactersScreenState extends State<ListCharactersScreen> {
  late final HomeBloc homeBloc;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state) {
        if (state is LoadingGetAllCharacters) {
          isLoading = true;
        }
        if (state is FailedGetAllCharacters) {
          isLoading = false;
        }
        if (state is SuccessGetAllCharacters) {
          isLoading = false;
        }
      },
      builder: (_, state) {
        if (isLoading) {
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
        separatorBuilder: (_, idx) => SizedBox(height: 1.h,),
        itemCount: homeBloc.characters.length,
        itemBuilder: (_, idx) => CardGenericList(
          urlImage: homeBloc.characters[idx].image,
          title: homeBloc.characters[idx].name,
          subtitleHeader: homeBloc.characters[idx].species,
          subtitleInformation: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(homeBloc.characters[idx].status.label),
              SizedBox(width: 2.w),
              Text(homeBloc.characters[idx].gender),
            ],
          ),
        ),
      ),
    );
  }
}
