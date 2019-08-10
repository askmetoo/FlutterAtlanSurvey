import 'Field.dart';
import 'ThankyouScreen.dart';
import 'WelcomeScreen.dart';

class SurveyResponse {
    String id;
    String title;
    Settings settings;
    List<WelcomeScreens> welcomeScreens;
    List<ThankyouScreens> thankyouScreens;
    List<Fields> fields;

    SurveyResponse(
        {this.id,
            this.title,
            this.settings,
            this.welcomeScreens,
            this.thankyouScreens,
            this.fields});

    SurveyResponse.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        title = json['title'];
        settings = json['settings'] != null
            ? new Settings.fromJson(json['settings'])
            : null;
        if (json['welcome_screens'] != null) {
            welcomeScreens = new List<WelcomeScreens>();
            json['welcome_screens'].forEach((v) {
                welcomeScreens.add(new WelcomeScreens.fromJson(v));
            });
        }
        if (json['thankyou_screens'] != null) {
            thankyouScreens = new List<ThankyouScreens>();
            json['thankyou_screens'].forEach((v) {
                thankyouScreens.add(new ThankyouScreens.fromJson(v));
            });
        }
        if (json['fields'] != null) {
            fields = new List<Fields>();
            json['fields'].forEach((v) {
                fields.add(new Fields.fromJson(v));
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        if (this.settings != null) {
            data['settings'] = this.settings.toJson();
        }
        if (this.welcomeScreens != null) {
            data['welcome_screens'] =
                this.welcomeScreens.map((v) => v.toJson()).toList();
        }
        if (this.thankyouScreens != null) {
            data['thankyou_screens'] =
                this.thankyouScreens.map((v) => v.toJson()).toList();
        }
        if (this.fields != null) {
            data['fields'] = this.fields.map((v) => v.toJson()).toList();
        }
        return data;
    }


}

class Settings {
    String language;
    String progressBar;
    bool showProgressBar;

    Settings({this.language, this.progressBar, this.showProgressBar});

    Settings.fromJson(Map<String, dynamic> json) {
        language = json['language'];
        progressBar = json['progress_bar'];
        showProgressBar = json['show_progress_bar'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['language'] = this.language;
        data['progress_bar'] = this.progressBar;
        data['show_progress_bar'] = this.showProgressBar;
        return data;
    }
}






