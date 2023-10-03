import 'package:flutter/material.dart';
import 'package:ileriduzey/screens/home.dart';
import 'package:ileriduzey/screens/login.dart';
import 'package:ileriduzey/screens/register.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreen();
}

class _TabbarScreen extends State<TabbarScreen>
with TickerProviderStateMixin  {  
  
  TabController? tabController;
  @override

  
  void initState() {   //sayfa ilk açıldıgında gelecek ekrandır, bunu kullanmak için TickerProviderStateMixin' den miras aldık with ile
  tabController=TabController(length: 2, vsync: this); // 2 tane olmasını istedim , giriş ve kayıt ol diye
    super.initState();
  }

  


  @override
  Widget build(BuildContext context) {
    return SafeArea(   //safeare ile üstten boşluk biraktık
      child: Scaffold(
       // appBar: AppBar(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration( // en dıştaki gri kutunun dekorasyonu
                borderRadius: BorderRadius.circular(33),
                color: Color.fromARGB(255, 100, 98, 98),
              ),
              child: TabBar(
                padding: EdgeInsets.all(5),
             

                indicatorSize: TabBarIndicatorSize.tab, //indikator boyutunu ekran boyutunun yarısı kadar yap cunku 2 tane var
                unselectedLabelColor: Colors.black,
                labelColor:  Color.fromARGB(255, 5, 0, 2),

                indicator: BoxDecoration(                  //hangi tabbarın üzerine tıklarsan rengi kırmızı olur(indicator aracılığı ile)
                  color:  Color.fromARGB(255, 233, 43, 29),
                  borderRadius: BorderRadius.circular(33),
                  ),
                indicatorColor: Colors.black,

                controller: tabController,
                tabs:const [
                Tab( text:"Giriş"),
                Tab( text: "Kayıt ol"),
              ]),
            ),

            Expanded(child: TabBarView( 
              controller: tabController,             //kontol yapısını belirlemezsen nereye gideceğini bilmez!!
              children: [LoginScreen(),RegisterScreen() ], //giriş yap kısmına basarsan yönlendireceğin ekranı belirliyorsun, kayıt ol içinde aynısı
              ),
            )
          ],
        ),
      ),
    );
  }
}