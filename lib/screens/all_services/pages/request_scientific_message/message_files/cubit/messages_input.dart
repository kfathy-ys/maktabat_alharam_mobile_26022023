import 'dart:io';

import 'package:dio/dio.dart';
import 'package:queen/core/helpers/prefs.dart';

class MessagesFilesInputData {
  File? thesisFile,
      thesisTitleFile,
      subjectsIndexFile,
      arabicExtractFile,
      englishExtractFile,
      introFile,
      collectionFile,
      quarterCollectionFile;

  bool ? isThesisFileRequired,
      isThesisTitleFileRequired,
      isSubjectsIndexFileRequired,
      isArabicExtractFileRequired,
      isEnglishExtractFileRequired,
      isIntroFileRequired,
      isCollectionFileRequired,
      isQuarterCollectionFileRequired;
bool ? isAvailable , isAvailableWithChains , availabilityType;


  String? userName,
      email,
      phoneNumber,
      department,
      faculty,
      thesisData,
      thesisTitle,
      scientificDegree,

   universityId, yearOfDiscussion, numberOfPages, numberOfParts;

  final userId = Prefs.getString("userId");

  Map<String, dynamic> toJson() {
    return {
      "applicantName": userName,
      "email": email,
      "mobile": phoneNumber,
      "universityId": universityId,
      "faculty": faculty,
      "department": department,
      "thesisData": thesisData,
      "thesisTitle": thesisTitle,
      "scientificDegree": scientificDegree,
      "yearOfDiscussion": yearOfDiscussion,
      "numberOfPages": numberOfPages,
      "numberOfParts": numberOfParts,
      "isAvailable": isAvailable,
      "isAvailableWithChains": isAvailableWithChains,
      "availabilityType": availabilityType == true ? 1 : 0,
      "thesisFile": thesisFile == null
          ? null
          : MultipartFile.fromFileSync(thesisFile!.path,
              filename: thesisFile!.path),
      "thesisTitleFile": thesisTitleFile == null
          ? null
          : MultipartFile.fromFileSync(thesisTitleFile!.path,
              filename: thesisTitleFile!.path),
      "subjectsIndexFile": subjectsIndexFile == null
          ? null
          : MultipartFile.fromFileSync(subjectsIndexFile!.path,
              filename: subjectsIndexFile!.path),
      "arabicExtractFile": arabicExtractFile == null
          ? null
          : MultipartFile.fromFileSync(arabicExtractFile!.path,
              filename: arabicExtractFile!.path),
      "englishExtractFile": englishExtractFile == null
          ? null
          : MultipartFile.fromFileSync(englishExtractFile!.path,
              filename: englishExtractFile!.path),
      "introFile": introFile == null
          ? null
          : MultipartFile.fromFileSync(introFile!.path,
              filename: introFile!.path),
      "collectionFile": collectionFile == null
          ? null
          : MultipartFile.fromFileSync(collectionFile!.path,
              filename: collectionFile!.path),
      "quarterCollectionFile": quarterCollectionFile == null
          ? null
          : MultipartFile.fromFileSync(quarterCollectionFile!.path,
              filename: quarterCollectionFile!.path),
      "userId": userId,
      "createdBy": userId,
      "requestStatusId": 4,




    };
  }
}
