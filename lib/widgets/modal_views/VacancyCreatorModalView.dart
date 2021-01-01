import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'JobApplicationViewerModalView.dart';
import 'package:flutter/material.dart';

class VacancyCreatorModalView extends StatefulWidget {
  final BusinessPage businessPage;
  final Job job;

  VacancyCreatorModalView({this.businessPage, this.job});

  @override
  _VacancyCreatorModalViewState createState() => _VacancyCreatorModalViewState();
}

class _VacancyCreatorModalViewState extends State<VacancyCreatorModalView> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _descriptionTextController = TextEditingController();
  final TextEditingController _responsibilitiesController = TextEditingController();
  GlobensUser _employeeUser;
  bool _appliedForVacancy;

  @override
  void initState() {
    super.initState();

    if (widget.job != null) {
      if (widget.job.isVacant) {
        grpcFetchJobApplications(AppUser.sessionKey, widget.job).then((res) {
          bool success = res.item1;
          if (success) {
            List<JobApplication> jobApplications = res.item2;
            for (JobApplication jobApplication in jobApplications)
              if (jobApplication.applicantId == AppUser.id) {
                setState(() {
                  _appliedForVacancy = true;
                });
                return;
              }
            setState(() {
              _appliedForVacancy = false;
            });
          } else
            AppUser.signOut().then((value) => Navigator.of(context).pushReplacementNamed('/'));
        });
      } else
        grpcFetchUserDetails(AppUser.sessionKey, widget.job.hiredUser.id).then((res) async {
          bool success = res.item1;
          GlobensUser user = res.item2;

          if (success) {
            setState(() {
              _employeeUser = user;
            });
          } else {
            await AppUser.signOut();
            await Navigator.of(context).pushReplacementNamed('/');
          }
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childWidgets = [];

    if (widget.job == null)
      // creating a new job (write mode)
      childWidgets.addAll([
        getTitleWidget("New vacancy details"),
        TextField(controller: _titleTextController, decoration: InputDecoration(border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.red, width: 10)), labelText: "Please enter the new vacancy's title here", hintText: "e.g., English language teacher")),
        TextField(maxLines: 5, controller: _descriptionTextController, decoration: InputDecoration(border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.red)), labelText: "Please enter the new  vacancy's description  here", hintText: "e.g.The best position ")),
        TextField(controller: _responsibilitiesController, decoration: InputDecoration(border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.red)), labelText: "Please enter responsibilities here", hintText: "e.g.coding, cleaning...")),
        RaisedButton(onPressed: () => _createVacancyPressed(context), child: Text("Create a vacant position"))
      ]);
    else {
      // viewing an existing job (read mode)
      childWidgets.addAll([
        getTitleWidget('Viewing a job${widget.job.isVacant ? " / vacancy" : ""}'),
        Text('Job title: "${widget.job.title}"'),
      ]);

      if (widget.job.isVacant) {
        // vacancy application button
        if (_appliedForVacancy != null) {
          if (_appliedForVacancy)
            childWidgets.add(Text("You have already applied for this vacancy"));
          else
            childWidgets.add(RaisedButton(onPressed: () => _applyForVacancyPressed(context), child: Text("Apply for vacancy")));
        }

        // viewing job applications for the position
        if (widget.businessPage != null && widget.businessPage.role == Job.BUSINESS_OWNER_ROLE) {
          childWidgets.add(RaisedButton(onPressed: () => _viewJobApplicationsPressed(context), child: Text("View job applications")));
        }
      } else
        childWidgets.add(Text('Job held by : ${_employeeUser == null ? "[loading]" : _employeeUser.isMe ? "you" : "${_employeeUser.name} (${_employeeUser.email})"}'));
    }

    // ending part (padding)
    childWidgets.add(Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), child: Container()));
    return SingleChildScrollView(child: Column(children: childWidgets));
  }

  void _createVacancyPressed(BuildContext context) async {
    if (_titleTextController.text.length < 2) {
      await toast("Vacancy title cannot be less than two characters");
      return;
    }

    bool success = await grpcCreateVacantJob(
      AppUser.sessionKey,
      widget.businessPage,
      Job.create(_titleTextController.text, description: _descriptionTextController.text, responsibilities: _responsibilitiesController.text),
    );

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _applyForVacancyPressed(BuildContext context) async {
    await showModalBottomSheet(context: context, builder: (context) => JobApplicationViewerModalView(job: widget.job));
    Navigator.of(context).pop();
  }

  void _viewJobApplicationsPressed(BuildContext context) async {
    // only business owner must be able to see the following screen
    await Navigator.of(context).pushNamed('/business_page_details/job_applications_list', arguments: {'job': widget.job, 'businessPage': widget.businessPage});
    Navigator.of(context).pop();
  }
}
