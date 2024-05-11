import 'package:flutter/material.dart';

class FromContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldkey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

const FromContainerWidget(
  {
    super.key,
     this.controller,
     this.fieldkey,
     this.isPasswordField,
     this.hintText,
     this.labelText,
     this.helperText,
     this.onSaved,
     this.validator,
     this.onFieldSubmitted,
     this.inputType
     });
     
  @override
  State<FromContainerWidget> createState() => _FromContainerWidgetState();
}

class _FromContainerWidgetState extends State<FromContainerWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge, // we added this line because the BorderRadius was not work
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10.0),
      ),
      // child: new TextFormField(
      child: TextFormField(
        style: const TextStyle(color: Colors.blue),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldkey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        // decoration: new InputDecoration(
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.black45),
            // suffixIcon: new GestureDetector(
              suffixIcon: GestureDetector(
              onTap: (){
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: widget.isPasswordField == true? Icon(_obscureText? Icons.visibility_off : Icons.visibility, color: _obscureText == false ? Colors.blue: Colors.grey,): const Text(''),
            ),

            
        ),       
      ),

    );
  }
}