import 'package:flutter/material.dart';
import 'package:ileriduzey/screens/home.dart';
import 'package:ileriduzey/screens/profil.dart';
import 'package:ileriduzey/screens/search.dart';

class AnaScreen extends StatefulWidget {
  const AnaScreen({super.key});

  @override
  State<AnaScreen> createState() => _AnaScreenState();
}

class _AnaScreenState extends State<AnaScreen> {
  int selectedIndex=0;

  void onTap(tikladigim){  //metod
    setState(() {
      selectedIndex=tikladigim;
    });
  }

  List ekranlarimiz=[   // en altta bottomNavigationBar var onu sayfaya sabıtlemek için burayı yazdık, 
    const HomeScreen(),
    const SearchScreen(),
    const ProfilScreen(),
  ];


  void initState(){           //başlangıcta nerde olduğumuzu görmek için verdik
    super.initState();
    onTap(selectedIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // appBar: AppBar(backgroundColor: Colors.grey,toolbarHeight: 55),
      body: ekranlarimiz[selectedIndex],  //seçilen indexteki sayfayı getir

      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 215, 213, 213),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,  //seçilen index rengi
        selectedFontSize: 15,
        showSelectedLabels: true,           //seçili olan labelin yazısı görünsün
        showUnselectedLabels: false,        //seçili olmayan labelin yazısı görünmesin

        items:  <BottomNavigationBarItem>[

        
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Arama Sayfası "),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil Sayfası "),
    
      ],

         currentIndex:selectedIndex,  //doğrulanan indexi, seçilene ata
         onTap: onTap,
      ),
      
    
    );
  }
}