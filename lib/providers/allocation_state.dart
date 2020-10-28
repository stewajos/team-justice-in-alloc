import 'package:allocation_app/model/recipient_model.dart';
import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/services/result_mapper.dart';

class AllocationState {
  String userEmail;
  bool loading;
  bool hasError;
  List<ResultModel> allocHistList;
  List<RecipientModel> recipientList;


  AllocationState() {
    userEmail = "";
    loading = false;
    hasError = false;
    allocHistList = new List<ResultModel>();
    recipientList = new List<RecipientModel>();
  }

}