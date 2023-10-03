import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? isim, sifre,mail,adres, cepno, cinsiyet;
  
  List listt=["Kadın", "Erkek"];
  


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Kayıt Ol Ekranına Hoş Geldiniz",
            style: TextStyle(color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            ),
            ),
          ),




          // BU MUKEMMEL YAPIYI KULLAN SÜREKLİ TANIMLAMA YAPMAKTAN KURTARIR
           kayitWidget(isim, "Lütfen Kullanıcı Adınızı Girin", "Kullanıcı Adınız", Icons.person), // aşağıda tanımlanan widgetin değerlerini girdim, isim için yazıldı
           kayitWidget(sifre, "Lütfen Şifrenizi  Girin", "Şifrenizi Giriniz", Icons.password), 
           kayitWidget(mail, "Lütfen  Mailinizi Girin", "Mail Adresinizi Giriniz", Icons.mail), 
           kayitWidget(adres, "Lütfen Adresinizi Yazınız", "Adressinizi Yazınız", Icons.home), 
           kayitWidget(cepno, "Lütfen Telefon Numaranızı  Girin", " Telefon Numaranızı Giriniz", Icons.numbers), 



//-------------------------DROPDOWN KISMI----------------------------------
           Padding(
            padding: EdgeInsets.only(left: 11, right: 22,bottom: 22, top: 11),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
                ),
                

                padding: EdgeInsets.only(left: 26, right: 7,top: 2),
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  hint: Padding(padding: EdgeInsets.only(left: 11),
                  child: Text("Cinsiyetinizi Seçiniz",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  ),

                  value: cinsiyet,
                  onChanged: (newvalue) => {
                    setState(() {
                      cinsiyet=newvalue.toString();
                    },),
                  },

                  items: listt.map((valueItem){
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(
                        valueItem,
                        style: TextStyle(color: Colors.black),
                      ),
                      );
                  },).toList(),

                  ),
            ),
            ), 
//-------------------------------------DROPDOWN BİTTİ---------------------------------------






                InkWell(
                onTap: () {
                 // Login(isimKontrolu.text, sifreKontrolu.text);
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
             child: Text("Kayıt Ol"),

          ),
         ),
        ),



        ],
      ),
    );
  }
}





Widget kayitWidget(String? deger,uyari, sonukyazi, IconData icon ){   // bir tane widget oluşturdum üstte verilerini gircem, 4 tane textformfiald oluşturmama gerek kalmadı
  return 
   Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved:(String? value){
                    deger=value;
                  },
                  validator: (String? value){
                    if(value!.isEmpty){
                      return uyari;

                    }else
                    return null;
                  },
                //  controller: isimKontrolu,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: sonukyazi,   //hint trext sönük yazıdır,
                    prefixIcon: Icon(icon),

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
              );


              


              
}