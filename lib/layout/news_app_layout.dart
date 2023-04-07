import 'package:application_news/shared/cubit/cubit.dart';
import 'package:application_news/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/network/remote/Dio_helper.dart';
import '../components/components.dart';
import '../modules/search/search.dart';
import '../shared/app_cubit/app_cubit.dart';



class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<NewsCubit,NewsStates>(
       listener: (context, state)=>{},
       builder: (context, state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('App News'),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigateto(context, Search());
                  },
                  icon: const Icon(Icons.search)
              ),
              IconButton(
                onPressed: (){
                  AppCubit.get(context).changeMode();
                },
                icon: const Icon(Icons.brightness_2_outlined),
              )
            ],
          ),

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeItemBar(index);
            },
            items: cubit.BarItem,
          ),
        );
      },
    );

  }
}
