class SurveyFormResponse {
  String id;
  String title;
  SettingsBean settings;
  List<FieldsListBean> fields;
  List<ThankyouScreensListBean> thankyouScreens;
  List<WelcomeScreensListBean> welcomeScreens;

  SurveyFormResponse({this.id, this.title, this.settings, this.fields, this.thankyouScreens, this.welcomeScreens});

  SurveyFormResponse.fromJson(Map<String, dynamic> json) {    
    this.id = json['id'];
    this.title = json['title'];
    this.settings = json['settings'] != null ? SettingsBean.fromJson(json['settings']) : null;
    this.fields = (json['fields'] as List)!=null?(json['fields'] as List).map((i) => FieldsListBean.fromJson(i)).toList():null;
    this.thankyouScreens = (json['thankyou_screens'] as List)!=null?(json['thankyou_screens'] as List).map((i) => ThankyouScreensListBean.fromJson(i)).toList():null;
    this.welcomeScreens = (json['welcome_screens'] as List)!=null?(json['welcome_screens'] as List).map((i) => WelcomeScreensListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.settings != null) {
      data['settings'] = this.settings.toJson();
    }
    data['fields'] = this.fields != null?this.fields.map((i) => i.toJson()).toList():null;
    data['thankyou_screens'] = this.thankyouScreens != null?this.thankyouScreens.map((i) => i.toJson()).toList():null;
    data['welcome_screens'] = this.welcomeScreens != null?this.welcomeScreens.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class SettingsBean {
  String language;
  String progressBar;
  bool showProgressBar;

  SettingsBean({this.language, this.progressBar, this.showProgressBar});

  SettingsBean.fromJson(Map<String, dynamic> json) {    
    this.language = json['language'];
    this.progressBar = json['progress_bar'];
    this.showProgressBar = json['show_progress_bar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['progress_bar'] = this.progressBar;
    data['show_progress_bar'] = this.showProgressBar;
    return data;
  }
}

class FieldsListBean {
  String id;
  String title;
  String type;
  ValidationsBean validations;

  FieldsListBean({this.id, this.title, this.type, this.validations});

  FieldsListBean.fromJson(Map<String, dynamic> json) {    
    this.id = json['id'];
    this.title = json['title'];
    this.type = json['type'];
    this.validations = json['validations'] != null ? ValidationsBean.fromJson(json['validations']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    if (this.validations != null) {
      data['validations'] = this.validations.toJson();
    }
    return data;
  }
}

class ThankyouScreensListBean {
  String title;
  PropertiesBean properties;

  ThankyouScreensListBean({this.title, this.properties});

  ThankyouScreensListBean.fromJson(Map<String, dynamic> json) {    
    this.title = json['title'];
    this.properties = json['properties'] != null ? PropertiesBean.fromJson(json['properties']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    return data;
  }
}

class WelcomeScreensListBean {
  String title;
  PropertiesBean properties;

  WelcomeScreensListBean({this.title, this.properties});

  WelcomeScreensListBean.fromJson(Map<String, dynamic> json) {    
    this.title = json['title'];
    this.properties = json['properties'] != null ? PropertiesBean.fromJson(json['properties']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    return data;
  }
}

class PropertiesBean {
  String description;
  String buttonText;
  bool showButton;

  PropertiesBean({this.description, this.buttonText, this.showButton});

  PropertiesBean.fromJson(Map<String, dynamic> json) {    
    this.description = json['description'];
    this.buttonText = json['button_text'];
    this.showButton = json['show_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['button_text'] = this.buttonText;
    data['show_button'] = this.showButton;
    return data;
  }
}

class ValidationsBean {
  bool required;

  ValidationsBean({this.required});

  ValidationsBean.fromJson(Map<String, dynamic> json) {    
    this.required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['required'] = this.required;
    return data;
  }
}
