import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phpsign/common/sizedbox.dart';
import 'package:phpsign/sign_in_up/loginpage.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fornKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _numberController = TextEditingController();

  final _passController = TextEditingController();

  Future signup() async {
   
    final response = await http.post(
        Uri.parse("http://192.168.1.4/flutter/register.php"),
        body: {
          "username": _nameController.text,
          "password": _passController.text,
          "email": _emailController.text,
          "phonenumber": _numberController.text,
        });
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Form(
              key: _fornKey,
              child: Column(
              children: [
               
                kheight65,
                kheight65,
                 Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:const [
                      Text('Register',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600,color: Colors.blueGrey),)
                  ],),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                   validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid username!';
                  }
                  return null;
                },
                  decoration: const InputDecoration(
                    label: Text('User Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueGrey
                      ),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue
                      ),
                    ),
                  ),
                ),
                kheight15,
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                   decoration: const InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueGrey
                      ),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue
                      ),
                    ),
                  ),
                
                ),
                kheight15,
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _numberController,
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid phonenumber!';
                  }
                  else if(value.length<10)
                  {
                    return 'Enter a valid phonenumber!';
                  }
                  return null;
                },
                   decoration: const InputDecoration(
                    label: Text('PhoneNumber'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueGrey
                      ),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue
                      ),
                    ),
                  ),
                
                ),
                kheight15,
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _passController,
                   validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid password';
                  }
                  else if(value.length<=8)
                  {
                    return "Password must contain atleast 8 character";
                  }
                  return null;
                },
                  obscureText: true,
                   decoration: const InputDecoration(
                    
                    label: Text('Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueGrey
                      ),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue
                      ),
                    ),
                  ),
                ),
                kheight15,
                kheight15,
                Container(
                  width: 270,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)
                    ),
                    onPressed: (){
                      if(_fornKey.currentState!.validate())
                      {
                        signup().then((value) => Get.showSnackbar(const GetSnackBar(
                         
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                          message: 'Successfully registred',))).then((value) => Get.to(()=>LoginPage()));

                      }
                      else
                      {
                        Get.showSnackbar(const GetSnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Color(0xFFDE5A51),
                          message: 'Registration failed',));
                      }
                    
                  }, child: const Text('Register',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),)),
                ),
                kheight50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("You have account ?",style: TextStyle(fontSize: 17),),
                    InkWell(
                      onTap: (){
                          Get.to(()=>LoginPage());
                      },
                      child: const Text("SignIn",style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue),))
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}