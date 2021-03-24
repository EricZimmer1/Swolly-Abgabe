import 'package:Swolly/utils/res/Applicant.dart';
import 'package:Swolly/utils/res/ProjectTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Project {

  String title;
  String id;
  String description;
  String category;
  double moneyGoal;
  String image;
  String creator;
  String created;
  String status;
  LatLng location;
  List<String> address;
  List<ProjectTask> tasks;
  List<Applicant> applications;

  Project(){
    this.moneyGoal = 00.00;
  }

  Project.ini(String title, String id, String description, String category, double moneyGoal, String image, String created, String status, double lat, double lon){
    this.title = title;
    this.id = id;
    this.description = description;
    this.category = category;
    this.moneyGoal = moneyGoal;
    this.image = image;
    this.status = status;
    this.created =
        DateTime.fromMillisecondsSinceEpoch(int.parse(created)).day.toString() + "."+
        DateTime.fromMillisecondsSinceEpoch(int.parse(created)).month.toString() + "."+
        DateTime.fromMillisecondsSinceEpoch(int.parse(created)).year.toString() + " at "+
        DateTime.fromMillisecondsSinceEpoch(int.parse(created)).hour.toString() + ":"+
        DateTime.fromMillisecondsSinceEpoch(int.parse(created)).minute.toString();
    this.location = LatLng(lat, lon);
  }

  String getTitle() {
    return title;
  }

  void setTitle(String title) {
    this.title = title;
  }

  String getId() {
    return id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getDescription() {
    return description;
  }

  void setDescription(String description) {
    this.description = description;
  }

  String getCategory(){
    return category;
  }

  void setCategory(String category){
    this.category = category;
  }

  double getMoneyGoal(){
    return moneyGoal;
  }

  void setMoneyGoal(double moneyGoal){
    this.moneyGoal = moneyGoal;
  }

  String getImage(){
    return image;
  }

  void setImage(String image){
    this.image = image;
  }

  String getCreator(){
    return creator;
  }

  void setCreator(String creator){
    this.creator = creator;
  }

  String getCreated(){
    return created;
  }

  void setCreated(String created){
    this.created = created;
  }

  String getStatus(){
    return status;
  }

  void setStatus(String status){
    this.status = status;
  }

  LatLng getLocation(){
    return location;
  }

  void setLocation(LatLng location){
    this.location = location;
  }

  List<String> getAddress(){
    return address;
  }

  void setAddress(List<String> address){
    this.address = address;
  }

  List<ProjectTask> getTasks(){
    return tasks;
  }

  void setTasks(List<ProjectTask> tasks){
    this.tasks = tasks;
  }

  List<Applicant> getApplications(){
    return applications;
  }

  void setApplications(List<Applicant> applications){
    this.applications = applications;
  }

}