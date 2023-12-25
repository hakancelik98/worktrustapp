import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:worktrustapp/user_state.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot)
        {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('WorkTrust Başlatılıyor',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat.regular'
                    ),
                  ),
                ),
              ),
            );
          }
          else if(snapshot.hasError)
          {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Bir hata oluştu',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'WorkTrust',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              primarySwatch: Colors.blue,
            ),
            home: UserState(),
          );
        }
    );
  }
}
