import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/config/route.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/themes/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<AppData>(
        create: (_) => AppData(),
      )
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: Routes.getRoute(),
//      onGenerateRoute: (RouteSettings settings){
//              final List<String> pathElements = settings.name.split('/');
//                if(pathElements[1].contains('detail')){
//                  return CustomRoute<bool>(builder:(BuildContext context) => ProductDetailPage());
//                }
//                return
//          },
    );
  }
}
