import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/model/all_providers.dart';
import 'package:voco_case_study/view/login_page.dart';
import 'package:voco_case_study/view/participant_list.dart';




void main() {
  runApp(const ProviderScope(child:  VocoApp()));

}


class VocoApp extends ConsumerWidget {
  const VocoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref){

    ref.watch(tokenProvider.notifier).tokengetir();
    var token = ref.watch(tokenProvider);

    return  MaterialApp(
      title: "Voco Case Study App",
      theme:ThemeData(primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: token == null ? const LoginPage() :const ListParticipant()
    );
  }
}

