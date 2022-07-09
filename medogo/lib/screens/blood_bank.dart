import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/screens/blood_bank_form.dart';
import 'package:medogo/utilities/space.dart';

class BloodBank extends StatefulWidget {
  static String id = "BloodBank";
  const BloodBank({Key? key}): super(key: key);
  @override 
  _BloodBankState createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> {
  List<String> locationOptions = ["Your Location", "Cooch Behar", "Alipurduar", "Falakata", "Dinhata"];
  String selectedLocation = "Your Location";
  List <String> images = ["images/apositive.jpg", "images/anegative.jpg", "images/bpositive.jpg", "images/bnegative.jpg", "images/opositive.jpg", "images/onegative.jpg", "images/abpositive.jpg", "images/abnegative.jpg"];
  List <String> bloodgroups = ["apositive", "anegative", "bpositive", "bnegative", "opositive", "onegative", "abpositive", "abnegative"];
  String selectedBloodGroup = "apositive";
  List <String> availabilites = ["2", "3", "4", "8", "1", "14", "10", "5"];
  final String availability = " availability";

  List<String> bloodGroupOptions = ["A+ve", "A-ve", "B+ve", "B-ve", "O+ve", "O-ve", "AB+ve", "AB-ve"];
  String requestedBloodGroup = "A+ve";


  List<String> extraImages = ["images/knowmore.jpg", "images/blooddonation.jpg"];
  List<String> information = ["Why to Donate Blood ?", "Ready to Donate Blood ?"];
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor:kBackgroundLightColor,
        centerTitle: false,
        title: const Text("Blood Banks", style: TextStyle(color: kPrimaryColor, fontSize: 22.0)),
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
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.6,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
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
                              child: const Text("Blood Availability at", style: TextStyle(color: kPrimaryColor, fontSize: 20.0)),
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
                                        Container(
                              margin: const EdgeInsets.all(2.0),
                              padding: const EdgeInsets.all(15.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: kBackgroundLightColor,
                              ),
                              child: const Text("Send a Request For", style: TextStyle(color: kPrimaryColor, fontSize: 20.0)),
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget> [
                            Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(15.0),
                          width: 115.0,
                          height: 52.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: kTextColor),
                            child: DropdownButton<String>(
                              value: requestedBloodGroup,
                              icon: const Icon(Icons.arrow_drop_down, 
                              color: kSecondaryColor),
                              elevation: 20,
                              underline: Container(),
                              style: const TextStyle(color: kSecondaryColor, fontSize: 20.0),
                              borderRadius: BorderRadius.circular(5.0),
                              onChanged: (String? newValue) {
                                setState(() {
                                  requestedBloodGroup= newValue!;
                                  });
                                  },
                                  items: bloodGroupOptions.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value));
                                      }).toList())),
                                        Container(
                              margin: const EdgeInsets.all(2.0),
                              padding: const EdgeInsets.all(15.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: kBackgroundLightColor,
                              ),
                              child: const Text("Blood Group", style: TextStyle(color: kPrimaryColor, fontSize: 20.0)),
                            ),
                          ],
                        ),
                              const AddSpace(verticalSpace: 10.0),        
                      ElevatedButton(
                        onPressed: () {
                           Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => BloodBankRequestForm(bloodGroup: requestedBloodGroup, selectedLocation: selectedLocation,)));
                        },
                        style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 50),
          primary: kPrimaryColor,
          shape: const StadiumBorder()),
                        child: const Text("Submit", style: TextStyle(color: kTextColor, fontSize: 20.0)),
                      ),
                      const AddSpace(verticalSpace: 10.0),       
                          Container(
                            height: 220.0,
                            width: 400.0,
                            alignment: Alignment.center,
                             margin: const EdgeInsets.all(10.0),
                             padding: const EdgeInsets.all(0.0),
                             decoration: const BoxDecoration(
                               color: kSecondaryColor,
                               borderRadius: BorderRadius.all(Radius.circular(10.0))
                             ),
                            child: Padding(
                               padding: const EdgeInsets.all(10.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               
                               children: <Widget> [
                                 const Text("In Case of any Emergencies Please Click Below to Call at Our", style: TextStyle(color: kTextColor, fontSize: 20.0),
                                 textAlign: TextAlign.center,),
                                 const AddSpace(verticalSpace: 10.0),
                                  
                                 ElevatedButton(
                        onPressed: () {
                        
                        },
                        style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 50),
          primary: kErrorColor,
          shape: const StadiumBorder()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget> [
                            Icon(Icons.phone, color: kTextColor),
                            Text("Help Desk Number", style: TextStyle(color: kTextColor, fontSize: 20.0)),
                          ],
                        ),
                      ),
                      const AddSpace(verticalSpace: 10.0),
                             const Text("and We will Help You to Arrange Blood as Soon as Possible", style: TextStyle(color: kTextColor, fontSize: 20.0),
                             textAlign: TextAlign.center,),
                               ],
                             ),
                            ),
                           ),
                          

                                      ],
                      );
                    },
                    childCount: 1)),
                    SliverGrid(
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200.0,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: 1.0,
  ),
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedBloodGroup = bloodgroups[index];
          });
        },
        child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(images[index])),
          color: kBackgroundColor,
        ),
        child: Text(availabilites[index] + availability, style: const TextStyle(color: kPrimaryColor, fontSize: 20.0)),
      ),
      );
    },
    childCount: 8,
  ),
),
                    
                     SliverGrid(
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 800.0,
    mainAxisSpacing: 0.0,
    crossAxisSpacing: 0.0,
    childAspectRatio: 2.0,
  ),
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedBloodGroup = bloodgroups[index];
          });
        },
        child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(extraImages[index])),
          color: kBackgroundLightColor,
        ),
        child: Text(information[index], style: const TextStyle(color: kSecondaryColor, fontSize: 20.0)),
      ),
      );
    },
    childCount: 2,
  ),
),
        ],
      ),
      );
  }
}