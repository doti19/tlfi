import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlfi/providers/dark_theme_provider.dart';
import 'package:tlfi/providers/navigation_provider.dart';
import 'package:tlfi/themes/theme_data.dart';
import 'package:tlfi/widgets/build_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => themeChangeProvider),
        // ChangeNotifierProxyProvider0<DarkThemeProvider>(create: (BuildContext context)=>DarkThemeProvider(Provider.of<NavigationProvider>(context, listen: false)), update: update)
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            // theme: ThemeData(
            //   // This is the theme of your application.
            //   //
            //   // TRY THIS: Try running your application with "flutter run". You'll see
            //   // the application has a blue toolbar. Then, without quitting the app,
            //   // try changing the seedColor in the colorScheme below to Colors.green
            //   // and then invoke "hot reload" (save your changes or press the "hot
            //   // reload" button in a Flutter-supported IDE, or press "r" if you used
            //   // the command line to start the app).
            //   //
            //   // Notice that the counter didn't reset back to zero; the application
            //   // state is not lost during the reload. To reset the state, use hot
            //   // restart instead.
            //   //
            //   // This works for code too, not just values: Most code changes can be
            //   // tested with just a hot reload.
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   useMaterial3: true,
            // ),
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: MainPage(),
          );
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => buildPages(context);
}
