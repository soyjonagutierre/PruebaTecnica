import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pruebatecnica/src/pages/dashboard.dart';
import 'package:pruebatecnica/src/models/modelo_usuario.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String nombre = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.green, 
      statusBarIconBrightness: Brightness.light, 
    ));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 224, 219),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/src/images/rick-morty.png'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    nombre = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Please enter your name',
                  enabledBorder: UnderlineInputBorder( 
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder( 
                    borderSide: BorderSide(color: Color.fromARGB(255, 97, 96, 96)),
                  ),
                  prefixIcon: Icon(Icons.person,
                  color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25), 
                child: ElevatedButton(
                  onPressed: () {
                    if (nombre.isNotEmpty) {
                      Provider.of<UserModel>(context, listen: false).setName(nombre);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text('REMINDER'),
                            content: Text('You are forgetting your name...'),
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('LOG IN'),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}