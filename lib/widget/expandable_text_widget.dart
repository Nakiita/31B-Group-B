import 'package:flutter/cupertino.dart';

import '../Utilis/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String Text;
  const ExpandableTextWidget({Key? key, required this.Text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenTrue= true;

  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
