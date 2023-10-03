import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ileriduzey/screens/Anasayfa.dart';
import 'package:ileriduzey/screens/login.dart';
import 'package:ileriduzey/screens/topbar.dart';
//import 'package:ileriduzey/screens/topbar.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();  //firebaseyi başlatır!!!!
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tekrar Uygulaması',
      theme: ThemeData(
   
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: TabbarScreen()  //ilk açılan sayfayı yaz, tabbar screenı oluşturdum burada yönlendirmesini yaptım
     home:TabbarScreen() 

    );
  }
}
