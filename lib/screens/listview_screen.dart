import 'dart:async';
import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final List<int> _llistaNombres = [];
  int _darrerItem = 0;
  bool _isLoading = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _carregaNou();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 100 >= _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Evita fugues de memòria
    super.dispose();
  }

  void _carregaNou() {
    for (int i = 0; i < 5; i++) {
      _darrerItem++;
      _llistaNombres.add(_darrerItem);
    }
    setState(() {});
  }

  Future<void> fetchData() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    Timer(const Duration(seconds: 2), () {
      _isLoading = false;
      _carregaNou();
      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  Future<void> _obtenirPagina() async {
    await Future.delayed(const Duration(seconds: 2));
    _llistaNombres.clear();
    _darrerItem = 0;
    _carregaNou();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Llistes i Scroll Infinit')),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _obtenirPagina,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _llistaNombres.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage('https://picsum.photos/id/${_llistaNombres[index]}/500/300'),
                  fit: BoxFit.cover,
                  height: 220,
                );
              },
            ),
          ),
          if (_isLoading)
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}