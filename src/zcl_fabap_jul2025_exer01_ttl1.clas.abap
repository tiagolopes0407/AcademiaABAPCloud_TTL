CLASS zcl_fabap_jul2025_exer01_ttl1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_codprod   TYPE string
        i_nomeprod  TYPE string
        i_precoprod TYPE decfloat16.
    METHODS adicionar_estoque
      IMPORTING i_quantadicionar TYPE i.

    METHODS remover_estoque
      IMPORTING  i_quantremover TYPE i
      EXCEPTIONS ex_remove_error.

    METHODS calcula_valor
      RETURNING VALUE(r_valortotal) TYPE decfloat16.

    METHODS get_nome
      RETURNING VALUE(r_nomeprod) TYPE string.

    METHODS get_codigo
      RETURNING VALUE(r_codprod) TYPE string.

    METHODS get_preco
      RETURNING VALUE(r_precoprod) TYPE decfloat16.

    METHODS get_estoque
      RETURNING VALUE(r_estoque) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA gv_codprod TYPE string.
    DATA gv_nomeprod TYPE string.
    DATA gv_precoprod TYPE decfloat16.
    DATA gv_quantprod TYPE i.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_TTL1 IMPLEMENTATION.


  METHOD adicionar_estoque.
    gv_quantprod += i_quantadicionar.
  ENDMETHOD.    "adicionar_estoque


  METHOD calcula_valor.
    r_valortotal = gv_quantprod * gv_precoprod.
  ENDMETHOD.    "calcula_valor


  METHOD constructor.
    gv_codprod = i_codprod.
    gv_nomeprod = i_nomeprod.
    gv_precoprod = i_precoprod.
    gv_quantprod = 0.
  ENDMETHOD.    "constructor


  METHOD get_codigo.
    r_codprod = gv_codprod.
  ENDMETHOD.    "get_codigo


  METHOD get_estoque.
    r_estoque = gv_quantprod.
  ENDMETHOD.    "get_estoque


  METHOD get_nome.
    r_nomeprod = gv_nomeprod.
  ENDMETHOD.    "get_nome


  METHOD get_preco.
    r_precoprod = gv_precoprod.
  ENDMETHOD.    "get_preco


  METHOD remover_estoque.
    IF i_quantremover <= gv_quantprod.
      gv_quantprod -= i_quantremover.
    ELSE.
      "Quantidade & a remover maior que a quantidade & em estoque
      MESSAGE s001(ZFABAP_JUL2025_TTL) WITH i_quantremover
                                            gv_quantprod
        DISPLAY LIKE 'E'
        RAISING ex_remove_error.
    ENDIF.
  ENDMETHOD.    "remover_estoque
ENDCLASS.
