import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tommaso Giovannini',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tommaso Giovannini'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;
  final tommasoKey = new GlobalKey();
  final projectsKey = new GlobalKey();
  final aboutKey = new GlobalKey();
  final contactKey = new GlobalKey();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget getColumn(title, text, linkWebsite, linkAppStore, linkGoogle) {

    return Container(
      height: 350,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

          SizedBox(height: 20,),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(text, style: TextStyle(fontSize: 16), maxLines: 10,),
           ),
          SizedBox(height: 20,),
          MaterialButton(
            color: Color(0xff3d52f3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: ()async {
              await canLaunch(linkWebsite) ? await launch(linkWebsite) : throw 'Could not launch $linkWebsite';
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Learn More >', style: TextStyle(color: Colors.white),),
            ),
          ),
          linkAppStore != '' ? Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: ()async{
                      await canLaunch(linkAppStore) ? await launch(linkAppStore) : throw 'Could not launch $linkAppStore';
                    },
                    child: Container(child: Image.asset('assets/appstore.png'), height: 50, width: 120,),
                  ),
                  MaterialButton(
                    onPressed: ()async{
                      await canLaunch(linkGoogle) ? await launch(linkGoogle) : throw 'Could not launch $linkGoogle';
                    },
                    child: Container(child: Image.asset('assets/google-play-badge.png'), height: 70, width: 145,),
                  ),

                ],
              ),
            ),
          ) : SizedBox(height: 20,),
        ],
      ),
    );

  }


  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Color(0xff2c37a3),
        appBar: AppBar(
            backgroundColor: Color(0xff2c37a3),
            actions: [
              MaterialButton(
                onPressed: (){
                  Scrollable.ensureVisible(widget.tommasoKey.currentContext);
                },
                child: Text('Tommaso Giovannini', style: TextStyle(fontSize: 13, color: Colors.white), textAlign: TextAlign.center,),
              ),
              MaterialButton(
                onPressed: (){
                  Scrollable.ensureVisible(widget.projectsKey.currentContext);
                },
                child: Text('Projects', style: TextStyle(fontSize: 13, color: Colors.white), textAlign: TextAlign.center,),
              ),
              MaterialButton(
                onPressed: (){
                  Scrollable.ensureVisible(widget.aboutKey.currentContext);
                },
                child: Text('About', style: TextStyle(fontSize: 13, color: Colors.white), textAlign: TextAlign.center,),
              ),
              MaterialButton(
                onPressed: (){
                  Scrollable.ensureVisible(widget.contactKey.currentContext);
                },
                child: Text('Contact', style: TextStyle(fontSize: 13, color: Colors.white), textAlign: TextAlign.center,),
              ),
            ]
        ),
        body: SingleChildScrollView(

            child: Column(
                  children: [
                    // Expanded(
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            key: widget.tommasoKey,
                            padding: const EdgeInsets.only(top: 80, bottom: 20),
                            child: Text('Tommaso Giovannini', style: TextStyle(color: Color(0xff3d52f3), fontSize: 70, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                          ),
                          Text('Young programmer with a passion for learning', style:
                          TextStyle(fontSize: 40), textAlign: TextAlign.center,),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 230.0,
                              child: Image.asset('assets/avataaars.png'),
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: FractionallySizedBox(
                        widthFactor: 0.85,
                        child: Container(
                          key: widget.projectsKey,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: Text('My Projects',

                                    textAlign: TextAlign.center, style: TextStyle(color: Color(0xff3d52f3), fontSize: 50, fontWeight: FontWeight.bold))),
                                SizedBox(height: 40,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [


                                    Text('Flutter Apps:', textAlign: TextAlign.left, style: TextStyle(color: Color(0xff3d52f3), fontSize: 35, fontWeight: FontWeight.bold)),

                                    SizedBox(height: 20,),
                                    Wrap(

                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      spacing: 20.0,
                                      runSpacing: 40.0,
                                      children: [
                                        getColumn('ConcentratedTomato Focus Timer', 'This was my first app. I made it during the first covid lockdown to help students keep focused working from home. It uses the pomodoro technique where you work for 25 minutes and then have a 5 minute break.', 'https://tommasogiovannini.wixsite.com/concentratedtomato', 'https://apps.apple.com/us/app/concentratedtomato-focus-timer/id1504771089?ls=1', 'https://play.google.com/store/apps/details?id=com.tommasogiovannini.concentratedtomato'),
                                        // SizedBox(width: 20,),
                                        getColumn('Revision Flashcards', 'I always use this app when studying now. It makes it fast and easy to create flashcards and keep track of your progress.', 'https://tommasogiovannini.wixsite.com/revisionflashcards', 'https://apps.apple.com/us/app/revision-flashcards/id1562363345', 'https://play.google.com/store/apps/details?id=com.tommasogiovannini.flashcards'),

                                        getColumn('QR Code Business Card', 'This app allows users to share contact details via a QR Code. In my opinion it is the most useful app I have made and I use it myself all the time. It is very convenient because it is extremely fast and easy to use. It also removes the chance of error while giving contact details.', 'https://tommasogiovannini.wixsite.com/qrbusinesscard', 'https://apps.apple.com/us/app/qr-code-business-card/id1563633717', 'https://play.google.com/store/apps/details?id=com.tommasogiovannini.qr_code_maker'),

                                        getColumn('Daily Habits Tracker', 'This app allows users to set daily habits and it keeps a streak of how many days in a row you have managed to complete your habits. There are a lot of similar apps out there but the main advantage of Daily Habits Tracker is its simplicity. I believe ease of use is one of the most important qualities for this type of app as people need to use it every day. There are also sound effects to keep users motivated and boost dopamine.', 'https://tommasogiovannini.wixsite.com/daily-habits-tracker', 'https://apps.apple.com/us/app/daily-habits-tracker/id1571038894', 'https://play.google.com/store/apps/details?id=com.tommasogiovannini.habittracker.daily_habit_tracker'),

                                        getColumn('BuzzMeApp', 'This is my latest app, it allows users to get notified when their order is ready so they don\'t have to wait in a queue. For example this would be very useful in takeaways or pharmacies where you might have to wait a long time for your order and could use this time to do other things. It is very simple to use and you just need to scan the store QR Code and enter your order number, no personal data required.', 'https://tommasogiovannini.wixsite.com/buzz-me-app', 'https://apps.apple.com/gb/app/buzzmeapp/id1580313186', 'https://play.google.com/store/apps/details?id=com.tommasogiovannini.buzzer'),
                                        getColumn('BuzzMeApp Business', 'This is the business version of BuzzMeApp which is what the store uses to notify the customers. It is very easy to set up as they only need to create an account and print the Store ID poster. Multiple employees can also connect to the same account and the business can customize the user experience by uploading their own images.', 'https://tommasogiovannini.wixsite.com/buzz-me-app/buzzmeapp-for-business', 'https://apps.apple.com/gb/app/buzzmeapp-business/id1584566965', 'https://play.google.com/store/apps/details?id=com.tommasogiovannini.buzzerbusiness'),

                                        Container(
                                          height: 420,
                                          width: 500,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Alexa Skills:', textAlign: TextAlign.left, style: TextStyle(color: Color(0xff3d52f3), fontSize: 35, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 20,),
                                              getColumn('New Year\'s Resolutions Tracker', 'Over the new year, I made an Alexa Skill, it was a very interesting project and I had the chance to learn some javascript and the basics of Natural Language Processing.', 'https://www.amazon.co.uk/Tommaso-Giovannini-Years-Resolutions-Tracker/dp/B08RY7N6GM', '', ''),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          height: 420,
                                          width: 500,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Unity Games:', textAlign: TextAlign.left, style: TextStyle(color: Color(0xff3d52f3), fontSize: 35, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 20,),
                                              getColumn('Crazy Ball Dash 3D', 'This was my first game with unity! Amazing experience, I learnt a lot about game designs and motion physics. I have always loved playing  video games and this was the first time I tried to make my own. It is a very simple game but it gave me a basic understanding of the Unity software and I hope to make more games in the future.', 'https://tommasogiovannini.wixsite.com/crazyballdash3d', 'https://apps.apple.com/us/app/crazy-ball-dash-3d/id1554273064', 'https://play.google.com/store/apps/details?id=com.TommasoGiovannini.CrazyBallDash3D'),

                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 420,
                                          width: 500,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Machine Learning:', textAlign: TextAlign.left, style: TextStyle(color: Color(0xff3d52f3), fontSize: 35, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 20,),
                                              getColumn('Kaggle', 'I have a taken part in some Kaggle competitions and have finished in the top 20% twice. This was probably one of the most challenging things I have done. I learnt a lot of high level maths, primarily statistics and I also got a chance to really delve into Python. I used Tensorflow and Keras to make the machine learning algorithms and it was a really rewarding project. Some models I trained from scratch while others I tweaked various existing models.', 'https://www.kaggle.com/tommasogiovannini', '', ''),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          height: 420,
                                          width: 500,
                                          child: Column(
                                            children: [
                                              Text('', textAlign: TextAlign.left, style: TextStyle(color: Color(0xff3d52f3), fontSize: 35, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 20,),
                                              getColumn('Arduino', 'I also tried to export my TensorFlow models to get it on an Arduino Nano 33 BLE. I followed the tiny ML book by Pete Warden. I went on various robots with Arduino after that.', '', '', ''),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    // SizedBox(height: 40,),
                                    // Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     children: [
                                    //       Flexible(child: getColumn('QR Code Business Card', 'This app allows users to share contact details via a QR Code. In my opinion it is the most useful app I have made and I use it myself all the time. It is very convenient because it is extremely fast and easy to use. It also removes the chance of error while giving contact details.', 'https://tommasogiovannini.wixsite.com/qrbusinesscard', 'https://apps.apple.com/us/app/qr-code-business-card/id1563633717', 'https://play.google.com/store/apps/details?id=com.tommasogiovannini.qr_code_maker'),),
                                    //       SizedBox(width: 20,),
                                    //       Flexible(child: getColumn('Daily Habits Tracker', 'This is my latest app, it allows users to set daily habits and it keeps a streak of how many days in a row you have managed to complete your habits. There are a lot of similar apps out there but the main advantage of Daily Habits Tracker is its simplicity. I believe ease of use is one of the most important qualities for this type of app as people need to use it every day. There are also sound effects to keep users motivated and boost dopamine.', 'https://tommasogiovannini.wixsite.com/daily-habits-tracker', 'https://apps.apple.com/us/app/daily-habits-tracker/id1571038894', 'https://play.google.com/store/apps/details?id=com.tommasogiovannini.habittracker.daily_habit_tracker'),),
                                    //     ]
                                    //
                                    // ),
                                    // SizedBox(height: 40,),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.start,
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //
                                    //
                                    //
                                    //
                                    //   ],
                                    // ),
                                    // SizedBox(height: 40,),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.start,
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 30),
                      child: Text('About me...', key: widget.aboutKey, style: TextStyle(

                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('I\'m a young flutter developer with an interest in machine learning and data science. \n I started programming 3 years ago and it is one of my favourite hobbies. It is always amazing to get to the end of a project, release it and see it being used all around the world. I also have a passion for physics, maths and pizza.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 30),
                      child: Text('My Skills:', style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ),

                    Wrap(
                      spacing: 20.0,
                      runSpacing: 40.0,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Color(0xFF42A5F5),
                          ),
                          width: 300,
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 50,),
                                Text('Flutter', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  // fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('I use flutter to build mobile apps, it is cross platform so I only need to write the code once.  Flutter uses the dart language and it is a really powerful development tool. ', style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
                                )
                              ],
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.black,
                          ),
                          width: 300,
                          height: 400,

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 50,),
                                Text('Unity', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  // fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('I use unity Unity to build video games. I love unity because it has a very visual interface and lots of plug ins. I use C# when coding in Unity.',  style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Color(0xff306998),
                          ),
                          width: 300,
                          height: 400,

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 50,),
                                Text('Python', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  // fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('I have worked a lot with Python from random projects in PyCharm to building neural networks on Kaggle.',  style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Color(0xffFF6F00),
                          ),
                          width: 300,
                          height: 400,

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 50,),
                                Text('Tensorflow', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  // fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('This is the framework I use to train my neural networks. It is great because it has tons of features and TensorBoard is very useful to see how your model is training.',  style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: FractionallySizedBox(
                      widthFactor: 0.85,
                      child: Container(

                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                      ),
                      child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      Text('Contact', key: widget.contactKey, textAlign: TextAlign.left, style: TextStyle(color: Color(0xff3d52f3), fontSize: 50, fontWeight: FontWeight.bold)),
                      SizedBox(height: 40,),
                      Text('Want to get in touch? Feel free to contact me at: \n tgtech06@gmail.com ', style: TextStyle(fontSize: 25),)
                      ],
                      ),),
                      ),
                    ),
                    ),

                    Container(
                      color: Color(0xff3d52f3),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Proudly created with Flutter', style: TextStyle(color: Colors.white),),
                            Text('©2022 Tommaso Giovannini', style: TextStyle(color: Colors.white),),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),

            ),);
  }
}
