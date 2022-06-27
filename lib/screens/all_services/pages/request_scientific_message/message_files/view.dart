import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/bacis_info/page/title.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/message_files/cubit/messages_input.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/new_order/cubit/new_order_cubit.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/alerts.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFieldToUploadFile.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizerUploadFile.dart';
import 'package:maktabat_alharam/screens/widgets/smallestButton.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/validator.dart';

// ignore: must_be_immutable
class MessageFilesScreen extends StatefulWidget {
  MessagesFilesInputData filesInputData;

  MessageFilesScreen(this.filesInputData, {Key? key}) : super(key: key);

  @override
  State<MessageFilesScreen> createState() => _MessageFilesScreenState();
}

class _MessageFilesScreenState extends State<MessageFilesScreen> {
  final formKey = GlobalKey<FormState>();

  final _firstController = TextEditingController();

  final _secoandController = TextEditingController();

  final _threeController = TextEditingController();

  final _forthController = TextEditingController();

  final _fiveController = TextEditingController();
  final _sixController = TextEditingController();

  final _sevenController = TextEditingController();
  final _eightController = TextEditingController();

  bool value = false;

  MessagesFilesInputData filesInputData = MessagesFilesInputData();

  @override
  void initState() {
    filesInputData = widget.filesInputData;
    print(filesInputData.toJson());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      appBar: customAppbar(
          icons: Icons.arrow_forward_outlined, isIcons: true, context: context),
      body: BlocProvider(
        create: (context) => NewOrderCubit(),
  child: BlocConsumer<NewOrderCubit, NewOrderState>(
  listener: (context, state) {
    if (state is NewOrderSuccess) {
      Alert.success("تم إضافة طلبك بنجاح");

      Get.offAll(() => const MyOrdersScientificMessage());
    } else if (state is NewOrderError) {
      Alert.error(state.msg.toString());
    }
  },
  builder: (context, state) {
    final cubit = BlocProvider.of<NewOrderCubit>(context);


    return Form(
        key: formKey,
        child: SizedBox(
          height: height,
          width: width,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  HeadTitle(
                    title: "DepositScientificThesis".tr,
                    subTitle: "filesMessageArrow".tr,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              buildContainer(
                height: height * 0.18,
                title: "fullMessage".tr,
                controller: _firstController,
                onPressed1: () {
                  _uploadFile(1);
                },
                validator: qValidator([
                  (widget.filesInputData.isThesisFileRequired == true)
                      ? IsRequired("thisFieldRequired".tr)
                      : IsOptional(),
                ]),
              ),
              buildContainer(
                height: height * 0.18,
                title: "messagesAddress".tr,
                controller: _secoandController,
                onPressed1: () {
                  _uploadFile(2);
                },
                validator: qValidator([
                  (widget.filesInputData.isThesisTitleFileRequired == true)
                      ? IsRequired("thisFieldRequired".tr)
                      : IsOptional(),
                ]),
              ),
              buildContainer(
                height: height * 0.18,
                title: "topicIndex".tr,
                controller: _threeController,
                onPressed1: () {
                  _uploadFile(3);
                },
                validator: qValidator([
                  (widget.filesInputData.isSubjectsIndexFileRequired == true)
                      ? IsRequired("thisFieldRequired".tr)
                      : IsOptional(),
                ]),
              ),
              buildContainer(
                height: height * 0.18,
                title: "arabicExtract".tr,
                controller: _forthController,
                onPressed1: () {
                  _uploadFile(4);
                },
                validator: qValidator([
                  (widget.filesInputData.isArabicExtractFileRequired == true)
                      ? IsRequired("thisFieldRequired".tr)
                      : IsOptional(),
                ]),
              ),
              buildContainer(
                height: height * 0.18,
                title: "englishExtract".tr,
                controller: _fiveController,
                onPressed1: () {
                  _uploadFile(5);
                },
                validator: qValidator([
                  (widget.filesInputData.isEnglishExtractFileRequired == true)
                      ? IsRequired("thisFieldRequired".tr)
                      : IsOptional(),
                ]),
              ),
              buildContainer(
                height: height * 0.18,
                title: "introduction".tr,
                controller: _sixController,
                onPressed1: () {
                  _uploadFile(6);
                },
                validator: qValidator([
                  (widget.filesInputData.isIntroFileRequired == true)
                      ? IsRequired("thisFieldRequired".tr)
                      : IsOptional(),
                ]),
              ),
              buildContainer(
                height: height * 0.18,
                title: "fullMessage".tr,
                controller: _sevenController,
                onPressed1: () {
                  _uploadFile(7);
                },
                validator: qValidator([
                  (widget.filesInputData.isCollectionFileRequired == true)
                      ? IsRequired("thisFieldRequired".tr)
                      : IsOptional(),
                ]),
              ),
              buildContainer(
                height: height * 0.18,
                title: "contentPlus".tr,
                controller: _eightController,
                onPressed1: () {
                  _uploadFile(8);
                },
                validator: qValidator([
                  (widget.filesInputData.isQuarterCollectionFileRequired ==
                          true)
                      ? IsRequired("thisFieldRequired".tr)
                      : IsOptional(),
                ]),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SmallestButton(
                      onPressed: () {
                        Get.back();
                        //  Get.to(()=> MyOrderMessageFilesScreen());
                      },
                      title: "previous".tr,
                      color: kPrimaryColor,
                      image: "assets/image/twoarrowleft.png",
                    ),
                    MediaButtonSizer(
                      onPressed: () {
                        print(widget.filesInputData.isThesisFileRequired);
                        print(widget.filesInputData.isThesisTitleFileRequired);
                        print(
                            widget.filesInputData.isSubjectsIndexFileRequired);
                        print(
                            widget.filesInputData.isArabicExtractFileRequired);
                        print(
                            widget.filesInputData.isEnglishExtractFileRequired);
                        print(widget.filesInputData.isIntroFileRequired);
                        print(widget.filesInputData.isCollectionFileRequired);
                        print(widget
                            .filesInputData.isQuarterCollectionFileRequired);
                        // if(formKey.currentState!.validate()){
                        //   Get.to(() => const MyOrdersScientificMessage());
                        // }
                        print(filesInputData.thesisTitleFile.toString()+ "رشااااااااااد");
                        if (widget.filesInputData.isThesisFileRequired ==
                                true &&
                            filesInputData.thesisFile == null) {
                          Alert.error("الرسالة بالكامل مطلوبة ");
                        } else if (widget
                                    .filesInputData.isThesisTitleFileRequired ==
                                true &&
                            filesInputData.thesisTitleFile == null) {
                          Alert.error("عنوان الرسالة  مطلوبة ");
                        } else if (widget.filesInputData
                                    .isSubjectsIndexFileRequired ==
                                true &&
                            filesInputData.subjectsIndexFile == null) {
                          Alert.error(" فهرس الموضوعات مطلوب");
                        } else if (widget.filesInputData
                                    .isArabicExtractFileRequired ==
                                true &&
                            filesInputData.arabicExtractFile == null) {
                          Alert.error("المستخاص العربي مطلوبة ");
                        } else if (widget.filesInputData
                                    .isEnglishExtractFileRequired ==
                                true &&
                            filesInputData.englishExtractFile == null) {
                          Alert.error("المستخلص الإنجليزي مطلوبة ");
                        } else if (widget.filesInputData.isIntroFileRequired ==
                                true &&
                            filesInputData.introFile == null) {
                          Alert.error("المقدمة مطلوبة ");
                        } else if (widget
                                    .filesInputData.isCollectionFileRequired ==
                                true &&
                            filesInputData.collectionFile == null) {
                          Alert.error(" العنوان + فهرس الموضوعات + المستخلص العربي والإنجليزي + المقدمة");
                        } else if (widget.filesInputData
                                    .isQuarterCollectionFileRequired ==
                                true &&
                            filesInputData.quarterCollectionFile == null) {
                          Alert.error("العنوان + فهرس الموضوعات + المستخلص العربي والإنجليزي + المقدمة + 25% من الرسالة ");
                        } else {
                        cubit.sendMessagesResearchData(filesInputData: filesInputData);
                        }
                      },
                      title: "requestService".tr,
                      color: kPrimaryColor,
                      image: "assets/image/rightsah.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  },
),
),
    );
  }

  dynamic video;
  File? _file1;
  File? _file2;
  File? _file3;
  File? _file4;
  File? _file5;
  File? _file6;
  File? _file7;
  File? _file8;

  void _uploadFile(int step) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );

    if (result != null) {
      File? file = File(result.files.single.path!);

      log("-=-=-=-=- selected file is => ${file.toString()}");
      setState(() {
        if (step == 1) {
          _file1 = file;
          filesInputData.thesisFile = file;

          _firstController.text = file.path;
        } else if (step == 2) {
          _file2 = file;
          filesInputData.thesisTitleFile = file;
          _secoandController.text = file.path;
        } else if (step == 3) {
          _file3 = file;

          filesInputData.subjectsIndexFile = file;
          _threeController.text = file.path;
        } else if (step == 4) {
          _file4 = file;
          filesInputData.arabicExtractFile = file;
          _forthController.text = file.path;
        } else if (step == 5) {
          _file5 = file;
          filesInputData.englishExtractFile = file;
          _fiveController.text = file.path;
        } else if (step == 6) {
          _file6 = file;
          filesInputData.introFile = file;
          _sixController.text = file.path;
        } else if (step == 7) {
          _file7 = file;
          filesInputData.collectionFile = file;
          _sevenController.text = file.path;
        } else if (step == 8) {
          _file8 = file;
          filesInputData.quarterCollectionFile = file;
          _eightController.text = file.path;
        } else {
          log("NOT Catch ONE SORRY FOR THAT .... TRY AGAIN");
        }
      });
    } else {
      // User canceled the picker
    }
  }

  Container buildContainer({
    required double height,
    required String title,
    required dynamic validator,
    required TextEditingController controller,
    required VoidCallback onPressed1,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kCardBorder)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 4.00,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: kPrimaryColor,
                    fontFamily: "DinBold",
                  ),
                ),
              ),
              CustomTextFieldUploadFile(
                controller: controller,
                validator: validator,
                type: TextInputType.text,
              ),
            ],
          ),
          SmallButtonSizerUploadFile(
            title: "filSelection".tr,
            onPressed: onPressed1,
            color: kSmallIconColor,
            image: "assets/image/uploadup.png",
          ),
        ],
      ),
    );
  }
}
