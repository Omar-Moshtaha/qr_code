import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class AccessInternalStorageFile extends StatefulWidget {
  @override
  State<AccessInternalStorageFile> createState() => _AccessInternalStorageFileState();
}

class _AccessInternalStorageFileState extends State<AccessInternalStorageFile> {
File ?image;
  final imagePicker=ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(color: Colors.blue,width: double.infinity,child: MaterialButton(height: 50,onPressed: ()async{
                setState(() {
                  createFolderInAppDocDir("omar");
                  getDir();
                });
              },child:  const Text("Select Image",style: TextStyle(color: Colors.white),),)),
            )),
const SizedBox(height: 20,),
_folders?.length!=0?
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: GridView.count(shrinkWrap: true,physics: const BouncingScrollPhysics(),crossAxisCount: 2,crossAxisSpacing: 5,mainAxisSpacing: 5,children: List.generate(_folders?.length??0, (index) => Container(decoration: BoxDecoration(
      color: Colors.blue,

borderRadius: BorderRadius.circular(5)
    ),width: 50,child: Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(onTap: ()async{
          await _folders?[index].delete();

        },child: const Align(alignment: Alignment.topRight,child: Padding(
          padding:  EdgeInsets.all(10),
          child: Icon(Icons.delete,color: Colors.white,),
        ))),

        Text("${_folders?[index].parent}",style: const TextStyle(
color: Colors.white,
        ),textAlign:TextAlign.center ,),
      ],
    )),)),),
  ):Container()

          ],
        ),
      ),
    );
  }
  List<FileSystemEntity> ?_folders;

Future<String> createFolderInAppDocDir(String folderName) async {
  //Get this App Document Directory

  final Directory appDocDir = await getApplicationDocumentsDirectory();
  //App Document Directory + folder name
  final Directory appDocDirFolder =
  Directory('${appDocDir.path}/$folderName/');

  if (await appDocDirFolder.exists()) {
    //if folder already exists return path
    return appDocDirFolder.path;
  } else {
    //if folder not exists create folder and then return its path
    final Directory appDocDirNewFolder =
    await appDocDirFolder.create(recursive: true);
    return appDocDirNewFolder.path;
  }
}
Future<void> getDir() async {
  final directory = await getApplicationDocumentsDirectory();
  final dir = directory.path;
  String pdfDirectory = '$dir/';
  final myDir = Directory(pdfDirectory);
  setState(() {
    _folders = myDir.listSync(recursive: true, followLinks: false);
  });
  print(_folders?.length);
}

}
