import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager_app/core/di/di.dart';
import 'package:task_manager_app/core/local_storage/shared_prefrence_helper.dart';
import 'package:task_manager_app/core/reusable_components/dialog.dart';
import 'package:task_manager_app/presentation/screens/auth_screen/login_screen.dart';
import 'package:task_manager_app/presentation/screens/home_screen/view_models/gallery_view_model.dart';
import 'package:task_manager_app/presentation/screens/home_screen/view_models/upload_view_model.dart';
import 'package:task_manager_app/presentation/screens/home_screen/widgets/gridview_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String route = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImageFromGallery() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = image;
    });
  }

  Future<void> _captureImageFromCamera() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = image;
    });
  }

  Future<void> _uploadImage(String token, XFile imageFile) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
    });

    BlocProvider.of<UploadViewModel>(context).upload(token: token, image: formData);
  }

  bool visible = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          visible = false;
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/genral_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children:[
              BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: REdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              "Welcome\n${PrefsHelper.getUserName()}",
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                color: Theme.of(context).colorScheme.scrim,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: const AssetImage("assets/img/Ellipse 1641.png"),
                            radius: 45.r,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: REdgeInsets.only(left: 45, right: 45, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              DialogUtil.showMessageDialog(context: context, message: "are you sure you want to logout", oneButtonDialog: false,onOkPressed: () {
                                PrefsHelper.clearToken();
                                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route, (route) => false);
                              },);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: REdgeInsets.only(right: 20, left: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                              ),
                              fixedSize: Size(135.w, 50.h),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 25.w,
                                      height: 22.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffC83B3B),
                                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      "assets/svg/Vector.svg",
                                      width: 8.w,
                                      height: 9.h,
                                    ),
                                  ],
                                ),
                                Text(
                                  "log out",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.scrim,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: REdgeInsets.only(right: 20, left: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                              ),
                              fixedSize: Size(135.w, 50.h),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/Group 14.svg",
                                  height: 24.h,
                                  width: 25.w,
                                ),
                                Text(
                                  "upload",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.scrim,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  BlocProvider.value(
                    value:  getIt<GalleryViewModel>()..getGallery(PrefsHelper.getToken()),

                    child: BlocBuilder<GalleryViewModel, GalleryState>(
                      builder: (context, state) {
                        if (state is GalleryErrorState) {
                          return SliverToBoxAdapter(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.refresh,
                                color: Theme.of(context).colorScheme.primary,
                                size: 100.sp,
                              ),
                            ),
                          );
                        }
                        if (state is GallerySuccessState) {
                          List<String>? images = state.galleryEntity?.data!.images;
                          return SliverPadding(
                            padding: REdgeInsets.all(24),
                            sliver: SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 24.w,
                                mainAxisSpacing: 24.h,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                    (context, index) => GridViewItem(image: images![index]),
                                childCount: images?.length,
                              ),
                            ),
                          );
                        }
                        return  SliverToBoxAdapter(
                          child: SizedBox(
                            height: 300.h,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
              BlocProvider(
                create: (context) => getIt<UploadViewModel>(),
                child: Visibility(
                  visible: visible,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Adjust sigma values as needed
                      child: Container(
                        width: 290.w,
                        height: 345.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        child: Padding(
                          padding: REdgeInsets.all(65.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  final image = await _imagePicker.pickImage(source: ImageSource.gallery);
                                  if (image != null) {
                                    setState(() {
                                      _pickedImage = XFile(image.path);
                                    });
                                    _uploadImage(PrefsHelper.getToken(), _pickedImage!);
                                    setState(() {
                                      visible = !visible;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffEFD8F9),
                                  padding: REdgeInsets.only(right: 20, left: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                                  ),
                                  fixedSize: Size(double.maxFinite, 60.h),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/img/gallery.png",
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    Text(
                                      "Gallery",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.scrim,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 44.h,),
                              ElevatedButton(
                                onPressed: () {
                                  _captureImageFromCamera();
                                  setState(() {
                                    visible = !visible;
                
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffEBF6FF),
                                  padding: REdgeInsets.only(right: 20, left: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                                  ),
                                  fixedSize: Size(double.maxFinite, 60.h),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/img/3.png",
                                      height: 40.h,
                                      width: 40.w,
                                    ),
                                    Text(
                                      "Camera",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.scrim,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
         ] ),
        ),
      ),
    );
  }
}
