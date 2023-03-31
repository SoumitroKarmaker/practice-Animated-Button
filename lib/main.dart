import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  double turns = 0.0;
  bool isClicked = false;
  late AnimationController _controller;
  Color customBlackColor = const Color.fromARGB(255, 53, 53, 53);
  Color customWhiteColor = const Color.fromARGB(255, 237, 237, 237);
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 2),
      vsync: this,

    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhiteColor,
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: Center(
        child: AnimatedRotation(
          curve: Curves.easeOutExpo,
          duration: const Duration(seconds: 1),
          turns: turns,
          child: GestureDetector(
            onTap: (){
              if(isClicked){
                setState(() => turns -= 1/4);
                _controller.reverse();
              }else{
                setState(() => turns += 1/4);
                _controller.forward();
              }
              isClicked = !isClicked;
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),
              color: customWhiteColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 30.0,
                  offset: const Offset(20, 20),
                  color: Colors.grey,
                ),
                BoxShadow(
                  blurRadius: 30.0,
                  offset: const Offset(-20, -20),
                  color: Colors.white,
                )
              ]
              ),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Center(
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _controller,
                    size: 100,
                    color: customBlackColor,
                  )
                ),
              ),
            ),
          ),
        ),

      ),
    );

  }
}
