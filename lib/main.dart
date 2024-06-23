import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TextEditingController messageTextController = TextEditingController();
  ScrollController scrollController = ScrollController();
  static const String _kStrings = 'Geon Flutter Secretary App by Chat GPT';
  late Animation<int> _characterCount;
  late AnimationController animationController;

  String get _currentString => _kStrings;

  setupAnimations() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));
    _characterCount = StepTween(begin: 0, end: _currentString.length).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.addListener(() {
      setState(() {});
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          animationController.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          animationController.forward();
        });
      }
    });
    animationController.forward();
  }

  @override
  void initState() {
    // TODO: implement initState
    setupAnimations();
    super.initState();
  }

  @override
  void dispose() {
    messageTextController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Card(
                  child: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: ListTile(
                            title: Text('히스토리'),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            title: Text('설정'),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            title: Text('새로운 채팅'),
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              ),
              Expanded(
                child: AnimatedBuilder(
                  animation: _characterCount,
                  builder: (BuildContext context, child) {
                    String text =
                        _currentString.substring(0, _characterCount.value);
                    return Row(
                      children: [
                        Expanded(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: text,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                )),
                            WidgetSpan(
                                child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.orange[200],
                              ),
                            ))
                          ])),
                        ),
                      ],
                    );
                  },
                  // color: Colors.blue,
                  // child: Center(child: Text(_kStrings)),
                  // child: ListView.builder(itemBuilder: (context, index){
                  //   if (index % 2 == 0){
                  //     return Padding(
                  //       padding: const EdgeInsets.symmetric(vertical: 16),
                  //       child: Row(
                  //         children: [
                  //           CircleAvatar(),
                  //           SizedBox(width: 8,),
                  //           Expanded(child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text('GPT'),
                  //               Text('message'),
                  //             ],
                  //           ))
                  //         ],
                  //       ),
                  //     );
                  //   }
                  //   return Row(
                  //     children: [
                  //       Expanded(child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.end,
                  //         children: [
                  //           Text('User'),
                  //           Text('message'),
                  //         ],
                  //       ),),
                  //       SizedBox(width: 8,),
                  //       CircleAvatar(
                  //         backgroundColor: Colors.blue,
                  //       ),
                  //     ],
                  //   );;
                  // },
                  // itemCount: 10,
                  // controller: scrollController,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Dismissible(
                key: Key('chat-bar'),
                direction: DismissDirection.startToEnd,
                onDismissed: (d) {
                  if (d == DismissDirection.startToEnd) {
                    //TODO:LOGIC 구현
                  }
                },
                background: Row(
                  children: [
                    Text('New Chat'),
                  ],
                ),
                confirmDismiss: (d) async {
                  if (d == DismissDirection.startToEnd) {}
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(),
                        ),
                        child: TextField(
                          controller: messageTextController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Message'),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_circle_up),
                      iconSize: 32,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
