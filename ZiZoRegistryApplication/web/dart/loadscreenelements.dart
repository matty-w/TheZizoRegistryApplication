library elements;

import 'dart:html';
import 'listentobuttons.dart';
import 'package:ServerFunctions/ServerFunctions.dart';

class LoadScreenElements
{
  ListenToButtons ltb = new ListenToButtons();
  
  void loginPage()
  {
    ltb.listenToLoginButtons();
  }
  
  void registryMain()
  {    
    OnLoadRegistry olr = new OnLoadRegistry();
    window.onLoad.listen((Event e) => olr.loadProjectsDropdownAndExplorer("#projectDropDown", "#projectNames"));
    ltb.listenToRegistryButtons();
  }
}
