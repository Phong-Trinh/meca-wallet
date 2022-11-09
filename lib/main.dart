import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/bloc/authentication/login/login_bloc.dart';
import 'package:flutter_application_2/domain/bloc/authentication/login/login_event.dart';
import 'package:flutter_application_2/domain/bloc/authentication/login/login_state.dart';
import 'package:flutter_application_2/infrastructure/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/bloc/user_cards/user_cards_bloc.dart';
import 'features/home/home_screen.dart';
import 'features/qr_scan/qr_scan.dart';
import 'features/widgets/animated-appbar.dart';
import 'features/widgets/outstanding_branchs.dart';
import 'features/widgets/utilities-banner.dart';
import 'infrastructure/repository/user_card_repository.dart';

void main() {
//   BlocProvider(
//       create: (BuildContext context) => LoginBloc(), child: cons
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepository>(
              create: (context) => UserRepository()),
          RepositoryProvider<UserCardRepository>(
              create: (context) => UserCardRepository()),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginBloc>(
                create: (context) =>
                    LoginBloc(userRepository: context.read<UserRepository>())
                      ..add(LoginByGoogleEvent()),
              ),
              BlocProvider(
                  create: (context) => UserCardsBloc(
                      userCardRepository: context.read<UserCardRepository>())),
            ],
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (BuildContext context, LoginState state) {
                if (state is LoginSuccessState) {
                  return MaterialApp(
                    title: 'Meca Wallet',
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                    home: const MyHomePage(title: 'Meca Wallet'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int selectedIndex = 0;
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween,
      _homeTween,
      _workOutTween,
      _iconTween,
      _searchTween;

  @override
  void initState() {
    _ColorAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconTween = ColorTween(
            begin: Colors.white,
            end: const Color.fromARGB(255, 106, 48, 231).withOpacity(0.5))
        .animate(_ColorAnimationController);
    _searchTween = ColorTween(
            begin: Colors.white, end: const Color.fromARGB(255, 223, 218, 218))
        .animate(_ColorAnimationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_ColorAnimationController);
    _workOutTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_ColorAnimationController);
    _TextAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));

    super.initState();
  }

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool scrollListener(ScrollNotification scrollInfo) {
    bool scroll = false;
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 86);

      _TextAnimationController.animateTo(scrollInfo.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: scrollListener,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(alignment: AlignmentDirectional.center, children: <
                      Widget>[
                    Column(
                      children: [
                        Container(
                            height: 224,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/halloween-background.png"),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            child: OutstandingBranchs()),
                      ],
                    ),
                    FractionallySizedBox(
                        widthFactor: 0.92,
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 112,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1, // changes position of shadow
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(
                                        5.0) //                 <--- border radius here
                                    )),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const QRViewScreen(),
                                  ));
                                },
                                child: Container(
                                    child: Row(
                                  children: [
                                    const SizedBox(width: 16),
                                    Icon(Icons.qr_code_scanner_rounded,
                                        size: 76,
                                        color:
                                            Color.fromRGBO(52, 51, 51, 0.816)),
                                    const VerticalDivider(
                                      indent: 16,
                                      endIndent: 16,
                                      width: 32,
                                      color: Color.fromRGBO(52, 51, 51, 0.816),
                                      thickness: 1,
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 8),
                                          Row(children: [
                                            Text('QR CODE',
                                                style: TextStyle(
                                                    letterSpacing: 1.8,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ]),
                                          SizedBox(height: 12),
                                          SizedBox(
                                            width: 200,
                                            child: Text(
                                                'Thêm thẻ thành viên - Nhận thật nhiều khuyến mãi',
                                                style: TextStyle(
                                                    height: 1.3,
                                                    color: Color.fromRGBO(
                                                        52, 51, 51, 0.816),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ])
                                  ],
                                )))))
                  ]),
                  HomeScreen()
                ],
              ),
            ),
            AnimatedAppBar(
              searchTween: _searchTween,
              onPressed: () {},
              colorAnimationController: _ColorAnimationController,
              colorTween: _colorTween,
              homeTween: _homeTween,
              iconTween: _iconTween,
              workOutTween: _workOutTween,
            )
          ],
        ),
      ),
    );
  }
}
