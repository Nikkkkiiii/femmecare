import 'package:femmecare/bloc/login/login_bloc.dart';
import 'package:femmecare/data/login/login_repo.dart';
import 'package:femmecare/presentations/channel.dart';
import 'package:femmecare/presentations/dashboard.dart';
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
            create: (context) =>
                LoginBloc(loginRepo: LoginRepo()),
            child: Container(),
          ),
         
         
        ],
        child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
      // initialRoute: "/signUp",
      routes: {
        '/signUp': (context) => Signup(),
        '/login': (context) => Login(),
        '/cal': (context) => Calendar(),
        '/chan':(context) => Channel(),
        '/otp':(context) => Calendar()
        // '/profile':(context) => ProfilePage(),
      },
    ));
    
  }
}


