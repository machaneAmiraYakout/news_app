
import 'package:application_news/shared/app_cubit/app_cubit.dart';
import 'package:application_news/shared/app_cubit/state.dart';
import 'package:application_news/shared/cubit/cubit.dart';
import 'package:application_news/shared/network/local/cache_helper.dart';
import 'package:application_news/shared/network/remote/Dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/news_app_layout.dart';
import 'network/bloc_observer.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // hadi todhmonli bli hata ysraw hado li t7tha bah ydir runApp
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark= CacheHelper.getData(key: 'isdark');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
   //final bool isDark;
  // MyApp(this.isDark);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> NewsCubit()..getBusiness()..getSports()..getSciences()),
        BlocProvider(create: (BuildContext context)=> AppCubit()..changeMode(),)
      ],

      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context, state)=>{} ,
        builder: (context, state)=>MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              titleSpacing: 20.0,
              backgroundColor: Colors.white,

              elevation: 0.0,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),

            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              backgroundColor: Colors.white,
              elevation: 0.0,

            ),
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
              ),
            ),

          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: HexColor('333739'),
            appBarTheme:  AppBarTheme(
              titleSpacing: 20.0,
              backgroundColor: HexColor('333739'),
              elevation: 0.0,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor('333739'),
                statusBarIconBrightness: Brightness.light,
              ),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),

            ),
            bottomNavigationBarTheme:  BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              backgroundColor: HexColor('333739'),
              elevation: 0.0,

            ),
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),
            ),

          ),



          themeMode: AppCubit.get(context).isdark? ThemeMode.dark :ThemeMode.light,
          home: const Directionality(
            textDirection: TextDirection.ltr,
            child:  NewsApp(),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),);
  }




}

