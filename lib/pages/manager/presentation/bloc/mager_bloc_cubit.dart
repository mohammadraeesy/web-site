import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_test_package/entities/massage_entity.dart';
import 'package:flutter_test_package/models/massage_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'mager_bloc_state.dart';

class ManagerBlocCubit extends Cubit<ManagerBlocState> {
  ManagerBlocCubit() : super(ManagerBlocInitial());

  Future<void> loadData() async {
    emit(ManagerBlocLoading());
    final loadedMassages = await _loadMassages();
    emit(ManagerBlocLoaded(loadedMassage: loadedMassages));
  }
  Future<void> deletePost(String id) async {
   await _deletePost(id);
   loadData();
  }
  Future<List<MassageEntity>> _loadMassages() async {
    Uri uri = Uri.parse("http://localhost/testPhp/get_api.php");
    final response = await http.Client().get(uri);
    final jsonDataAll = json.decode(response.body) as List;
    final List<MassageModel> data =
        jsonDataAll.map((s) => MassageModel.fromJson(s)).toList();
    return data;
  }

  Future<String> _deletePost(String id) async {
    Uri uri = Uri.parse("http://localhost/testPhp/delete_api.php");
    final response =
        await http.Client().post(uri, body: json.encode({"id": id}));
    return json.decode(response.body).toString();
  }
}
