import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phpsign/common/sizedbox.dart';
import 'package:phpsign/home/homepage.dart';
import 'package:phpsign/sign_in_up/registerpage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  Future signin() async {
   
    final response = await http.post(
        Uri.parse("http://192.168.1.4/flutter/login.php"),
        body: {
          
          "password": _passController.text,
          "email": _emailController.text,
          
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
              key: _loginKey,
              child: Column(
              children: [
                
                kheight65,
                kheight65,
                
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:const [
                      Text('Login',style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 30,fontWeight: FontWeight.w600),)
                  ],),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                 validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid email';
                  }
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
                      if (_loginKey.currentState!.validate()) {
                         signin().then((value) => Get.showSnackbar(const GetSnackBar(
                          duration: Duration(seconds: 2),
                          message: 'Login Successfully',backgroundColor: Colors.green,))).then((value) =>Get.to(()=>HomePage()) );
                      }
                       else
                       {
                        Get.showSnackbar(const GetSnackBar(message: 'Login Failed',backgroundColor: Colors.red,));
                       }
                  }, child: const Text('Login',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)),
                ),
                kheight50,
                kheight50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("You don't have account ?"),
                    InkWell(
                      onTap: (){
                          Get.to(()=>RegisterPage());
                      },
                      child: const Text("SignUp",style: TextStyle(color: Colors.blue),))
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