import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/model/all_providers.dart';
import 'package:voco_case_study/model/api_services.dart';
import 'package:voco_case_study/view/participant_list.dart';




class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>{
 final TextEditingController _usernametextController = TextEditingController();
 final TextEditingController _passwordtextController = TextEditingController();
 
  



  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        color:Colors.amberAccent.withOpacity(.2),
        child:  Padding(
          padding:const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login Page",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                const SizedBox(height:70,),
                TextField(
                  controller: _usernametextController,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Johny123@vocomail.com",
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: "Email or Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                ),
                const SizedBox(height: 50,),
                TextField(
                  controller: _passwordtextController,
                  cursorColor: Colors.black,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                ),
                const SizedBox(height: 50,),
                ElevatedButton(
                  style:const ButtonStyle(
                    elevation: MaterialStatePropertyAll(4),
                    backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)),
                  onPressed: ()async{
                    String? token = await ApiService().login(_usernametextController.text, _passwordtextController.text);
                    
                    if(token == null){
                    debugPrint("hatalı giriş bilgisi");
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: Text("Hata",style: TextStyle(color: Colors.red),),
                        content: Text("Lütfen kullanıcı adı veya şifreyi yanlış girdiniz!",),
                        actions: [
                          TextButton(
                            onPressed: (){
                             Navigator.pop(context);
                            }, 
                            child: Text("Tamam",style: TextStyle(color: Colors.black),))
                        ],
                      ));
                    }
                    else{
                    //Token'ı Riverpod üzerinden erişilebilir hale getirme ve SharedPreferences'a kaydetme
                    ref.watch(tokenProvider.notifier).tokenyaz(token);

                    //final sharedPrefs = await SharedPreferences.getInstance();
                    //sharedPrefs.setString('token', token);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListParticipant()));
                    }
                  }, 
                  child:const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("LOGIN",style: TextStyle(fontSize: 23),),
                  ))
                ]
            ),
          ),
        ),) ,
    );
  }

}
