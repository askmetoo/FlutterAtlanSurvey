import 'package:flutter_atlan_survey/modals/SurveyFormResponse.dart';
import 'ApiUrls.dart';
import 'NetworkUtils.dart';

class RestApiCalls {
  NetworkUtil netUtil = new NetworkUtil();

  Future<dynamic> getSurveyForm() {
    return netUtil.get(url: ApiUrls.SURVEY_API_URL).then((dynamic res) {
      return new SurveyFormResponse.fromJson(res);
    });
  }
}
