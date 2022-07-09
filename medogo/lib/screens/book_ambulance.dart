import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/utilities/ambulance_card.dart';
import 'package:medogo/utilities/space.dart';

class BookAmbulance extends StatefulWidget {
  static String id = "BookAmbulance";
  const BookAmbulance({Key? key}): super(key: key);
  @override 
  _BookAmbulanceState createState() => _BookAmbulanceState();
}

class _BookAmbulanceState extends State<BookAmbulance> {
  List<String> locationOptions = ["Your Location", "Cooch Behar", "Alipurduar", "Falakata", "Dinhata"];
  String selectedLocation = "Your Location";  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
       appBar: AppBar(
        backgroundColor:kBackgroundLightColor,
        centerTitle: false,
        title: const Text("Ambulances", style: TextStyle(color: kPrimaryColor, fontSize: 22.0)),
        elevation: 10.0,
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.shield,
            size: 35.0)
          ),
          const AddSpace(horizontalSpace: 10.0),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.notifications,
            size: 35.0)
          ),
          const AddSpace(horizontalSpace: 10.0),
          InkWell(
            onTap: () {},
            child: const CircleAvatar(
              backgroundImage: AssetImage("images/user.jpg"),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget> [
              Container(
                              margin: const EdgeInsets.all(2.0),
                              padding: const EdgeInsets.all(15.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: kBackgroundLightColor,
                              ),
                              child: const Text("Select Location to Get List of Nearby Ambulances", style: TextStyle(color: kPrimaryColor, fontSize: 20.0),
                              textAlign: TextAlign.center,),
                            ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(15.0),
                          width: 180.0,
                          height: 52.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: kTextColor),
                            child: DropdownButton<String>(
                              value: selectedLocation,
                              icon: const Icon(Icons.arrow_drop_down, 
                              color: kSecondaryColor),
                              elevation: 20,
                              underline: Container(),
                              style: const TextStyle(color: kSecondaryColor, fontSize: 20.0),
                              borderRadius: BorderRadius.circular(5.0),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedLocation = newValue!;
                                  });
                                  },
                                  items: locationOptions.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value));
                                      }).toList())),
                                       ElevatedButton(
                        onPressed: () {
                        
                        },
                        style: ElevatedButton.styleFrom(
          fixedSize: const Size(320, 50),
          primary: kSecondaryColor,
          shape: const StadiumBorder()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget> [
                            Icon(FontAwesomeIcons.ambulance, color: kTextColor),
                            AddSpace(horizontalSpace: 15.0),
                            Text("View Nearby Ambulances", style: TextStyle(color: kTextColor, fontSize: 20.0)),
                          ],
                        ),
                      ),
           ],
         ),
         const AmbulanceCard(),
          const AmbulanceCard(),
           const AmbulanceCard(),
            const AmbulanceCard(),
             const AmbulanceCard(),
              const AmbulanceCard(),
               const AmbulanceCard(),
                const AmbulanceCard(),
                 const AmbulanceCard(),
                  const AmbulanceCard(),
                   const AmbulanceCard(),
                    const AmbulanceCard(),
        
        ],
      ),
      
    );
  }
}