import 'package:app_start/user_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  // Variables to store username and password
  String _username = '';
  String _password = '';
  bool _loginFailed = false; // Variable to track login failure

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
                  ),
                ),
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
                      onChanged: (value) {
                        setState(() {
                          _username = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Password",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true, //dot dot while typing / hide
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 60.0)),
                    MaterialButton(
                      height: 50,
                      minWidth: 100,
                      onPressed: () {
                        // Handle login button press
                        if(_username == "prasad.mahankal22@pccoepune.org" && _password == "122B1B164" 
                        || _username == "aditya.mashere22@pccoepune.org" && _password == "122B1B173"
                        || _username == "nayan.keote22@pccoepune.org" && _password == "122B1B137"
                        || _username == "ashish.suryawanshi22@pccoepune.org" && _password == "122B1B270"){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const user_page();//nayan's main page
                          }));
                        }else{
                          setState(() {
                            _loginFailed = true; // Set login failed to true
                          });
                        }
                      },
                      color: Colors.green[500],
                      textColor: Colors.white,
                      splashColor: Colors.redAccent,
                      child: const Icon(Icons.login),
                    ),
                    if (_loginFailed) // Display error message if login failed
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          'Login Failed',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                ),
              ), //input data
            ),
          ),
        ],
      ),
    );
  }
}
