class WelcomeScreens {
    String title;
    Properties properties;

    WelcomeScreens({this.title, this.properties});

    WelcomeScreens.fromJson(Map<String, dynamic> json) {
        title = json['title'];
        properties = json['properties'] != null
            ? new Properties.fromJson(json['properties'])
            : null;
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

class Properties {
    bool showButton;
    String description;
    String buttonText;

    Properties({this.showButton, this.description, this.buttonText});

    Properties.fromJson(Map<String, dynamic> json) {
        showButton = json['show_button'];
        description = json['description'];
        buttonText = json['button_text'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['show_button'] = this.showButton;
        data['description'] = this.description;
        data['button_text'] = this.buttonText;
        return data;
    }
}