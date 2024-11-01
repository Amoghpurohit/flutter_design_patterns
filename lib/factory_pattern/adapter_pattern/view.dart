
import 'package:design_patterns/factory_pattern/adapter_pattern/adapter_method.dart';
import 'package:flutter/material.dart';

class AdapterView extends StatelessWidget {
  const AdapterView({super.key});

  @override
  Widget build(BuildContext context) {

    Output output = Output();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: output.combinedOutput().length,
              itemBuilder: (context, index){
                final data = output.combinedOutput()[index];
              return ListTile(
                title: Text(data.title),
                subtitle: Text(data.bio),
              );
            }),
          )
        ],
      ),
    );
  }
}