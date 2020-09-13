import 'package:globens_flutter_client/widgets/modal_views/job%20application%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class JobViewerModalView extends StatefulWidget {
  final BusinessPage businessPage;
  final Job job;

  JobViewerModalView({this.businessPage, this.job});

  @override
  _JobViewerModalViewState createState() => _JobViewerModalViewState();
}

class _JobViewerModalViewState extends State<JobViewerModalView> {
  final TextEditingController _titleTextController = TextEditingController();
  GlobensUser _employeeUser;
  bool _editMode = false;

  @override
  void initState() {
    super.initState();

    if (widget.job != null && !widget.job.isVacant)
      grpcFetchUserDetails(AppUser.sessionKey, widget.job.hiredUserId).then((res) async {
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

  @override
  Widget build(BuildContext context) {
    List<Widget> childWidgets = [];

    if (widget.job == null)
      // creating a new job (write mode)
      childWidgets.addAll([
        getTitleWidget("New vacancy details"),
        TextField(controller: _titleTextController, decoration: InputDecoration(labelText: "Please enter the new vacancy's title here", hintText: "e.g., English language teacher")),
        RaisedButton(onPressed: () => _createVacancyPressed(context), child: Text("Create"))
      ]);
    else {
      // viewing an existing job (read mode)
      childWidgets.addAll([
        getTitleWidget('Viewing a job${widget.job.isVacant ? " / vacancy" : ""}'),
        Text('Job title: "${widget.job.title}"'),
      ]);

      List<Widget> actionButtons = [];
      if (!widget.job.isVacant)
        childWidgets.add(Text('Job held by : ${_employeeUser == null ? "[loading]" : _employeeUser.isMe ? "you" : "${_employeeUser.name} (${_employeeUser.email})"}'));
      else
        childWidgets.add(RaisedButton(onPressed: () => _applyForVacancyPressed(context), child: Text("Apply for vacancy")));

      if (widget.businessPage != null && widget.businessPage.role == VacancyRole.BUSINESS_OWNER) {
        actionButtons.addAll([
          RaisedButton(onPressed: () => _viewJobApplicationsPressed(context), child: Text("View job applications")),
          RaisedButton(onPressed: _editPressed, child: Text("Edit job")),
          RaisedButton(onPressed: () => _deletePressed(context), child: Text("Delete job")),
        ]);
      }

      childWidgets.add(Wrap(
        children: actionButtons,
        alignment: WrapAlignment.center,
      ));
    }

    // ending part (padding)
    childWidgets.add(Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), child: Container()));
    return SingleChildScrollView(child: Column(mainAxisSize: MainAxisSize.min, children: childWidgets));
  }

  void _editPressed() {
    setState(() {
      _editMode = !_editMode;
    });
  }

  void _deletePressed(BuildContext context) {
    // todo add delete job functionality
  }

  void _createVacancyPressed(BuildContext context) async {
    if (_titleTextController.text.length < 2) {
      await toast("Vacancy title cannot be less than two characters");
      return;
    }

    bool success = await grpcCreateVacantJob(AppUser.sessionKey, widget.businessPage.id, Job.create(_titleTextController.text));

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
  }
}
