import 'package:allocation_app/model/recipient_model.dart';
import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/services/result_mapper.dart';

class AllocationState {
  String userEmail;
  String savedEmail;
  String hashKey;
  bool loading;
  bool hasError;
  List<ResultModel> allocHistList;
  List<RecipientModel> recipientList;
  List<String> strHistList;


  AllocationState() {
    userEmail = "";
    savedEmail = "";
    loading = false;
    hasError = false;
    allocHistList = new List<ResultModel>();
    recipientList = new List<RecipientModel>();
    strHistList = new List<String>();

  }

}