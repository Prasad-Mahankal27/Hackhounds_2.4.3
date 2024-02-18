import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );

    _iconAnimation.addListener(() => setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            "https://www.power-technology.com/wp-content/uploads/sites/21/2021/09/shutterstock_1864450102-scaled.jpg",
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ), //background blend
          Form(
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                      )
                  )
              ), //theme
              child: Container(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _iconAnimation,
                      child: Image.network("https://www.dialogue.agency/hs-fs/hubfs/EV%20branding%20report%20cover.jpg?width=1500&height=1000&name=EV%20branding%20report%20cover.jpg"),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Email",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Password",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true, //dot dot while typing / hide
                    ),
                    const Padding(padding: EdgeInsets.only(top: 60.0)),
                    MaterialButton(
                        height: 50,
                        minWidth: 100,
                        onPressed: () {},
                        color: Colors.green[500],
                        textColor: Colors.white,
                        splashColor: Colors.redAccent,
                        child: const Icon(Icons.login)),
                  ],
                ),
              ), //input data
            ),
          )
        ],
      ),
    );
  }
}
