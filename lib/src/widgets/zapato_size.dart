import 'package:fl_shoesapp/src/models/zapato_model.dart';
import 'package:flutter/material.dart';

import 'package:fl_shoesapp/src/pages/pages.dart';
import 'package:provider/provider.dart';

class ZapatoSizePreview extends StatelessWidget {
  const ZapatoSizePreview({
    Key? key,
    this.fullScreen = false
  }) : super(key: key);

  final bool fullScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => const ZapatoDescPage()
          ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5 : 30, 
          vertical: fullScreen ? 5 : 0
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: !fullScreen 
              ? BorderRadius.circular(50) 
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
          ),
          child: Column(
            children: [
              const _ZapatoConSombra(),
              if (!fullScreen)
                const _ZapatoTalla()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTalla extends StatelessWidget {
  const _ZapatoTalla({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCaja(numero: 7),
          _TallaZapatoCaja(numero: 7.5),
          _TallaZapatoCaja(numero: 8),
          _TallaZapatoCaja(numero: 8.5),
          _TallaZapatoCaja(numero: 9),
          _TallaZapatoCaja(numero: 9.5)
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  const _TallaZapatoCaja({
    Key? key,
    required this.numero
  }) : super(key: key);

  final double numero;

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = numero;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: numero == zapatoModel.talla ? const Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (numero == zapatoModel.talla)
              const BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5)
              )
          ]
        ),
        alignment: Alignment.center,
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: numero == zapatoModel.talla ? Colors.white : const Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          const Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra()
          ),
          Image(image: AssetImage(zapatoModel.assetImage))
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}