library buttons;

import 'dart:html';
import 'package:PopupLibrary/PopupLibrary.dart';
import 'package:ServerFunctions/ServerFunctions.dart';

class ListenToButtons
{
  RegistryNavigation rn = new RegistryNavigation();
  GlobalNavigationFunctions gnf = new GlobalNavigationFunctions();
  RegistryActionFunctions raf = new RegistryActionFunctions();
  AddRegistry ar = new AddRegistry();
  DeleteRegistry dr = new DeleteRegistry();
  EditRegistry er = new EditRegistry();
  OnLoadRegistry olr = new OnLoadRegistry();
  PopupConstructor pc = new PopupConstructor();
  PopupSelection ps = new PopupSelection();
  
  void listenToLoginButtons()
  {
    querySelector("#submitButton").onClick.listen((MouseEvent m) => 
        gnf.basicAuthenticationLogin("#usernameTextbox", "#passwordTextbox", "Registry-Application"));
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
  }
  
  void listenToRegistryButtons()
  {
    window.onLoad.listen(olr.loadPreviousTable);
    querySelector("#homePageButton").onClick.listen(gnf.reloadPage);
    //querySelector("#helpPageButton").onClick.listen(sfoh.showHelpPage);
    querySelector("#logoutButton").onClick.listen((MouseEvent m) => rn.logoutRegistry("#registryTable", "#projectDropDown"));
    querySelector("#usernameOutput").innerHtml = window.sessionStorage['username'];
    querySelector("#projectDropDown").onChange.listen(raf.listenToBox);
    querySelector("#deleteButton").onClick.listen(dr.deleteButton);
    querySelector("#editButton").onClick.listen(er.editButton);
    querySelector("#addButton").onClick.listen(ar.addButton);
    querySelector("#no").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#yes").onClick.listen(raf.completeTask);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#popupAction").onClick.listen(olr.showConfirmPrompt);
    querySelector("#browseButton").onClick.listen(showFileExplorer);
    querySelector("#fileTypeDropDown").onChange.listen(olr.loadChosenFiles);
    querySelector("#okExplorer").onClick.listen(raf.setItem); 
    querySelector("#cancelExplorer").onClick.listen(hideExplorer);
  }
  
  void hideExplorer(MouseEvent m)
  {
    SelectElement fileFilter = querySelector("#fileTypeDropDown");
    fileFilter.disabled = true;
    pc.dismiss("#fileBrowserDiv");
    pc.show("#popUpDiv");
  }
  
  void showFileExplorer(MouseEvent m)
  {
    InputElement contentPathBox = querySelector("#browseText");
    contentPathBox.style.backgroundColor = "#FFFFFF";
    pc.dismiss("#popUpDiv");
    ps.fileExplorerPopup();
  }
}