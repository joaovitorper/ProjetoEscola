import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// Design System do projeto.

abstract final class EscolaDS {
static const Color azul = Color(0xFF2563EB);
static const Color azulEscuro = Color(0xFF1E3A8A);
static const Color fundo= Color(0xFFEEF2F7);
static const Color superficie= Color(0xFFFFFFFF);
static const Color campo= Color(0xFFFFFFFF);
static const Color text= Color(0xFF333333);
static const Color secundaria= Color(0xFF555555);
static const Color borda= Color(0xFFDDDDDD);
static const Color  desabilitado= Color(0xFFD1D5DB);
static const Color  textoDesabilitado= Color(0xFF6B7280);
static const Color  verde= Color(0xFF16A34A);
static const Color  vermelho= Color(0xFFDC2626);

static const s8 =8.0;
static const s16 =16.0;
static const s24 = 24.0;

static const raioCampo= 12.0;
static const raioBotao= 12.0;
static const raioCartao= 20.0;

static BoxDecoration get cartao => BoxDecoration(
  color: superficie,
  borderRadius: BorderRadius.circular(raioCartao),
  boxShadow: const[
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 30,
      offset: Offset(0, 10),
    ),
  ],
);
 
 static TextStyle get corpo => 
 GoogleFonts.inter(fontSize: 16, height: 1.5, color: secundaria);
  static TextStyle get rotulo => GoogleFonts.inter(
  fontSize: 16,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: text,
  );
  
  static TextStyle get botao => GoogleFonts.inter(
    fontSize: 14,
    height: 20/14,
    fontWeight: FontWeight.w400
  );
   static TextStyle get titulo => GoogleFonts.inter(
    fontSize: 26,
    height: 20/14,
    fontWeight: FontWeight.w700,
    color: azulEscuro,
   );

}





