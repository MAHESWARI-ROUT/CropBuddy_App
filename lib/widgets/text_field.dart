import 'package:flutter/material.dart';

class CTextField extends StatefulWidget {
  const CTextField(
      {super.key,
      required this.text,
      this.maxlen,
      this.icon,
      this.icon2,
      this.icon3,
      this.controller,
      this.isborder = true,
      this.height,
      this.isheight = false,
      this.isicon = true,
      this.isicon2 = true,
      this.isicon3 = true,this.ishidden = true,this.isKeyboardtype = false});
  final String text;
  final IconData? icon;
  final int? maxlen;
  final IconData? icon2;
  final IconData? icon3;
  final TextEditingController? controller;
  final bool isborder;
  final bool? isheight;
  final double? height;
  final bool? isicon, isicon2, isicon3;
  final bool? ishidden;
  final bool? isKeyboardtype;
  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    //final controller = TextEditingController();
    return SizedBox(
      height: widget.isheight! ? widget.height : null,
      child: TextFormField(
        keyboardType: widget.isKeyboardtype! ? TextInputType.multiline:null ,
        maxLines: widget.isKeyboardtype! ? null : 1, 
  minLines: widget.isKeyboardtype! ? 5 : 1,
        controller: widget.controller,
        obscureText:widget.ishidden! ? isPasswordHidden : false,
        maxLength: widget.maxlen,
        decoration: InputDecoration(
          border: widget.isborder
              ? OutlineInputBorder(borderRadius: BorderRadius.circular(15))
              : null,
          labelText: widget.text,
          prefixIcon: widget.isicon! ? Icon(widget.icon) : null,
          suffixIcon: IconButton(
            icon: Icon(isPasswordHidden ? (widget.isicon2! ? widget.icon2: null) : (widget.isicon3! ? widget.icon3 : null),),
            onPressed: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
          ),
        ),
      ),
    );
  }
}
