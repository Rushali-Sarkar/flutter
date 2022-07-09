import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/screens/book_ambulance.dart';
import 'package:medogo/screens/specialist_doctors.dart';
import 'package:medogo/utilities/space.dart';
import 'package:medogo/utilities/navigation_button.dart';
import 'package:medogo/utilities/sliver_space_vertical.dart';
import 'package:medogo/utilities/category_card.dart';
import 'package:medogo/screens/blood_bank.dart';
import 'package:medogo/utilities/featured_doctor_card.dart';
import 'package:medogo/utilities/problems_card.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  const HomeScreen({Key? key}): super(key: key);
  @override 
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<String> locationOptions = ["Your Location", "Cooch Behar", "Alipurduar", "Falakata", "Dinhata"];
  String selectedLocation = "Your Location";

  @override 
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:kBackgroundLightColor,
        elevation: 10.0,
        leading: InkWell(
          onTap: () {},
          child: const Icon(FontAwesomeIcons.bars)
        ),
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
            const SliverSpaceVertical(verticalSpace: 100.0),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 900.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 5.0),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Center(
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(5.0),
                        children: <Widget> [
                          NavigationButton(backgroundColor: kPrimaryColor, route: HomeScreen.id, name: "Home"),
                          const AddSpace(horizontalSpace: 10.0),
                          NavigationButton(backgroundColor: kBackgroundLightColor, route: HomeScreen.id, name: "Read"),
                          ]));
                          },
                          childCount: 1)),

                          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.5,
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
                              child: const Text("Select a Location to view Doctors", style: TextStyle(color: kPrimaryColor, fontSize: 20.0)),
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
          fixedSize: const Size(300, 50),
          primary: kPrimaryColor,
          shape: const StadiumBorder()),
                        child: const Text("View Doctors", style: TextStyle(color: kTextColor, fontSize: 20.0)),
                      ),
                                      ],
                      );
                    },
                    childCount: 1)),
                      SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.45),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Center(
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(5.0),
                        children: <Widget> [
                          CategoryCard(image: "specialist.jpg", categoryName: "Specialist Doctors", route: SpecialistDoctors.id),
                          CategoryCard(image: "ambulance.jpg", categoryName: "Book Ambulance", route: BookAmbulance.id),
                          CategoryCard(image: "hospital.jpg", categoryName: "Hospitals", route: BloodBank.id),
                          CategoryCard(image: "firstaid.jpg", categoryName: "First Aid", route: BloodBank.id),
                          CategoryCard(image: "clinic.jpg", categoryName: "Clinics", route: HomeScreen.id),
                          CategoryCard(image: "pathologylab.jpg", categoryName: "Pathology Labs", route: HomeScreen.id),
                          CategoryCard(image: "bloodbank.jpg", categoryName: "Blood Banks", route: BloodBank.id),
                          ]));
                          },
                          childCount: 1)),
                          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3.0,
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
                              child: const Text("Our Featured Doctors", style: TextStyle(color: kPrimaryColor, fontSize: 20.0)),
                            ),
                                      ],
                      );
                    },
                    childCount: 1)),
                     SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.3,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListView(
                       shrinkWrap: true,
                       padding: const EdgeInsets.all(10.0),
                       scrollDirection: Axis.horizontal,
                        children: const <Widget> [
                          FeaturedDoctorCard(doctorName: "Dr. Doctor Name One", doctorRating: 4.3, doctorimage: "doctor1.jpg"),
                           FeaturedDoctorCard(doctorName: "Dr. Doctor Name Two", doctorRating: 4.3, doctorimage: "doctor2.jpg"), 
                            FeaturedDoctorCard(doctorName: "Dr. Doctor Name Three", doctorRating: 4.4, doctorimage: "doctor3.jpg"), 
                             FeaturedDoctorCard(doctorName: "Dr. Doctor Name Four", doctorRating: 4.5, doctorimage: "doctor4.jpg"), 
                              FeaturedDoctorCard(doctorName: "Dr. Doctor Name Five", doctorRating: 4.5, doctorimage: "doctor5.jpg"),  
                                      ],
                      );
                    },
                    childCount: 1)),
                    SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(15.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: kBackgroundLightColor,
                              ),
                              child: const Text("Sufferring from any of these Problems ?", style: TextStyle(color: kPrimaryColor, fontSize: 20.0),
                              textAlign: TextAlign.center,),
                            ),
                                      ],
                      );
                    },
                    childCount: 1)),
                        SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListView(
                       shrinkWrap: true,
                       padding: const EdgeInsets.all(10.0),
                       scrollDirection: Axis.horizontal,
                        children: const <Widget> [
                        ProblemCard(image: "acne.jpg", problem: "Acne"),
                         ProblemCard(image: "acidity.jpg", problem: "Acidity"),
                          ProblemCard(image: "allergy.jpg", problem: "Allergy"),
                           ProblemCard(image: "commoncold.jpg", problem: "Common Cold"),
                            ProblemCard(image: "pimples.jpg", problem: "Pimples"),

                        ],
                      );
                    },
                    childCount: 1)),
                    SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                           ElevatedButton(
                               onPressed: () {
                                 Navigator.pushNamed(context, SpecialistDoctors.id);
                               },
                                 style: ElevatedButton.styleFrom(
                                   fixedSize: const Size(300, 70),
                                   primary: kSecondaryColor),
                                   child: const Text("Book our Subject Matter Specialists Today!", style: TextStyle(color: kTextColor, fontSize: 20.0), textAlign: TextAlign.center,)),
                                      ],
                      );
                    },
                    childCount: 1)),


 
                          ]));
  }
}





