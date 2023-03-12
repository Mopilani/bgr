import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/users_list_model.dart';
import 'package:flutter_application_2/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          _ui(usersViewModel),
        ],
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return Container(
        child: Text(usersViewModel.usersError.toString()),
      );
    }
    if (usersViewModel.usersError != null) {
      return Container(
        child: Text(usersViewModel.usersError.toString()),
      );
    }

    // print(usersViewModel.);

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UsersListModel usersListModel = usersViewModel.usersListModel[index];
          return Container(
            child: Column(
              children: [
                Text(
                  usersListModel.name,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(usersListModel.email),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: usersViewModel.usersListModel.length,
      ),
    );
  }
}
