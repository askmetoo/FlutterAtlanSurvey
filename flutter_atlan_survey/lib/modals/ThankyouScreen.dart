class ThankyouScreens {
    String title;
    Properties properties;
    Attachment attachment;

    ThankyouScreens({this.title, this.properties, this.attachment});

    ThankyouScreens.fromJson(Map<String, dynamic> json) {
        title = json['title'];
        properties = json['properties'] != null
            ? new Properties.fromJson(json['properties'])
            : null;
        attachment = json['attachment'] != null
            ? new Attachment.fromJson(json['attachment'])
            : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['title'] = this.title;
        if (this.properties != null) {
            data['properties'] = this.properties.toJson();
        }
        if (this.attachment != null) {
            data['attachment'] = this.attachment.toJson();
        }
        return data;
    }
}

class Properties {
    bool showButton;
    bool shareIcons;
    String buttonMode;
    String buttonText;

    Properties(
        {this.showButton, this.shareIcons, this.buttonMode, this.buttonText});

    Properties.fromJson(Map<String, dynamic> json) {
        showButton = json['show_button'];
        shareIcons = json['share_icons'];
        buttonMode = json['button_mode'];
        buttonText = json['button_text'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['show_button'] = this.showButton;
        data['share_icons'] = this.shareIcons;
        data['button_mode'] = this.buttonMode;
        data['button_text'] = this.buttonText;
        return data;
    }
}

class Attachment {
    String type;
    String href;

    Attachment({this.type, this.href});

    Attachment.fromJson(Map<String, dynamic> json) {
        type = json['type'];
        href = json['href'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['type'] = this.type;
        data['href'] = this.href;
        return data;
    }
}