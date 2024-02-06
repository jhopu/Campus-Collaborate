import 'package:campus_collaborate/services/docs_and_images.dart';
import 'package:campus_collaborate/services/toggle_button_services.dart';
import 'package:campus_collaborate/widgets/commonWidgets/app_bar.dart';
import 'package:campus_collaborate/widgets/createProjectScreen/contributor_with_cross.dart';
import 'package:campus_collaborate/widgets/createProjectScreen/drop_down_button.dart';
import 'package:campus_collaborate/widgets/createProjectScreen/elevated_button.dart';
import 'package:campus_collaborate/widgets/createProjectScreen/form_text_field_container.dart';
import 'package:campus_collaborate/widgets/createProjectScreen/toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/createProjectScreen/docs_images.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final TextEditingController projectTitleController= TextEditingController();
  final TextEditingController domainController= TextEditingController();
  final TextEditingController descriptionController= TextEditingController();
  final TextEditingController durationController= TextEditingController();
  final formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: customAppBar('New Project', (){}),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormTextFieldContainer(hintText: 'Project Name', title: 'Project Title', textEditingController: projectTitleController,),
                FormTextFieldContainer(hintText: 'HTML, CSS, Javascript etc.', title: 'Domain', textEditingController: domainController),
                FormTextFieldContainer(hintText: 'Few words describing your project.', title: 'Description', textEditingController: descriptionController, maxLines: 8,),
                CustomDropDownButton(textEditingController: durationController),
                const SizedBox(height: 10,),
                const Text('Project Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const SizedBox(height: 5,),
                Consumer<ProjectStatusToggleButtonService>(builder: (context, service, child)=>
                  CustomToggleButton(onChange: (index){
                  service.selectButton(index!);
                }, isSelected: service.selectedList, firstToggleText: 'Active', secondToggleText: 'Inactive')
                ),
                const SizedBox(height: 10,),
                const Text('Project Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const SizedBox(height: 5,),
                Consumer<ProjectTypeToggleButtonService>(builder: (context, service, child)=>
                    CustomToggleButton(onChange: (index){
                      service.selectButton(index!);
                    }, isSelected: service.selectedList, firstToggleText: 'Individual', secondToggleText: 'Group')
                ),
                const SizedBox(height: 10,),
                const Text('Contributors', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const SizedBox(height: 10,),
                const ContributorsWithCrossListView(),
                AddElevatedButton(buttonText: 'Add Contributor', onTap: (){}, prefixImage: Image.asset('assets/button_plus.png'),),
                const SizedBox(height: 10,),
                const Text('Uploads', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const SizedBox(height: 10,),
                Consumer<DocsStateService>(builder: (context, service, child){
                  if(service.docs.isEmpty){
                    return const SizedBox(height: 0,);
                  }
                  return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: service.docs.map((docs) {
                        return DocsImagesWithCross(docsName: docs, onCrossTap: (){
                          service.removeDocs(docs);
                        },);
                      }).toList());
                }),
                AddElevatedButton(buttonText: 'Upload File', onTap: (){}, prefixImage: Image.asset('assets/upload.png'),),
                const SizedBox(height: 10,),
                const Text('Thumbnail', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const SizedBox(height: 10,),
                Consumer<ProjectImageStateService>(builder: (context, service, child){
                  if(service.images.isEmpty){
                    return const SizedBox(height: 0,);
                  }
                  return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: service.images.map((docs) {
                        return DocsImagesWithCross(docsName: docs, onCrossTap: (){
                          service.removeDocs(docs);
                        },);
                      }).toList());
                }),
                AddElevatedButton(buttonText: 'Upload New', onTap: (){}, prefixImage: Image.asset('assets/upload.png'),),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),

      ),
    ));
  }
}
