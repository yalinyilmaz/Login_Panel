import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/model/all_providers.dart';



class ListParticipant extends ConsumerWidget {
  const ListParticipant({super.key}); 

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    var list = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            ref.watch(tokenProvider.notifier).tokensil();
        },
        icon: const Icon(Icons.logout))],
        backgroundColor: Colors.amberAccent.withOpacity(.4),
        centerTitle: true,
        title: const Text("Participant List"),
      ),
      body: SafeArea(
        child: list.when(
          data: (list){
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical:15),
                  child: ListTile(
                    title: Text(list[index].firstName! + " " +list[index].lastName!,
                      style: const TextStyle(fontSize: 20),),
                    leading: Container(
                      width: 55,
                      //decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.network(list[index].avatar!,fit: BoxFit.fitHeight,),
                    )
                  ),
                );
              },
            );
          }, 
          error:  (err, stack) {
            return Center(
              child: Text('hata cıktı ${err.toString()}'),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
      ),
    ),
    ),
    );
  }
}