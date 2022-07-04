import 'package:flutter/material.dart';

import 'package:fl_shoesapp/src/widgets/widgets.dart';

class ZapatoPage extends StatelessWidget {
   
  const ZapatoPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(texto: 'For you'),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  Hero(
                    tag: 'zapato-1' ,
                    child: ZapatoSizePreview()
                  ),
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."
                  ),
                ]
              ),
            )
          ),
          const AgregarCarritoBoton(monto: 180.0)
        ],
      ),
    );
  }
}