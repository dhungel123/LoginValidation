
import 'package:flutter/material.dart';
import 'package:untitled/LoginPage/loginscreen.dart';


import 'SignupForm/signup_page.dart';
void main(){
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: loginPage()
    );
  }
}
class loginPage extends StatefulWidget{
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
   final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  var emailText=TextEditingController();

  var passText=TextEditingController();
  // String? emailvalidate(email){
  //   if(email.isEmpty){
  //     return "Invalid Email";
  //   }
  //   else if(email.length<5) {
  //     return "Password must be length of 5";
  //   }
  //   else{
  //     return null;
  //   }
  // }
   @override
   void dispose() {
   emailText.dispose();

    super.dispose();
  }


  final RegExp emailValid=RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: SizedBox(
          width: 300,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),

              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                  child: Column(
                children: [
                TextFormField(
                  validator: (email){
                    if(emailValid.hasMatch(email!)){

                    }
                    else{
                      return "Invalid Email";
                    }


                  },
                controller: emailText,
                enabled: true,
                decoration:InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Colors.deepOrange,
                        )
                    ),
                    enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21,),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                        )
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.deepOrange,
                    ),
                    hintText: "Enter Email"

                ),
              ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (password){
                      if(password==null||password.isEmpty){
                        return "Enter Password";
                      }

                    },
                      controller: passText,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration:InputDecoration(
                        labelText: 'Enter password',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                              color: Colors.deepOrange,
                            )

                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            )
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.remove_red_eye,color: Colors.deepOrange,
                          ), onPressed: () {
                          print("icon pressed");
                        },
                        ),


                      )

                  ),
                  ElevatedButton(onPressed:(){

            if(_formKey.currentState!.validate()){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>const LoginScreen(),
                ),
              );
              print('Validate');
              //




   }

   },
                    style: const ButtonStyle(
                  ), child: const Text('Login'),),
                  Row(
                    children: [
                      const Text('Doesnot have an account',),
                      MaterialButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));


                      },child: Text('SignUp'),
                      )


                    ],
              ),
              ]),
                      ),
                      ]
    ),
    )
    )
    )
    );

  }
}