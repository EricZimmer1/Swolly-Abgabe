class Applicant{

  String name;
  String id;
  String email;
  String expose;
  bool accepted;
  String correspondingTaskName;
  String correspondingTaskDescription;
  String correspondingSupporterGoal;
  String correspondingSupporterCount;

  Applicant.applicantIni(String name, String id, String email, String expose, bool accepted){
    this.name = name;
    this.id = id;
    this.email = email;
    this.expose = expose;
    this.accepted = accepted;
  }

  Applicant.applicationListIni(String name, String id, String email, String expose, bool accepted, String taskName, String taskDescription, String supporterGoal, String supporterCount){
    this.name = name;
    this.id = id;
    this.email = email;
    this.expose = expose;
    this.accepted = accepted;
    this.correspondingTaskName = taskName;
    this.correspondingTaskDescription = taskDescription;
    this.correspondingSupporterGoal = supporterGoal;
    this.correspondingSupporterCount = supporterCount;
  }

  String getName(){
    return name;
  }

  void setName(String name){
    this.name = name;
  }

  String getId(){
    return id;
  }

  void setId(String id){
    this.id = id;
  }

  String getEmail(){
    return email;
  }

  void setEmail(String email){
    this.email = email;
  }

  String getExpose(){
    return expose;
  }

  void setExpose(String expose){
    this.expose = expose;
  }

  bool getAccepted(){
    return accepted;
  }

  void setAccepted(bool accepted){
    this.accepted = accepted;
  }

  void setCorrespondingTaskName(String correspondingTaskName){
    this.correspondingTaskName = correspondingTaskName;
  }

  String getCorrespondingTaskName(){
    return correspondingTaskName;
  }

  void setCorrespondingTaskDescription(String correspondingTaskDescription){
    this.correspondingTaskDescription = correspondingTaskDescription;
  }

  String getCorrespondingTaskDescription(){
    return correspondingTaskDescription;
  }

  void setCorrespondingSupporterGoal(String correspondingSupporterGoal){
    this.correspondingSupporterGoal = correspondingSupporterGoal;
  }

  String getCorrespondingSupporterGoal(){
    return correspondingSupporterGoal;
  }

  void setCorrespondingSupporterCount(String correspondingSupporterCount){
    this.correspondingSupporterCount = correspondingSupporterCount;
  }

  String getCorrespondingSupporterCount(){
    return correspondingSupporterCount;
  }



}