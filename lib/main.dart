import 'package:clint_store/cubit/cubits/client_cubit.dart';
import 'package:clint_store/cubit/cubits/engineer_cubit.dart';
import 'package:clint_store/services/shared_preference.dart';
import 'package:clint_store/splash_screan.dart';
import 'package:clint_store/utilities/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'Engineer/main home/screans of Home/posts/cubit_post/cubit_post.dart';
import 'client_Screens/cart_screen/cart.dart';
import 'cubit/observer.dart';
import 'engineer_Screen/home_screen_en/home_screen_en.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Bloc.observer = MyBlocObserver();
  runApp(MyApp()); // run app
}

//////////////////////////////////////////////////////

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => ClientCubit()),
        BlocProvider(create: (context) => EngineerCubit()),
        BlocProvider<ImageCubit>(
          create: (context) => ImageCubit(),
        ),
      ],
      child: MultiProvider(
          providers: providers,
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                },
              );
            },
          )),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// flutter pub run flutter_launcher_icons:main
// myList.removeWhere((item) => ["", null, false, 0].contains(item));
// id of uuu 629cc18997bc6063f191a910"
// overflow: TextOverflow.ellipsis,

// SystemChannels.textInput.invokeMethod('TextInput.hide');

// splashFactory: NoSplash.splashFactory,
// overlayColor: MaterialStateProperty.all(Colors.transparent),
// onTap: () {
// FocusScope.of(context).unfocus();
// },
//

// BlocProvider.of<BillDetailsCubit>(context).totalPriceForPaymentWays

// textDirection: languageProvider!.isEnglish == true
// ? TextDirection.ltr
//     : TextDirection.rtl,

// decoration: new BoxDecoration(
// image: new DecorationImage(
// image: new AssetImage("assets/images/brand.png"),
// fit: BoxFit.cover,
// )
// )
// decoration:  BoxDecoration(
// border: Border(
// left: BorderSide(
// color: Colors.black,
// width: 3.0,
// ),
// top: BorderSide(
// color: Colors.black,
// width: 3.0,
// ),
// ),
// ),

// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// MembershipTypeScreen()));

////////////////
// icon: Icon(
// Icons.clear,
// size: getSize(context: context).width*0.06,
// color: Colors.black,
// )),
////////////////////
// SystemChannels.textInput.invokeMethod('TextInput.hide');
// margin: EdgeInsets.symmetric(
// horizontal: getSize(context: context).width * 0.04,
// vertical: getSize(context: context).width * 0.1),

// getSize(context: context).height
// LanguageProvider languageProvider;

// final GlobalKey<ScaffoldState> _key = GlobalKey();

// languageProvider.isEnglish == true
// ? TextDirection.ltr
//     : TextDirection.rtl,

// @override
// void initState() {
//   super.initState();
//   languageProvider = Provider.of<LanguageProvider>(context, listen: false);
// }
// @override
// Widget build(BuildContext context) {
// return Scaffold(
// key: _key,
// drawer: CreatDrawer(),
// endDrawer: CreatDrawer(),
// backgroundColor: secColor,
// appBar: CreatAppBar(
// label: languageProvider.getTexts("categories"),
// onDrawerPressed: () {
// languageProvider.isEnglish == true
// ? _key.currentState.openDrawer()
//     : _key.currentState.openEndDrawer();
// },
// ),
// );}
/////////////////////////////////
// getSize(context: context).height
// navigateDotPushReplacement(context:context,PageName:MainCategoriesScreen());
// horizontal:getSize(context: context).width*0.04
/////////////////////////////////
// Container(
// margin: EdgeInsets.symmetric(
// vertical: getSize(context: context).width * 0.2,
// ),
// width: getSize(context: context).width * 0.5,
// height: getSize(context: context).width * 0.4,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage("assets/images/logo.png"),
// fit: BoxFit.fill,
// )),
// ),
