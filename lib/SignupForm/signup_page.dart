
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
 final GlobalKey<FormState> _formKey=GlobalKey();
  final RegExp signUpEmailValid=RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("SignUp"),centerTitle:true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 50),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text('SignUp',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),),
                  TextFormField(
                    controller: nameController,
                    validator: (name){
                      if(name!.isEmpty){
                       return "Please Enter FullName";
                      }
                      else{
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>loginPage()));

                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Enter full name ",
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: emailController,
                    validator: (emailValue){
                      if(signUpEmailValid.hasMatch(emailValue!)){


                      }
                      else{
                        return "Invalid Email !";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Enter Email",
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      var name=nameController.text;
                      var email=emailController.text;
                      print("Name:$name, Email:$email");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>loginPage()));

                    }










                  },child: const Text('Sign Up'),)
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}