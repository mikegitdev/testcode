import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tasker/app_text_style.dart';

class PhotoViewPage extends StatefulWidget {
  final int selectedImgIndex;

  final List<String> images;
  const PhotoViewPage(
      {Key? key, required this.selectedImgIndex, required this.images})
      : super(key: key);

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  final PageController controller = PageController();
  int selectedIndex = 0;
  int _progress = 0;
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("rostr",
            style: AppTextStyle.boldNormal.copyWith(
              fontSize: 16.sp,
              color: Colors.white,
            )),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert),
            // offset: const Offset(20, 40),
            position: PopupMenuPosition.under,
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Delete"),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("Upload Additional"),
              ),
            ],
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
      ),
      body: PageView.builder(
        itemBuilder: (context, position) {
          return SizedBox(
            child: PhotoView(
                minScale: PhotoViewComputedScale.contained,
                backgroundDecoration:
                    const BoxDecoration(color: Colors.transparent),
                imageProvider: NetworkImage(
                  widget.images[position],
                )),
          );
        },
        itemCount: widget.images.length, // Can be null
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        if (kDebugMode) {
          print("Deleted");
        }
        break;
      case 1:
        if (kDebugMode) {
          print("Upload Additional");
        }
        break;
    }
  }
}
