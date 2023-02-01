
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'newsapp/cubit/cubits.dart';
import 'newsapp/cubit/satates.dart';
import 'newsapp/layout/newslayout.dart';
import 'newsapp/network/local/cach_helper.dart';
import 'newsapp/network/remote/diohelper.dart';
import 'newsapp/theme/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(
    isDark: isDark,
  ));
}
class MyApp extends StatelessWidget {

  final bool? isDark;

  // constructor
  // build

  const MyApp({super.key, required this.isDark});@override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..changeAppMode(
          fromShared: isDark
      ),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
            NewsCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}