// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
      ),
      
    );
  }
}