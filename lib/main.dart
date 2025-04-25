import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbl_fitness_app/widgets/dark_theme_widget.dart';
import 'package:pbl_fitness_app/providers/user_provider.dart';
import 'package:pbl_fitness_app/theme/app_theme.dart';
import 'authentication/login.dart';
import 'screens/home_screen.dart';
import 'screens/workout_screen.dart';
import 'screens/diet_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/health_tips.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: ThemeBuilder(
        defaultBrightness: Brightness.light,
        builder: (context, _brightness) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: AppTheme.primaryColor,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: MaterialColor(
                  AppTheme.primaryColor.value,
                  <int, Color>{
                    50: AppTheme.primaryColor.withOpacity(0.1),
                    100: AppTheme.primaryColor.withOpacity(0.2),
                    200: AppTheme.primaryColor.withOpacity(0.3),
                    300: AppTheme.primaryColor.withOpacity(0.4),
                    400: AppTheme.primaryColor.withOpacity(0.5),
                    500: AppTheme.primaryColor.withOpacity(0.6),
                    600: AppTheme.primaryColor.withOpacity(0.7),
                    700: AppTheme.primaryColor.withOpacity(0.8),
                    800: AppTheme.primaryColor.withOpacity(0.9),
                    900: AppTheme.primaryColor,
                  },
                ),
                accentColor: AppTheme.accentColor,
                brightness: _brightness,
              ),
              scaffoldBackgroundColor: AppTheme.backgroundColor,
              fontFamily: 'Lato',
              textTheme: TextTheme(
                headlineLarge: AppTheme.headingLarge,
                headlineMedium: AppTheme.headingMedium,
                bodyLarge: AppTheme.bodyLarge,
                bodyMedium: AppTheme.bodyMedium,
              ),
              bottomNavigationBarTheme: AppTheme.bottomNavTheme,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: AppTheme.primaryButtonStyle,
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Fit',
            initialRoute: '/login',
            routes: {
              '/login': (context) => LoginScreen(),
              '/': (context) => HomeScreen(),
              '/workout': (context) => WorkoutScreen(),
              '/diet': (context) => DietScreen(),
              '/profile': (context) => ProfileScreen(),
              '/tips': (context) => HealthTipsScreen(),
            },
          );
        },
      ),
    );
  }
}
