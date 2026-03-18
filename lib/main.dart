import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_ecommerce/providors/chartProvidor.dart';
import 'package:my_ecommerce/providors/favouriteProvidor.dart';
import 'package:my_ecommerce/storage/local_storage_service.dart';
import 'firebase_options.dart';
import './pages/Onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // تهيئة التخزين المحلي والفايربيز
  await Local_storage_Service.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Favouriteprovidor()..loadData()),
        ChangeNotifierProvider(create: (_) => ChartProvidor()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Onboarding(),
    );
  }
}