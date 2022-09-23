import 'package:flutter/material.dart';


Widget defaultField({
  required TextEditingController controller,
  required TextInputType type,
  required String text,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (String? value){
        if(value!.isEmpty){
          return 'Please enter your data';
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1,), borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.deepOrange), borderRadius: BorderRadius.circular(10)),
        label: Text(text, style: const TextStyle(color: Colors.black),),
      ),
    );


Widget passWordField({
  required TextEditingController controller,
  required String text,
  required IconButton iconButton,
  bool? isPassword,
  FormFieldValidator? validator,
  required TextInputType type
}){
  return TextFormField(
    controller: controller,
    obscureText: isPassword!,
    keyboardType: type,
    validator: validator,
    decoration: InputDecoration(
      //errorText: 'Please Enter Your Password',
      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1, ), borderRadius: BorderRadius.circular(10),),
      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.deepOrange,), borderRadius: BorderRadius.circular(10),),
      label: Text(text, style: const TextStyle(color: Colors.black),),
      suffixIcon: iconButton,
    ),
  );
}

Widget  or(){
  return Row(
    children: const [
      Expanded(child: Divider(thickness: 1, endIndent: 15, indent: 15,)/*Container(height: 3,color: const Color(darkGreyColor)*/),
      Text('OR', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      SizedBox(width: 10,),
      Expanded(child: Divider(thickness: 1, endIndent: 15, indent: 10,)/*Container(height: 3,color: const Color(darkGreyColor)*/),
    ],
  );
}


