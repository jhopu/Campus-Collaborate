import 'package:campus_collaborate/services/contributor_cross.dart';
import 'package:campus_collaborate/services/docs_and_images.dart';
import 'package:campus_collaborate/services/drop_down_services.dart';
import 'package:campus_collaborate/services/toggle_button_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ResetProviders{
  static void reset(BuildContext context){
    Provider.of<ContributorCrossService>(context).resetProvider();
    Provider.of<DocsStateService>(context).resetProvider();
    Provider.of<ProjectImageStateService>(context).resetProvider();
    Provider.of<DropDownServices>(context).resetProvider();
    Provider.of<ProjectTypeToggleButtonService>(context).resetProvider();
    Provider.of<ProjectStatusToggleButtonService>(context).resetProvider();
  }
}