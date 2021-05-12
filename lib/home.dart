import 'package:bts_app_api3/model/person.dart';
import 'package:bts_app_api3/service/person_api.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final personNetworkService = PersonNetworkService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HTTP User Info',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-'
                  '1588223561402-07b22d776c7d?'
                  'ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHNwYWN'
                  'lJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&ixlib'
                  '=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: FutureBuilder(
            // initialData: 'Getting User Info',
            future: personNetworkService.fetchPersons(2),
            builder: (ctx, AsyncSnapshot<List<Results>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Card(
                          color: Colors.black.withOpacity(0.5),
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (ctx, index) {
                                var currentUser = snapshot.data[index];
                                return ListTile(
                                  title: Text(currentUser.name),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(currentUser.picture),
                                  ),
                                  trailing: Text(currentUser.phone),
                                  subtitle: Text('Email: ${currentUser.email}'),
                                );
                              }),
                        ),
                      ),
                    ),
                    SizedBox(height: 30)
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Icon(Icons.error),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
              // else {
              //   return Center(
              //       child: Icon(Icons.error, color: Colors.red, size: 50));
              // }
            },
          ),
        ),
      ),
    );
  }
}
