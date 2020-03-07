
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UploadImage{
 static var image;

getter(){
  return image;
}

hello(){
  print('the path is $image');
}

  
Future OpenGallery()async{
     print('gallery opened');
  
  File picture = await ImagePicker.pickImage(source: ImageSource.gallery);
  
  return picture;
 
}

 OpenCamera()async{
  
 File picture = await ImagePicker.pickImage(source: ImageSource.camera);
 
 image=picture;

}
}