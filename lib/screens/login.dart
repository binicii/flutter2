import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ileriduzey/screens/Anasayfa.dart';
//import 'package:ileriduzey/screens/Anasayfa.dart';
//import 'package:ileriduzey/screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final formKey =GlobalKey<FormState>();
  TextEditingController isimKontrolu=TextEditingController();
  TextEditingController sifreKontrolu=TextEditingController();
  String? isim, sifre;
  
  
  get child => null;

  Login(String email, password) async{
    if(formKey.currentState!.validate()){

     try{
       final kullaniciGiris= await FirebaseAuth.instance.    //firebaseden mail ve pass doğrulaması yapıyoruz
       signInWithEmailAndPassword(email: email, password: password);  
       Navigator.push(context, MaterialPageRoute(builder: (context)=> AnaScreen()));

     }catch(e){

     }

      
  /*    if(name=='busra' && password=='12345'){
      bildiri("Kullanıcı Doğrulandı", Icons.notification_add);
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => AnaScreen()));

    }else{
      bildiri("Kullanıcı Bulunamadı", Icons.home);
    } */
  }
}

bildiri(String message, IconData icon){  //metod tanımladık 1 defa yukarıda 2 yerde kullandık!
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.horizontal,
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height -50),
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 185, 59, 207),
    content :Text (
      message,
      ),),
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          
          children: [
            Padding(
              
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onSaved:(String? value){
                    isim=value;
                  },
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Lütfen Kullanıcı Adınızı Girin";
                    }else
                    null;
                  },
                  controller: isimKontrolu,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Kullanıcı ismini Giriniz",
                    prefixIcon: Icon(Icons.person),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color:Colors.grey),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color:Colors.grey),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color:Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color:Colors.red),
                  ),

                  
                ),
              ),
              ),

        //    kayitWidget(isim, "Lütfen Kullanıcı Adınızı Girin", "Kullanıcı Adınız", Icons.person), // registerde tanımladıgım widgeti buradada çağırabiliyorum 







              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  
                  onSaved:(String? value){
                    sifre=value;
                  },
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Lütfen Şifrenizi Girin";
                    }else
                    null;
                  },
                  controller: sifreKontrolu,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Şifrenizi Giriniz",
                    prefixIcon: Icon(Icons.person),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color:Colors.grey),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color:Colors.grey),
                  ),
                   focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color:Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color:Colors.red),
                  ),

                  
                ),
              ),  
              ),







              InkWell(
                onTap: () {
                  Login(isimKontrolu.text, sifreKontrolu.text);
                },

                child: Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 117, 115, 115),
                    borderRadius: BorderRadius.circular(5),
        ),
            child: Padding(
             padding: EdgeInsets.symmetric(vertical: 11),
             child: Text("Login"),
          ),
                    
                ),
              ),
          ],
        
        
        ),
        ),
    );
  }
}