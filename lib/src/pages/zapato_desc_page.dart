import 'package:animate_do/animate_do.dart';
import 'package:fl_shoesapp/src/helpers/helpers.dart';
import 'package:fl_shoesapp/src/models/zapato_model.dart';
import 'package:fl_shoesapp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZapatoDescPage extends StatelessWidget {
   
  const ZapatoDescPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'zapato-1', 
                child: ZapatoSizePreview(fullScreen: true)
              ),
              Positioned(
                top: 80,
                child: GestureDetector(
                  onTap: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  child: const FloatingActionButton(
                    elevation: 0,
                    onPressed: null,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.chevron_left, color: Colors.white, size: 60),
                  ),
                ),                
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."
                  ),
                  _MontoBuyNow(),
                  _ColoresYmas(),
                  _BotonesLikeCartSettings()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(icon: Icon(Icons.favorite, color: Colors.red, size: 25)),
          _BotonSombreado(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25)),
          _BotonSombreado(icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  const _BotonSombreado({
    Key? key,
    required this.icon
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12, spreadRadius: -1, blurRadius: 20, offset: Offset(0, 10)
          )
        ]
      ),
      child: icon,
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  const _ColoresYmas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(left: 90, child: _BotonColor(color: Color(0xffC6D642), index: 4, urlImage: 'assets/verde.png')),
                Positioned(left: 60, child: _BotonColor(color: Color(0xffFFAD29), index: 3, urlImage: 'assets/amarillo.png')),
                Positioned(left: 30, child: _BotonColor(color: Color(0xff2099F1), index: 2, urlImage: 'assets/azul.png')),
                _BotonColor(color: Color(0xff364D56), index: 1, urlImage: 'assets/negro.png'),
              ],
            ),
          ),
          const BotonNaranja(texto: 'More related items', alto: 30, ancho: 170, color: Color(0xffFFC675))
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  const _BotonColor({
    Key? key,
    required this.color,
    required this.index,
    required this.urlImage,
  }) : super(key: key);

  final Color color;
  final int index;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const BotonNaranja(
                texto: 'Buy now',
                alto: 40,
                ancho: 120,
              ),
            )
          ],
        ),
      ),
    );
  }
}