import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List mesajBildirimi=["Merhaba","Bildiri","Gönderdim"];   // 3 parametrem olduğu için mesaj sayısı 3 olarak gorunecektır

  List<Map <String, dynamic>> resim=[
    {"image": "assets/kalp.jpeg", "text": "Busra"},
    {"image": "assets/resim.jpeg", "text": "Esra"},
    {"image": "assets/kalp.jpeg", "text": "Seyma"},
    {"image": "assets/rr.jpeg", "text": "Emre"},
    {"image": "assets/resim.jpeg", "text": "Pelşin"},
    {"image": "assets/rr.jpeg", "text": "Serkan"},
    {"image": "assets/resim.jpeg", "text": "Furkan"},
    {"image": "assets/resim.jpeg", "text": "Mustafa"},
    {"image": "assets/kalp.jpeg", "text": "Harun"},
    {"image": "assets/rr.jpeg", "text": "Mehmet"}
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,  //appbardaki geri ok işaretini pasif ettik
        title:Text("𝓘𝓷𝓼𝓽𝓪𝓰𝓻𝓪𝓶",        //leading, title, actions: appbar kısmındaki yapı sırasıyla yani sğdan sola 
        style: TextStyle(
          fontSize: 33, 
          fontStyle: FontStyle.normal,
           fontWeight: FontWeight.w500),
           ),
      


         actions: [       // sayfanın en sağı actions, ikonlar var ,favori ve mesaj
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.favorite),
          ),


          Stack(                //stack: üst üste yığar, üstüne mesaj sayısını göstermek için stack kullandık
            children:[
               Padding(
              padding:  EdgeInsets.all(8.0),
              child: Icon(Icons.maps_ugc),
            ),


         mesajBildirimi== null  // Bu taraf if kısmı. <mesaj sayısını dinamik olarak çekiyoruz>
         ? Container()          // eger null ise container dön değilse position döndür


         :  Positioned(    //mesaj ikonunun üzerine gelen kırmızı bildirimi dinamik olarak gösterir, listin uzunluğu kadar
            right: -1,
              child: CircleAvatar(   
                backgroundColor: Colors.red, 
                radius: 8,
                
                child: Text(mesajBildirimi.length.toString(), //mesaj sayısını dinamik olarak en üstteki listeden çekiyoruz
                style: TextStyle(fontSize: 11),
                ),
                ),
            ),
            ],
          ),
         ],
      ),



      body:ListView(  //hikaye kısmı
          children: [
            Container(
              
              height: 111,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,  //yatayda sırala scroll etsın
                itemCount:resim.length, 
                itemBuilder:(context, index){


                  return  Padding(
                    padding:  EdgeInsets.all(9.0),
                    child:  Column(
                      children: [
                        CircleAvatar(  //hıkaye kısmındaki yuvarlak resimlerde kullandım
                          radius: 33,
                          backgroundImage: AssetImage(resim[index]["image"]),  // en üstte resim map i tanımlandı burada kullanıldı
                          // backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                          //child: Image.network("https://picsum.photos/200/300"),
                        ),
                        Text(resim[index]["text"])
                      ],
                    ),
                  );
              },
               ),
            ),
          




           ListView.builder(                   
            shrinkWrap: true,            //boyutu widgetin boyu kadar yapar ve yerleşir, container ve boyut vermeye gerek kalmadı
           physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: resim.length,
              itemBuilder:(context, index) {

              return Card(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      focusColor: Colors.white,
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(resim[index]["image"]), //postun kime ait olduğunu gösteren profil resimi ve buna karsılık gelen, paylaştığı postun resmi
                        ),
                    
                      title: Text(resim[index]["text"]),
                      trailing: Icon(Icons.three_k),  //sağ üstteki 3k ikonu
                    ),

                    Image.asset(resim[index]["image"],  //postun yer aldığı büyük resim
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                      ),
                      

                 
                 
                      Row(               //postun altındaki 4 ikon için iç içe row kullandık (favori,mesaj,gonder ve kaydet)
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                              children: [
                              Icon(Icons.favorite),
                              Icon(Icons.chat),




                              IconButton(onPressed: (){  //gönder ikonuna buton ekledık, basınca sayfanın yarısı kadar açılsın dedık ve özelleştirdik aşağıda
                                showModalBottomSheet(
                                  context: context,
                                 builder: (context){
                                  return Container(
                                    child: Column(
                                      children: [

                                        Container(
                                          padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.all(11),
                                          height: 40,
                                          child: SearchBar(hintText: "Ara", 
                                          elevation: MaterialStateProperty.all(5.0),
                                          backgroundColor: MaterialStateProperty.all( Color.fromARGB(255, 192, 189, 189)),   // gönder ikonuna tıklayınca acılan listenin en üstüne arama kısmını ekliyoruz.
                                          leading: Icon(Icons.search),
                                        
                                          shape:MaterialStateProperty.all(  // decorationa benzer border vs.. kullancaz
                                            ContinuousRectangleBorder(
                                              borderRadius: BorderRadius.circular(55),
                                              
                                            ),
                                          ), 
                                          ),
                                        ),     
                                        Expanded(                         
                                          child: ListView.builder(               //alta alta sıralamak için listview kullanılır, eğer ekrana gelmiyorsa boyut vermemişsindir , expanded ile sarmala!!
                                            itemCount: resim.length,
                                            itemBuilder: (context, index){
                                        
                                            return ListTile(   
                                              leading: CircleAvatar(
                                                radius: 22,
                                                backgroundImage: AssetImage(resim[index]["image"]),),
                                              title: Text(resim[index]["text"]),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  );
                                 },
                                 );
                              },
                              icon: Icon(Icons.near_me, // bu ikona tıklanma öz. verdik gönder ikonu
                              color: Colors.black,),
                              ),
                              ],
                              ),
                            ),
                          ),

                           Padding(
                             padding: const EdgeInsets.only(right: 11),  //kaydet ikonunun sağdan konumu
                             child: Icon(Icons.bookmark),
                           ),

                        ],
                      ),
                  ],
                ),
              );
            },),
          
          ],
          ),   
      );
    
  }
}