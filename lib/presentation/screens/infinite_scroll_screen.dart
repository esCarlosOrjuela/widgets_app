import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}
class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesId = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() { 
      /// la posición actual mas 500px >= a la posición max del scroll
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent)
      {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {

    if(isLoading) return;
  
    isLoading = true;
    setState(() { });

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if(!isMounted) return;
    setState(() { });

    moveScrollToBotton();
  }

  Future<void> onRefresh() async {

    isLoading = true;
    setState(() { });

    await Future.delayed(const Duration(seconds: 3));

    if(!isMounted) return;

    final lastId = imagesId.last;
    isLoading = false;
    imagesId.clear();
    imagesId.add(lastId + 1);
    addFiveImages();

    setState(() { });
  }

  void addFiveImages(){
    final lastId = imagesId.last;
    imagesId.addAll(
      [1,2,3,4,5].map((e) => (lastId + e))
    );
    /*
      Es lo mismo que codificar:
        imagesId.addAll(lastId + 1);
        imagesId.addAll(lastId + 2);
        imagesId.addAll(lastId + 3);
        imagesId.addAll(lastId + 4);
    */
  }

  void moveScrollToBotton(){
    if((scrollController.position.pixels + 100) <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      (scrollController.position.pixels + 120), 
      duration: const Duration(seconds: 2), 
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding( // ocupar toda la pantalla del dipositivo
        context: context,
        removeTop: true, // remieve el espacio de la barra de estados
        removeBottom: true, // remieve el espacio de la parte inferior, barra de acciones
        child: RefreshIndicator(
          edgeOffset: 20,
          strokeWidth: 2,
          onRefresh: ()=> onRefresh(),
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesId.length,
            itemBuilder: (context, index) {
              return FadeInImage( // muestra un placeholder mientras se carga la imagen 
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesId[index]}/500/300')
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: (isLoading) 
          ? const CircularProgressIndicator() 
          : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
        onPressed: () => context.pop(),
      ),
    );
  }
}