import 'package:faded_text/faded_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,

        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        textTheme: TextTheme(
          displayLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ).copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isCVVVisible = false;
  bool isCardCovered = false;
  String creditCardNo = "5105105105105100";
  String expiryDate = "01/28";
  int cvv = 239;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0d0d0d),
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'select payment method',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              const Text(
                "choose the preferred payment method to make payment",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  paymentButton(
                    color: Colors.white,
                    text: "pay",
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.0),
                  paymentButton(
                    color: Colors.red[900] ?? Colors.red,
                    text: "card",
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                "YOUR DIGITAL DEBIT CARD",
                style: TextStyle(color: Colors.white30),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset("assets/images/card_photo.png", height: 300),
                      Positioned(
                        right: 15,
                        top: 6.5,
                        child: Image.asset('assets/images/yes_bank.png'),
                      ),
                      Positioned(
                        top: 75,
                        left: 25,
                        child: Column(
                          children: [
                            Text(creditCardNo.substring(0, 4)),
                            SizedBox(height: 5.0),
                            Text(creditCardNo.substring(4, 8)),
                            SizedBox(height: 5.0),
                            Text(creditCardNo.substring(8, 12)),
                            SizedBox(height: 5.0),
                            Text(creditCardNo.substring(12, 16)),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "expiry",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 10.0,
                              ),
                            ),
                            Text("01/28", style: TextStyle(fontSize: 14.0)),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 137,
                        left: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CVV",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 10.0,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 30,
                                  child: FadedText(
                                    isCVVVisible ? cvv.toString() : "****",
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white38,
                                      letterSpacing: isCVVVisible ? 1.0 : 1.7,
                                      fontFamily: 'DMSans',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isCVVVisible = !isCVVVisible;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.red[900],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        left: 15,
                        bottom: 70,
                        child: IconButton(
                          onPressed: () async {
                            await Clipboard.setData(
                              ClipboardData(text: creditCardNo),
                            ).then((_) {
                              Fluttertoast.showToast(
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                msg: "copied successfully!",
                              );
                            });
                          },
                          icon: Row(
                            children: [
                              Icon(
                                Icons.file_copy_outlined,
                                color: Colors.red[900],
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "copy details",
                                style: TextStyle(
                                  color: Colors.red[900],
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 10,
                        child: Image.asset("assets/images/rupay.png", scale: 2),
                      ),

                      IgnorePointer(
                        ignoring: !isCardCovered,
                        child: AnimatedOpacity(
                          duration: Duration(seconds: 1),
                          opacity: isCardCovered ? 1.0 : 0.0,
                          child: Image.asset(
                            "assets/images/card_cover.png",
                            height: 300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      shadowColor: WidgetStatePropertyAll(Colors.transparent),
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      surfaceTintColor: WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isCVVVisible = false;
                        isCardCovered = !isCardCovered;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                isCardCovered
                                    ? Border(
                                      right: BorderSide(
                                        color: Colors.red[900] ?? Colors.red,
                                      ),
                                      left: BorderSide(
                                        color: Colors.red[900] ?? Colors.red,
                                      ),
                                      top: BorderSide(
                                        color: Colors.red[900] ?? Colors.red,
                                      ),
                                      bottom: BorderSide(
                                        color: Colors.red[900] ?? Colors.red,
                                      ),
                                    )
                                    : Border(
                                      right: BorderSide(color: Colors.white),
                                      left: BorderSide(color: Colors.white),
                                      top: BorderSide(color: Colors.white),
                                    ),
                          ),
                          child: Icon(
                            Icons.sunny,
                            color:
                                isCardCovered
                                    ? Colors.red[900] ?? Colors.red
                                    : Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        SizedBox(
                          width: 70,
                          child: Text(
                            isCardCovered ? " unfreeze" : "   freeze",
                            style: TextStyle(
                              color:
                                  isCardCovered
                                      ? Colors.red[900]
                                      : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white, width: 2.0),
            bottom: BorderSide.none,
            right: BorderSide.none,
            left: BorderSide.none,
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(2050, 400)),
        ),
        padding: EdgeInsets.only(top: 15.0, bottom: 10),
        child: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: Colors.white),
          selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedItemColor: Colors.white54,
          elevation: 5.0,

          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: 1,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              label: "home",
              icon: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border(
                    right: BorderSide(color: Colors.white30),
                    left: BorderSide(color: Colors.white30),
                    top: BorderSide(color: Colors.white30),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/images/home.svg',
                  width: 20,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "yolo pay",

              icon: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border(
                    right: BorderSide(color: Colors.white),
                    left: BorderSide(color: Colors.white),
                    top: BorderSide(color: Colors.white),
                  ),
                ),
                child: Stack(
                  children: [
                    Image.asset('assets/images/qr_background.png', width: 20),
                    SvgPicture.asset(
                      'assets/images/qr_foreground.svg',
                      width: 30,
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "ginie",
              icon: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border(
                    right: BorderSide(color: Colors.white30),
                    left: BorderSide(color: Colors.white30),
                    top: BorderSide(color: Colors.white30),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/images/genie.svg',
                  width: 20,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentButton({
    Color color = Colors.lightBlue,
    required String text,
    required VoidCallback onPressed,
  }) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 0),
      color: Colors.transparent,

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35.5, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(30.0)),
          border: Border(
            right: BorderSide(color: color),
            left: BorderSide(color: color),
            top: BorderSide(color: color),
          ),
        ),

        child: Text(text, style: TextStyle(color: color, fontSize: 17.0)),
      ),
    );
  }
}
