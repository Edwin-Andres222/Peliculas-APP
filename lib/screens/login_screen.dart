import 'package:flutter/material.dart';
import 'package:pelicula/widgets/widgets.dart';
import 'package:pelicula/ui/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(
                child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('Login', style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 30,
                ),
                _LoginForm()
              ],
            )),
            SizedBox(
              height: 10,
            ),
            Text('Crear una nueva cuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'example@correo.com',
                labelText: 'Correo electronico',
                iconData: Icons.alternate_email_rounded),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: '********',
                labelText: 'Contraseña',
                iconData: Icons.lock_outline),
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              disabledColor: Colors.grey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              elevation: 0,
              color: Colors.deepPurple,
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              })
        ],
      )),
    );
  }
}
