import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  late CollectionReference imgRef;
  var nameC = TextEditingController();
  var emailC = TextEditingController();
  var addressC = TextEditingController();
  var cityC = TextEditingController();
  var stateC = TextEditingController();
  var rentC = TextEditingController();
  var discriptionC = TextEditingController();
  var tcC = TextEditingController();
  var facilitiesC = TextEditingController();

  late String imageUrl;
  File ? singleImage;
  final singlepicker = ImagePicker();
  final multipicker = ImagePicker();
  List<XFile>? images=[];
  FirebaseStorage _storageRef = FirebaseStorage.instance;
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  String collectionName = "Room Details";
  List<String> _arrImageUrls = [];
  int uploadItem =0;
  bool _isUploading = false;
  List<String> imageUrls = <String>[];
  List<String> reference = <String>[];



  sendData()async{

    var value;
    await FirebaseFirestore.instance.collection("Room Details").doc(value.user?.uid).set({
      "name" : nameC.text,
      "email" : emailC.text,
      "address" : addressC.text,
      "city" : cityC.text,
      "state" : stateC.text,
      "price" : rentC.text,
      "img" : imageUrl,
      "discription" : discriptionC.text,
      "t&c" : tcC.text,
      "facilities" : facilitiesC.text,
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Room's Details"),
          backgroundColor: Colors.redAccent,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Form(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(20.0),
                      child: _isUploading ?showLoading (): Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(onTap: (){getSingleImage();},
                              child: singleImage == null ? Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey)
                                ),
                                width: 100,
                                height: 100,
                                child: Icon(Icons.add),) : Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  width: 100,
                                  height: 100,
                                  child: Image.file(singleImage!,fit: BoxFit.cover)
                              )
                          )
                        ],
                      ),),
                    Container(
                      height: 40,
                      width: 200,
                      child: Center(child: Text('Select Cover Image',style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87
                      ),)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: nameC,
                        decoration: InputDecoration(
                            border: OutlineInputBorder() , labelText: "Enter Owner's Name",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(

                                )
                            )
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: emailC,
                        decoration: InputDecoration(
                            border: OutlineInputBorder() , labelText: "Enter Email",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(

                                )
                            )
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: addressC,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),labelText: "Enter Address ",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            )
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: cityC,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),labelText: "Enter City",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                )
                            )
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: stateC,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),labelText: "Enter State ",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                )
                            )
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: rentC,
                        decoration: InputDecoration(
                            border: OutlineInputBorder() , labelText: "Enter Rent per months /-",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                )
                            )
                        ),
                      ),
                    ),
                    Divider(color: Colors.redAccent,height: 40,),
                    Container(
                      height: 40,
                      width: 150,
                      child: Center(child: Text('Select Images..',style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87
                      ),)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)
                          ),
                          width: 500,
                          height: 336,
                          child: Column(
                            children: [
                              Expanded(child: InkWell(
                                onTap: (){
                                  getMultiImage();
                                },
                                child: GridView.builder(
                                  itemCount:  images!.isEmpty ? 1 : images!.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1),
                                  itemBuilder: (context,index)=> Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                        )
                                    ),
                                    child:  images!.isEmpty ?Icon(Icons.add,
                                      color: Colors.grey.withOpacity(0.5),
                                    ):Image.file(File(images![index].path),fit: BoxFit.cover),
                                  ),
                                ),
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Center(
                      child: Text('Please enter the collage of room images , We are not able to store multiple images yet . We will fix this bug soon',style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),),
                    ),

                    SizedBox(height: 20,),
                    SizedBox(height: 100,
                      child: Divider(color: Colors.redAccent,height: 40,), ),
                    Center(
                      child: Text('Discription',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: discriptionC,
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        maxLength: 600,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),labelText: "Add Discription ",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                )
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 100,
                      child: Divider(color: Colors.redAccent,height: 40,), ),

                    Center(
                      child: Text('Terms & Conditions',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),

                    Padding(padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: tcC,
                        keyboardType: TextInputType.multiline,
                        maxLines: 30,
                        maxLength: 1000,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),labelText:'T&C',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                )
                            )
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    SizedBox(height: 100,
                      child: Divider(color: Colors.redAccent,height: 40,), ),

                    Center(
                      child: Text('Facitilies',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),

                    Padding(padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: facilitiesC,
                        keyboardType: TextInputType.multiline,
                        maxLines: 30,
                        maxLength: 600,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),labelText:'Facilities',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                )
                            )
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(onPressed: (){}, child: Text('Cancel')),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                            ),
                            onPressed: (){
                              if(images!.isNotEmpty){
                                uploadFunction(images!);
                                sendData();
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Select Images")));
                              }
                            }, child: Text('Submit'),),

                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
  Widget showLoading(){
    return Center(child: Column(
      children: [
        Text(("Uploading : " +uploadItem.toString()+"/"+images!.length.toString())),
        SizedBox(height: 30),
        CircularProgressIndicator()
      ],
    ),);
  }


  Future getSingleImage () async{
    final pickedImage = await singlepicker.getImage(source: (ImageSource.gallery));
    setState(() async {
      if(pickedImage != null){
        singleImage = File(pickedImage.path);
      }else{
        print("No Image Found..");
      }
    });
  }

  Future getMultiImage() async{
    final List<XFile> ? selectImages = await multipicker.pickMultiImage();
    setState(() {
      if(selectImages!.isNotEmpty){
        images!.addAll(selectImages);
      }
      else{
        print('No images Selected');
      }
    }
    );
  }




  void uploadFunction(List<XFile> images){
    setState(() {
      _isUploading==true;
    });
    for(int i=0 ; i<images.length;i++){
      var imageUrl = uploadFile(images[i]);
      _arrImageUrls.add(imageUrl.toString());

    }
  }



  Future <Object> uploadFile(XFile images )async{
    var uniqueKey = firestoreRef.collection(collectionName).doc();
    Reference reference1 = _storageRef.ref().child(uniqueKey.id);
    UploadTask uploadTask1 = reference1.putFile(File(singleImage!.path));
    Reference reference = _storageRef.ref().child("Room_Images").child(images.name);
    UploadTask uploadTask = reference.putFile(File(images.path));
    await uploadTask.whenComplete(() async {
      var uploadPath1 = (await uploadTask1.snapshot.ref.getDownloadURL());
      var uploadPath = (await uploadTask.snapshot.ref.getDownloadURL());
      firestoreRef.collection(collectionName).doc(uniqueKey.id).set({
        "name" : nameC.text,
        "email" : emailC.text,
        "address" : addressC.text,
        "city" : cityC.text,
        "state" : stateC.text,
        "price" : rentC.text,
        " img" : uploadPath,
        "cover img" : uploadPath1,
        "discription" : discriptionC.text,
        "t&c" : tcC.text,
        "facilities" : facilitiesC.text,
      });
      setState(() {
        uploadItem++;
        if(uploadItem==images.length){
          _isUploading = false;
          uploadItem =0;

        }
      });
    });
    return await  reference.getDownloadURL();
  }
}