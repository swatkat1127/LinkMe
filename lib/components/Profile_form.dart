import 'package:flutter/material.dart';
import 'package:link_me/size_config.dart';
import 'package:link_me/constants/constants.dart';
import 'package:link_me/components/form_error.dart';
import 'package:link_me/components/default_button.dart';
import 'package:link_me/components/custom_surffix_icon.dart';
import 'package:link_me/success_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String companyName;
  String linkedInLink;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCompanyNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLinkedInLinkFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, SuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildLinkedInLinkFormField() {
    return TextFormField(
      onSaved: (newValue) => linkedInLink = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLinkedInLinkNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kLinkedInLinkNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "LinkedIn URL",
        hintText: "Enter your LinkedIn URL",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon:
        // CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildCompanyNameFormField() {
    return TextFormField(
      onSaved: (newValue) => companyName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kCompanyNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kCompanyNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Company Name",
        hintText: "Enter your company name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}