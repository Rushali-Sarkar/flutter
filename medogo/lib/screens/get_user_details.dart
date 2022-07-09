import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:medogo/utilities/generate_button_text.dart';
import 'package:medogo/utilities/input_box.dart';
import 'package:medogo/utilities/space.dart';
import 'package:medogo/screens/home_screen.dart';
import 'dart:io';

class UserDetails extends StatefulWidget {
  static String id = "UserDetails";
  const UserDetails({Key? key}): super(key: key);
  @override 
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _getImage = TextEditingController();
   final _getFirstName = TextEditingController();
   final _getLastName = TextEditingController();
   final _firstNameKey = GlobalKey<FormState>();
   final _lastNameKey = GlobalKey<FormState>();

   File? image;
   
  @override 
  void dispose() {
    _getImage.dispose();
    _getFirstName.dispose();
    _getLastName.dispose();
    super.dispose();
  }
  Future<String> getPhoto(ImageSource source) async{
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return "No Image Selected";
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        });
        }
        on PlatformException catch (errorMessage) {
          return "Image Couldnot Be Selected: $errorMessage";
          } 
          return "Image Successfully Selected";
          }

  Widget bottomPanel() {
  return SizedBox(
    height: 150.0,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
      children:<Widget> [
        const Text("Select Your Profile Photo",
        style: TextStyle(fontSize: 25.0,
        color: kPrimaryColor),
        ),
        const AddSpace(verticalSpace: 20.0),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextButton.icon(onPressed: () {
          getPhoto(ImageSource.camera);
          }, 
           icon: const Icon(Icons.camera,
            color: kPrimaryColor,
            size: 40.0,), 
            label: const Text("Camera",
            style: TextStyle(fontSize: 20.0,
            color: kPrimaryColor),
            ),
            ),
            const AddSpace(horizontalSpace: 10.0),
            TextButton.icon(onPressed: () {
              getPhoto(ImageSource.gallery);
            }, 
            icon: const Icon(Icons.photo,
            color: kPrimaryColor,
            size: 40.0,), 
            label: const Text("Gallery",
            style: TextStyle(fontSize: 20.0,
            color: kPrimaryColor),
            ),
            ),
              ],
            ),
      ],
    ),
    ),
  );
}
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          children: <Widget> [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Center(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 200.0,
                          width: 200.0,
                          child: image == null? Image.asset("images/user.jpg",
                          fit: BoxFit.cover): 
                          Image.file(image!,
                          fit: BoxFit.cover),
                          ),
                        Positioned(
                          top: 150.0,
                          right: 130.0,
                          child: RawMaterialButton(
                                    onPressed: () {
                                            showModalBottomSheet(
                                context: context, 
                              builder: ((builder) => bottomPanel()),
                              );
                                    },
                                    elevation: 5.0,
                                    fillColor: Colors.white,
                                    child: const Icon(
                                    Icons.camera_enhance_rounded,
                                    size: 25.0,
                                    color: kPrimaryColor,
                                    ),
                                    shape: const CircleBorder(),
                                    )
                        ),

                        Positioned(
                          top: 150.0,
                          left: 130.0,
                          child: RawMaterialButton(
                                    onPressed: () {
                                            setState(() {
                                              image = null;
                                            });
                                    },
                                    elevation: 5.0,
                                    fillColor: Colors.white,
                                    child: const Icon(
                                    Icons.delete_rounded,
                                    size: 25.0,
                                    color: kPrimaryColor,
                                    ),
                                    shape: const CircleBorder(),
                                    )
                        ),
                      ],
                    ),
                  ),

                  const AddSpace(verticalSpace: 30.0),
                  Form(
                    key: _firstNameKey,
                    child: TextFormField(
                      style: kWhiteTextStyle,
                  cursorColor: kPrimaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a First Name";
                    }
                    return null;
                  },
                  decoration: getInputDecoration("Enter First Name", "First Name", "First Name Cannot be Empty", Icons.app_registration),
                  controller: _getFirstName
                ),
                  ),
                const AddSpace(verticalSpace: 30.0),
                Form(
                  key: _lastNameKey,
                  child: TextFormField(
                    style: kWhiteTextStyle,
                  cursorColor: kPrimaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Last Name";
                    }
                    return null;
                  },
                  decoration: getInputDecoration("Enter Last Name", "Last Name", "Last Name Cannot be Empty", Icons.app_registration),
                  controller: _getLastName,
                ),
                ),
                ],
              ),
                const AddSpace(verticalSpace: 20.0),
                TextButton(onPressed: () {
                  if (_firstNameKey.currentState!.validate() && _lastNameKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                  }
                   
                }, 
                child: generateButtonText("Login"),
                style: kButtonStyle,
                ),
          ],
        ),
      ),
    );
  }

}