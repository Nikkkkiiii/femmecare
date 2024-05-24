import 'package:femmecare/bloc/channel/article_bloc.dart';
import 'package:femmecare/bloc/chat/chat_bloc.dart';
import 'package:femmecare/bloc/login/login_bloc.dart';
import 'package:femmecare/bloc/signup/signup_bloc.dart';
import 'package:femmecare/data/login/login_repo.dart';
import 'package:femmecare/data/signup/signup_repo.dart';
import 'package:femmecare/presentations/article/article_list.dart';
import 'package:femmecare/presentations/dashboard.dart';
import 'package:femmecare/presentations/forgot_password.dart';
import 'package:femmecare/presentations/otp_page.dart';
import 'package:femmecare/presentations/signup.dart';
import 'package:flutter/material.dart';
import 'package:femmecare/presentations/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          
          BlocProvider(
            create: (context)=>
              SignupBloc(SignupRepo:SignupRepo()),
            child: Container(),
          ),
          BlocProvider(
            create: (context) =>
                LoginBloc(LoginRepo:LoginRepo()),
            child: Container(),
          ),
          BlocProvider(
            create: (context) => ChatListBloc(),
            child: Container(),
          ),
          BlocProvider(
            create: (context) => ArticleBloc(),
            child: Container(),
          )
         
        ],
        child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OtpScreen(),
      // initialRoute: "/signUp",
      routes: {
        '/signUp': (context) => const Signup(),
        '/login': (context) => Login(),
        '/cal': (context) => const Calendar(),
        '/chan':(context) => const ArticleList(),
        '/otp':(context) => const Calendar(),
        '/art': (context) => ArticleList() ,
      },
    ));
    
  }
}


