import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/list_model.dart';

class SuggestBuyBook extends StatelessWidget {
  final OurServicesModel model;
  const SuggestBuyBook({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: Container(
        color: Colors.yellowAccent,
      ),
    );
  }
}
