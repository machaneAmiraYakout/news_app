
import 'package:application_news/shared/cubit/state.dart';
import 'package:application_news/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/business/business.dart';
import '../../modules/science/science.dart';
import '../../modules/sports/sport.dart';




class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialStates());
  static NewsCubit get(context)=> BlocProvider.of(context);
  int currentIndex=0;
  List<BottomNavigationBarItem> BarItem=[
    const BottomNavigationBarItem(
        icon: Icon(Icons.business,),
        label: 'Business'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_gymnastics,),
        label: 'Sports'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_rounded,),
        label: 'Science'
    ),

  ];
  List<Widget> screens=[
    Business(),
    Sport(),
    Sciences(),

  ];
  void changeItemBar(int index){
    currentIndex = index;
    // hadi nhab hata nlodh bah ji data
    // if(index==1)getSports();
    // if(index==2)getSciences();
    emit(NewsBottomNavState());

  }
  List <dynamic> business=[];
  void getBusiness(){
    if(business.length==0){
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(

          method: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'business',
            'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
          }
      ).then((value) {
        print('warahi data ?');
        business=value?.data['articles'];
        print(business.length);
        emit(NewsGetBusinessSuccessState());
      }).catchError((onError){
        emit(NewsGetBusinessErrorState(onError.toString()));
        print(onError.toString());
      });

    }else{
      emit(NewsGetBusinessSuccessState());
    }
  }

  List <dynamic> sports=[];
  void getSports(){
    emit(NewsGetSportsLoadingState());
    if(sports.length==0){
      DioHelper.getData(

          method: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
          }
      ).then((value) {
        print('warahi data ?');
        sports=value?.data['articles'];
        print(sports.length);
        emit(NewsGetSportsSuccessState());
      }).catchError((onError){
        emit(NewsGetSportsErrorState(onError.toString()));
        print(onError.toString());
      });
    }else{
      emit(NewsGetSportsSuccessState());

    }




  }

  List <dynamic> sciences=[];
  void getSciences(){
    emit(NewsGetSciencesLoadingState());

   if(sciences.length==0){
     DioHelper.getData(

         method: 'v2/top-headlines',
         query: {
           'country':'eg',
           'category':'science',
           'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
         }
     ).then((value) {
       print('warahi dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa:');
       print(value?.data.toString());
       sciences=value?.data['articles'];
       print(sciences.length);
       emit(NewsGetSciencesSuccessState());
     }).catchError((onError){
       emit(NewsGetSciencesErrorState(onError.toString()));
       print(onError.toString());
     });
   }else{
     emit(NewsGetSciencesSuccessState());

   }



  }

  List <dynamic> search=[];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());

      DioHelper.getData(
          method: 'v2/everything',
          query:
          {
            'q':'$value',
            'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
          }
      ).then(( value) {
        print('warahi data ta3 search aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ?');
        print(value?.data.toString());
        search=value?.data['articles'];
        print(search.length);
        emit(NewsGetSearchSuccessState());
      }).catchError((onError){
        emit(NewsGetSearchErrorState(onError.toString()));
        print(onError.toString());
      });





  }

}