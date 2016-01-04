library buttons;

import 'dart:html';
import 'package:PopupLibrary/PopupLibrary.dart';
import 'package:ServerFunctions/ServerFunctions.dart';

class ListenToButtons
{
  NavigationFunctions navigate = new NavigationFunctions();
  ActionFunctions af = new ActionFunctions();
  AddRegistry ar = new AddRegistry();
  DeleteRegistry dr = new DeleteRegistry();
  EditRegistry er = new EditRegistry();
  LoadFunctions lf = new LoadFunctions();
  PopupConstructor pc = new PopupConstructor();
  PopupSelection ps = new PopupSelection();
  
  void listenToLoginButtons()
  {
    querySelector("#submitButton").onClick.listen(navigate.loginRegistry);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
  }
  
  void listenToRegistryButtons()
  {
    window.onLoad.listen(lf.loadPreviousTable);
    querySelector("#homePageButton").onClick.listen(navigate.reloadPage);
    //querySelector("#helpPageButton").onClick.listen(sfoh.showHelpPage);
    querySelector("#logoutButton").onClick.listen(navigate.logoutRegistry);
    querySelector("#usernameOutput").innerHtml = window.sessionStorage['username'];
    querySelector("#projectDropDown").onChange.listen(af.listenToBox);
    querySelector("#deleteButton").onClick.listen(dr.deleteButton);
    querySelector("#editButton").onClick.listen(er.editButton);
    querySelector("#addButton").onClick.listen(ar.addButton);
    querySelector("#no").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#yes").onClick.listen(af.completeTask);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#popupAction").onClick.listen(lf.showConfirmPrompt);
    querySelector("#browseButton").onClick.listen(showFileExplorer);
    querySelector("#fileTypeDropDown").onChange.listen(lf.loadChosenFiles);
    querySelector("#okExplorer").onClick.listen(af.setItem); 
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