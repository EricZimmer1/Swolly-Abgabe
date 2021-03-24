import 'package:Swolly/utils/res/Applicant.dart';

class ProjectTask {

  String id;
  String title;
  String description;
  String supportersNeeded;
  String supportersNow;
  List<Applicant> applicants;

  ProjectTask(String id, String title, String description, String supportersNeeded, String supportersNow,List<Applicant> applicants){
    this.id = id;
    this.title = title;
    this.description = description;
    this.supportersNeeded = supportersNeeded;
    this.supportersNow = supportersNow;
    this.applicants = applicants;
  }

  ProjectTask.userTaskIni(){
    this.title = "";
    this.description = "";
    this.supportersNeeded = "";
  }

  ProjectTask.userTask(String title, String description, String supportersNeeded){
    this.title = title;
    this.description = description;
    this.supportersNeeded = supportersNeeded;
  }

  ProjectTask.iniAdd(){
    this.title = "ADD_INITIAL_LIST";
    this.description = "ADD_INITIAL_LIST";
    this.supportersNeeded = "0";
  }

  void setId(String id){
    this.id = id;
  }

  String getId() {
    return id;
  }

  void setTitle(String title){
    this.title = title;
  }

  String getTitle() {
    return title;
  }

  void setDescription(String description){
    this.description = description;
  }

  String getDescription() {
    return description;
  }

  void setSupportersNeeded(String supportersNeeded){
    this.supportersNeeded = supportersNeeded;
  }

  String getSupportersNeeded(){
    return supportersNeeded;
  }

  void setSupportersNow(String supportersNow){
    this.supportersNow = supportersNow;
  }

  String getSupportersNow(){
    return supportersNow;
  }

  void setApplications(List<Applicant> applicants){
    this.applicants = applicants;
  }

  List<Applicant> getApplications() {
    return applicants;
  }

}