import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_home/dashboard_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/dl_new_leads/dl_add_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_home.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
//controller for textfield
final emailcontroller=TextEditingController();
final passwordcontroller=TextEditingController();
bool _isloading=false;
bool get isloading=>_isloading;
//login function
void login(BuildContext context)async{
  if(emailcontroller.text.isEmpty || passwordcontroller.text.isEmpty){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please fill all fields")));
    return;
  }
  _isloading=true;
  notifyListeners();
  await Future.delayed(const Duration(seconds: 2));
  _isloading=false;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("login successfull")));
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DashboardScreen())); 


}
@override
void dispose(){
  emailcontroller.dispose();
  passwordcontroller.dispose();
  super.dispose();

}


}