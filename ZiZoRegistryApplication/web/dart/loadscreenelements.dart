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
    LoadFunctions lf = new LoadFunctions();
    window.onLoad.listen(lf.loadProjects);
    ltb.listenToRegistryButtons();
  }
}
