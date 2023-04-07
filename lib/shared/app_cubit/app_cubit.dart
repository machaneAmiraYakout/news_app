
import 'package:application_news/shared/app_cubit/state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../network/local/cache_helper.dart';



class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInititState());
  static AppCubit get(context)=>BlocProvider.of(context);



  bool isdark=false;

  void changeMode({bool? fromShared}){
    if(fromShared != null) {
      isdark=fromShared;
      emit(AppChangeModeState());

    } else {
      isdark = !isdark;
    }
    CacheHelper.putData(key: 'isdark', value: isdark).then((value) {

      emit(AppChangeModeState());

    });
  }



}
